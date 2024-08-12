# CAMG

## Development

### [Recommended] Contribute to this project in your browser. 

1. [Navigate to the CAMG project in nimba.dev](https://www.nimba.dev/projects/camg)
2. Create / Go To a Task record.
3. In the `Developer` card, click "Assign" and select yourself.
4. Click `Create Org` (NOT `Create Scratch Org`)

### [Advanced] Contribute to this project on your device. 

1. [Set up CumulusCI](https://cumulusci.readthedocs.io/en/latest/tutorial.html) in your preferred development environnment.
2. Run `cci flow run dev_org --org dev` to deploy this project.
3. Run `cci org browser dev` to open the org in your browser.

## Releases

### [Recommended] Release this project using Github Actions

1. [Navigate to Settings > Secrets and Actions > Actions](https://github.com/Nimba-Solutions/CAMG/settings/secrets/actions)
2. Update `DEV_HUB_AUTH_URL` with your Dev Hub's `sfdxAuthUrl` ([How do I obtain an `sfdxAuthUrl`?](https://github.com/Nimba-Solutions/.github/wiki/Obtain-an-SFDX-Auth-URL))
3. [OPTIONAL] Update `BETA_ORG_AUTH_URL` with your UAT Sandbox `sfdxAuthUrl`
4. [OPTIONAL] Update `PROD_ORG_AUTH_URL` with your Production `sfdxAuthUrl`

### [Advanced] Release this project using your CLI

#### To release a new `beta` version of this package:

1. Run `git checkout main` to switch to the main branch.
2. Run `git pull` to download the latest changes from Github.
3. Run `cci flow run dependencies --org dev` to prepare a scratch org for the process of packaging.
4. Run `cci flow run release_unlocked_beta --org dev` to release a new beta version of this package.
5. [Optional] Run `cci org browser dev` to open the org in your browser.

#### To release a new `production` version of this package:

1. Run `git checkout main` to switch to the main branch.
2. Run `git pull` to download the latest changes from Github.
3. Run `cci flow run release_unlocked_production --org dev --debug` to release a new beta version of this package.
4. Run `cci org browser dev` to open the org in your browser.
5. [OPTIONAL] Run `cci flow run install_prod --org <target-org-alias>` to install the package and _all of its dependencies_ in `<target-org-alias>`.
