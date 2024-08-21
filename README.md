# Standard-Unlocked

## Getting Started

1. Clone this repository.
2. Make a _new_ Repository and select this one as the `Repository Template`
3. Follow the [`Initial Setup` instructions](https://github.com/Nimba-Solutions/Standard-Unlocked/blob/main/.github/workflows/README.md#initial-setup) to configure the included CICD for this project.

## Development

### [Recommended] Contribute to this project in your browser. 

1. [Navigate to the PROJECT_NAME project in nimba.dev](https://www.nimba.dev/projects/PROJECT_NAME)
2. Create / Go To a Task record.
3. In the `Developer` card, click `Assign` and select yourself.
4. Click `Create Org` (NOT `Create Scratch Org`)
5. Log into the org, build your solution, and periodically retrieve your changes.
6. When you're ready, click `Submit Task for Testing`.
7. Click `View Pull Request`.
8. Monitor for Success/Failure

### [Advanced] Contribute to this project on your device. 

1. [Set up CumulusCI](https://cumulusci.readthedocs.io/en/latest/tutorial.html) in your preferred development environnment.
2. Run `cci flow run dev_org --org dev` to deploy this project.
3. Run `cci org browser dev` to open the org in your browser.
4. Build your solution, periodically run `cci task run retrieve_changes --org dev`, and commit your changes to a `feature/**` branch using your preferred git tooling.
7. When you're ready, run `git push` to send your changes to GitHub.
8. Submit a PR.
9. Monitor for Success/Failure

----

## Releases

### [Recommended] Release this project using the Built-in CICD Actions

Follow the provided [`Releases` instructions](https://github.com/Nimba-Solutions/Standard-Unlocked/blob/main/.github/workflows/README.md#releases).

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
