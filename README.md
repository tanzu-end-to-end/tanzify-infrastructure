
![Logo of the project](images/logo.png)
# Tanzify Infrastructure

 Terraform Modules to help install VMware Tanzu Products. Best used with [Terragrunt](https://terragrunt.gruntwork.io/).
 For a full example of how to use this repo see https://github.com/abhinavrau/tanzify-arau-live

<!-- TABLE OF CONTENTS -->
## Table of Contents

* [About the Project](#about-the-project)
  * [Built With](#built-with)
* [Getting Started](#getting-started)
  * [Prerequisites](#prerequisites)
* [Usage](#usage)
* [License](#license)
* [Acknowledgements](#acknowledgements)



<!-- ABOUT THE PROJECT -->
## About The Project
Using [best practices](https://terragrunt.gruntwork.io/docs/getting-started/quick-start/#promote-immutable-versioned-terraform-modules-across-environments) for using Terraform,
the modules here currently support installing the following VMware Tanzu products:

| Product | AWS | GCP | Azure | vSphere |
|----|-----|-----|-----|-----|
| Tanzu Application Service (a.k.a PAS) | :white_check_mark: | :white_check_mark: | :white_check_mark: | :x: |
| Tanzu Kubernetes Grid Integrated (a.k.a PKS) | :white_check_mark: | :white_check_mark: | :white_check_mark: | :x: |

It also supports installing the following Tiles. 

| Tile | 
|------|
| Harbor Container Registry
| MySQL  |
| RabbitMQ  |
| Redis  |
| Pivotal Cloud Cache |
| Spring Cloud Services 3 |
| Spring Cloud Data Flow  |
| Metrics  |
| Healthwatch  |
| Credhub Service Broker  |
| Pivotal Anti-Virus  |
| Spring Cloud Gateway  |
| SSO |

**Note:** Not all versions of tiles have been tested, so your mileage may vary. Take a look the [tile-install-configure/configuration](tile-install-configure/configuration) to see supported tile configs.

<!-- GETTING STARTED -->
## Getting Started

This project is intented to be used with [Terragrunt](https://terragrunt.gruntwork.io/).
More details on why is detailed in the Terragrunt docs [here](https://terragrunt.gruntwork.io/docs/getting-started/quick-start/#promote-immutable-versioned-terraform-modules-across-environments) 
and [here](https://blog.gruntwork.io/5-lessons-learned-from-writing-over-300-000-lines-of-infrastructure-code-36ba7fadeac1)

### Prerequisites

- Terraform 0.13+
- Terragrunt 0.24.0+
- LastPass CLI installed if you are using it as your secret store.


<!-- USAGE EXAMPLES -->
## Usage

It's best not to use this repo directly but use Terragrunt to execute the modules. 
The easiest way to get started is to clone the reference live repo from https://github.com/abhinavrau/tanzify-arau-live
```
git clone https://github.com/abhinavrau/tanzify-arau-live.git tanzify-username-live
```

<!-- LICENSE -->
## License

Distributed under the MIT License. See `LICENSE` for more information.

<!-- ACKNOWLEDGEMENTS -->
## Acknowledgements
This project could not have possible without awesome code from the following repos:

* [paasify-pks](https://github.com/niallthomson/paasify-pks)
* [paasify-pks](https://github.com/niallthomson/paasify-core)
* [pcf-passify](https://github.com/nthomson-pivotal/pcf-paasify)



