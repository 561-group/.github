# GitHub operating model — source-integrated five-organization defaults

**Original work:** [561 Group .github #13](https://github.com/561-group/.github/issues/13). **Source owner:** 561 Group. **Status (2026-10-29):** all five original `.github` publishers have merged native contributor defaults and passed real source checks. Organization settings, effective downstream issue choosers, protected branches, security controls, and private software CI remain **separate and unverified**.

The source-owned control register is [data/github-controls.json](../data/github-controls.json). The register distinguishes a normative upstream clause, a proposed local control, verification evidence, and unknown or unimplemented settings. Each actual organization's `.github` remains its GitHub-native default publisher; copying files cannot configure org-level issue types, security features, permissions, runner policies, Projects, rulesets, or code owners.

## Verified source adoption (2026-10-29)

The exact merged source and post-merge native GitHub Actions receipts are machine-readable in [data/github-controls.json](../data/github-controls.json) under `adoption`. All five public organization publishers have the expected forms and reusable workflow; each post-merge Actions run succeeded. Coesite's original operations-custody also succeeded and the Newswire/seller workflows remain unchanged. This is source and workflow receiving, **not** independent human review, runtime security configuration, private runner recovery, effective issue chooser acceptance, or SLSA/OpenSSF certification.

An original downstream member cutover removes the four identical local legacy issue forms and thereby admits GitHub's organization defaults; [Lenticule science #386](https://github.com/lenticule-science/science-services-section/pull/386) is the first source-merged case. The three original member repositories (Lenticule Science science-services-section #386, Group internal-services-section #708, and Coesite operations-services-section #487) have each now merged the same four-deletion cutover, and GitHub readback confirms their local form directory is absent on `main`. Effective private issue-chooser rendering remains unobserved. Other service-specific overrides, including Red Cup's `561.group` submission route, remain intentionally intact. Historic issues and Git evidence are preserved. Local overrides in other repos need case-by-case source, effect, and customer receiving; do not delete service-specific public intake without first moving its unique obligations.

## Source and boundaries

The five existing publishers are [561 Group](https://github.com/561-group/.github), [Lenticule Science](https://github.com/lenticule-science/.github), [Red Cup Engineering](https://github.com/red-cup-engineering/.github), [Coesite Operations](https://github.com/coesite-operations/.github), and [Causeway Services](https://github.com/causeway-services/.github). Maintain organization-specific governance, license, branding and contact routes; do not replace active Coesite operational workflows or Causeway Bazaar seller/buyer workflows and forms with generic CI or generic commerce intake.

Use native GitHub organization defaults only for repositories with no local override. **A repository with its own `.github/ISSUE_TEMPLATE` templates or config does not inherit any default issue templates**; individual local overrides must be reviewed rather than silently overwritten. Own LICENSE files always govern. CODEOWNERS is repository-local, not a default owner assignment. No default file establishes runtime rights, native Work, deployment, release or acceptance.

For contribution intake, provide simple Bug and Feature forms and a distinct maintainer Task; do not require external reporters to know institutional identifiers. Security uses a private channel; commercial inquiries use service-owned customer intake. Review PRs for source and behavior, checks, risks and remaining receiving, without auto-inventing approval. Project state, issue types, labels and Group Work have separate meanings.

## Applicability and verification

Classify each repository as software/library, deployed service, infrastructure/operations, research, content/data, or corporate/defaults, plus private/public and active/experimental/archived. Select checks and deployment gates according to the actual class, threat model and supported plan—not a one-size-fits-all Actions file. Inspect applicable org/repo rules and actual enabled settings before claiming protection. A failing required Actions check is not made green by an unexecuted local test.

For private repositories with exhausted hosted-runner minutes, avoid speculative retries; validate safely outside Actions when possible and retain the unavailable **hosted CI** gate. Public-repository standard hosted runners are currently free under GitHub's published billing terms, but real execution must still be checked per workflow and repository. Do not turn a source commit into a deployment receipt.

### Observed runner states and original CI owners (2026-10-29)

Do not collapse every red check into a quota diagnosis. The authoritative five-run sample is in [data/github-controls.json](../data/github-controls.json) under `ciObservations`. Group **internal-services-section** completed custody on a repo-scoped `self-hosted, bare-cedar-fog` runner; **Coesite Operations** completed custody on public hosted execution. By contrast, Lenticule **science-services-section** and Red Cup **signcell** had failed private-hosted jobs with **zero executed steps**. Those failures justify checking entitlement/runner eligibility, not a fictional source test failure. Historical Bare Cedar Fog release **ran** on a self-hosted runner and failed in PNPM's strict ignored-build policy during assembly; its original dependency-policy decision was separately recorded at [BCF services #595](https://github.com/561-group/561-group-bare-cedar-fog-services-section/issues/595).

Recover private CI under its **existing** engineering owner: [Red Cup continuous delivery](https://github.com/red-cup-engineering/continuous-delivery-engineering-services-section) and [existing GitHub Engineering P0 #7](https://github.com/red-cup-engineering/github-engineering-services-section/issues/7), where a CircleCI Free source configuration and existing GitHub App were previously reported, but an actual private project, allowed repository selections, remaining Free quota and independent complete consumer tests are still unverified. Do not create a second runner controller, mirror private source into a public repository, spend unapproved cloud or Actions credits, or treat a hypothetical CircleCI project as an execution receipt. An organization runner grant is a separate administrative/host isolation act, not a `runs-on` string change.


For each adoption PR: record base and head SHAs, exact changed files, local template override inventory, cross-organization compatibility, test method, an independent reviewer, and post-merge visibility in a real eligible consumer. Keep unverified or unauthorized settings separately outstanding. Roll back by reverting the affected defaults or organization-specific projection; do not delete historical issues or existing operating evidence.

## References

- [GitHub default community health files](https://docs.github.com/en/communities/setting-up-your-project-for-healthy-contributions/creating-a-default-community-health-file)
- [GitHub issue forms and template chooser](https://docs.github.com/en/communities/using-templates-to-encourage-useful-issues-and-pull-requests/configuring-issue-templates-for-your-repository)
- [OpenSSF OSPS Baseline v2026.08.28](https://baseline.openssf.org/versions/2026-08-28)
- [NIST SSDF v1.1 final](https://csrc.nist.gov/pubs/sp/800/218/final)
- [SLSA v1.2](https://slsa.dev/spec/v1.2/)
- [GitHub Actions billing](https://docs.github.com/en/billing/concepts/product-billing/github-actions)
