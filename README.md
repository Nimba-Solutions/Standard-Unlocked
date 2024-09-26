# Standard-Unlocked

This repository contains everything you need to realize enterprise-grade Salesforce CICD practices without making an enterprise-grade investment. 

The included [Github Actions](.github/workflows) provide a standardized (and mostly automated!) framework for building, testing, and delivering solutions in a consistent and repeatable manner. 

We strongly advocate adhering to a "Release Train" development methodology for Salesforce development. When applied with discipline, this approach consistently balances business demands, development rigor, and the unique constraints of working with Salesforce metadata significantly better than other popular methodologies (e.g. Scrum).

## Salesforce Release Train Development Cadence

![image](https://github.com/user-attachments/assets/6b7d1dc8-30cb-4740-964e-8cd55f54a847)
[Image Credit: CumulusCI Documentation](https://cumulusci.readthedocs.io/en/stable/cumulusci-flow.html)

## Getting Started

1. Fork this repository.
2. Make a _new_ Repository in your organization and select your fork as the `Repository Template`
4. Follow the [`Initial Setup` instructions](https://github.com/Nimba-Solutions/Standard-Unlocked/blob/main/.github/workflows/README.md#initial-setup) to configure the included CICD for this project.

## Development

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

Follow the provided [`Release` instructions](https://github.com/Nimba-Solutions/Standard-Unlocked/blob/main/.github/workflows/README.md#releases).


---

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
