# Using these workflows

## Initial Setup
- [ ] Navigate to Your Repository > Settings > Secrets and Actions > Actions
- [ ] Create a Repository Secret called `DEV_HUB_AUTH_URL` and store your Dev Hub's `sfdxAuthUrl`. 
- [ ] [OPTIONAL] Update `SANDBOX_ORG_AUTH_URL` and store your UAT Org's `sfdxAuthUrl`.
- [ ] [OPTIONAL] Update `PROD_ORG_AUTH_URL` and store your Production Org's `sfdxAuthUrl`.

([How do I obtain an `sfdxAuthUrl`?](https://github.com/Nimba-Solutions/.github/wiki/Obtain-an-SFDX-Auth-URL))

## Releases

### [Recommended] Release this project using the Built-in CICD Actions

#### [Automatic] Generate Feature Test Packages & Beta Packages
1. [Contribute to this Project](https://github.com/Nimba-Solutions/NYS-Foundations/blob/main/README.md#development) normally.
2. Confirm that the built-in GitHub Actions are running when Tasks are submitted for testing:
   -  `Test Feature (Unlocked)` should run when a `feature/**` Pull Request is opened, or subsequent commits are made.
   -  `Beta - Create (Unlocked)` should run when any Pull Request is made against the `main` branch.

#### [Manual] Promote the Latest Beta Package
1. Navigate to Your Repository > Actions > `Beta - Promote (Unlocked)`.
2. Click `Run Workflow`.
3. Confirm.

#### [Manual] Install the Latest Promoted Package
1. Navigate to Your Repository > Actions > `Package - Install (Unlocked)`.
2. Click `Run Workflow`.
3. Select `Sandbox` or `Production`.
4. Confirm.

Note: Depending on the configuration of your GitHub Organization, you may need to specify some or all of the additional permissions for these workflows to run successfully:

```yml
permissions:
  actions: write
  attestations: write
  checks: write
  contents: write
  deployments: write
  discussions: write
  issues: write
  packages: write
  pages: write
  pull-requests: write
  repository-projects: write
  security-events: write
  statuses: write
```
