require 'yaml'
require 'json'
require 'uri'
require 'set'

root = File.expand_path(ARGV.fetch(0, '.'))
abort 'Refusing missing checkout' unless File.directory?(File.join(root, '.github'))

def demand(ok, message)
  abort "Community defaults invalid: #{message}" unless ok
end

def yaml_file(path)
  YAML.safe_load(File.read(path, encoding: 'UTF-8'), permitted_classes: [], aliases: false)
rescue Psych::Exception => e
  abort "Invalid YAML #{path}: #{e.message}"
end

forms = Dir.glob(File.join(root, '.github/ISSUE_TEMPLATE/*.{yml,yaml}')).sort
forms.reject! { |path| File.basename(path) == 'config.yml' }
demand(forms.any?, 'at least one issue form is required')
forms.each do |path|
  form = yaml_file(path)
  demand(form.is_a?(Hash), "#{path}: top-level mapping required")
  %w[name description].each { |key| demand(form[key].is_a?(String) && !form[key].strip.empty?, "#{path}: missing #{key}") }
  demand(form['body'].is_a?(Array) && !form['body'].empty?, "#{path}: body is empty")
  ids = Set.new
  interactive = 0
  form['body'].each_with_index do |field, index|
    demand(field.is_a?(Hash), "#{path}: field #{index} is not a mapping")
    type = field['type']
    demand(%w[markdown input textarea dropdown checkboxes].include?(type), "#{path}: unsupported type #{type.inspect}")
    attrs = field['attributes']
    demand(attrs.is_a?(Hash), "#{path}: field #{index} missing attributes")
    if type == 'markdown'
      demand(attrs['value'].is_a?(String) && !attrs['value'].empty?, "#{path}: empty markdown")
      next
    end
    interactive += 1
    id = field['id']
    demand(id.is_a?(String) && id.match?(/\A[a-z0-9][a-z0-9_-]*\z/), "#{path}: invalid field id")
    demand(!ids.include?(id), "#{path}: duplicate field id #{id}")
    ids.add(id)
    demand(attrs['label'].is_a?(String) && !attrs['label'].strip.empty?, "#{path}: missing field label")
    if type == 'dropdown' || type == 'checkboxes'
      demand(attrs['options'].is_a?(Array) && attrs['options'].any?, "#{path}: missing options")
    end
    if field.key?('validations')
      demand(field['validations'].is_a?(Hash), "#{path}: invalid validations")
      flag = field['validations']['required']
      demand(flag == true || flag == false || flag.nil?, "#{path}: required must be Boolean")
    end
  end
  demand(interactive.positive?, "#{path}: no interactive fields")
end

config_path = File.join(root, '.github/ISSUE_TEMPLATE/config.yml')
if File.file?(config_path)
  config = yaml_file(config_path)
  demand(config.is_a?(Hash), 'config must be a mapping')
  blank = config['blank_issues_enabled']
  demand(blank == true || blank == false, 'blank_issues_enabled must be Boolean')
  Array(config['contact_links']).each do |link|
    demand(link.is_a?(Hash) && link['name'].is_a?(String) && link['about'].is_a?(String), 'invalid contact link')
    uri = URI.parse(link.fetch('url', ''))
    demand(uri.is_a?(URI::HTTPS) && !uri.host.to_s.empty?, 'contact URL must be HTTPS')
  rescue URI::InvalidURIError
    abort 'Community defaults invalid: malformed contact URL'
  end
end

pr_path = File.join(root, '.github/PULL_REQUEST_TEMPLATE.md')
if File.file?(pr_path)
  pr = File.read(pr_path, encoding: 'UTF-8')
  demand(pr.match?(/verification/i) && pr.match?(/risk/i) && pr.match?(/unfinished/i), 'PR template must cover evidence, risk, and remaining obligations')
end

register = File.join(root, 'data/github-controls.json')
if File.file?(register)
  data = JSON.parse(File.read(register, encoding: 'UTF-8'))
  demand(data['schema'] == '561.github-operating-controls/v1', 'unexpected control register schema')
  demand(data.dig('baseline', 'version') == '2026.08.28', 'baseline version changed without qualification')
  ids = data.fetch('controls').map { |row| row.fetch('sourceId') }
  demand(ids.uniq.size == ids.size && ids.all? { |id| id.match?(/\AOSPS-[A-Z]{2}-\d{2}\.\d{2}\z/) }, 'invalid or duplicate upstream controls')
  houses = data.fetch('observedDefaults').map { |row| row.fetch('org') }
  expected = %w[561-group lenticule-science red-cup-engineering coesite-operations causeway-services]
  demand(houses.sort == expected.sort, 'five organization sources are missing or duplicated')
end

security = File.join(root, 'SECURITY.md')
demand(File.file?(security) && File.read(security).match?(/privat/i), 'private vulnerability route not documented')
puts "Verified #{forms.size} native forms, contributor/security routing, and #{File.file?(register) ? 'source control register' : 'organization projection'}"
