<div id="top"></div>

[![Contributors][contributors-shield]][contributors-url]
[![Forks][forks-shield]][forks-url]
[![Stargazers][stars-shield]][stars-url]
[![Issues][issues-shield]][issues-url]
[![MIT License][license-shield]][license-url]
[![CI/CD][cicd-shield]][cicd-url]

<div align="center">
<h3>CI/CD GitHub Action :rocket:</h3>
  <p>
    A CI/CD workflow for your maven project!
  </p>
</div>

## Getting Started

This is an example of building a CI & CD pipeline using GitHub actions.

The CI pipeline depends on maven to compile and test the project's code. JPA/MySQL is supported.

The CD pipeline will create a docker image of the project's code and deploy the image as a docker container along with a
MySQL container on a remote server using SSH. The bridge driver of docker networks connects these containers.

In the `docker-compose.yml`, you can configure the tag of the images. By default, the tag of the project is `dev`.
However, you can change the tag to a specific version to control the deployment. The workflow supports tags in the
sem-version format like `v*.*.*`.

To create a new release using a specific tag, navigate to your GitHub repository. Go to tags -> create new release ->
publish the release.

### Prepare the production server

1. Connect to your server
   ```sh
   ssh -i <private key path> <user>@<host>
   ```

2. Add environment variables
   ```sh
   echo "MYSQL_ROOT_PASSWORD=myrootpw
   MYSQL_DATABASE=mydb
   MYSQL_USER=myuser
   MYSQL_PASSWORD=mypw
   DOCKER_IMAGE_NAME=ci-cd
   GITHUB_USER=mathiasreker" >~/.env
   ```

   _`MYSQL_ROOT_PASSWORD`, `MYSQL_DATABASE`, `MYSQL_USER` and `MYSQL_PASSWORD` can be anything._

   _`DOCKER_IMAGE_NAME` must match the name of the docker image defined
   in [workflow](https://github.com/MathiasReker/CI-CD/blob/develop/.github/workflows/ci-cd.yml)._

   _`GITHUB_USER` must be the user/organisation of the repository in **lower case**._

> _This script replaces step 3-6 (optional)_
> ```sh
> bash <(curl -s https://raw.githubusercontent.com/MathiasReker/Java-CI-CD/develop/install.bash)
> ```

3. Install docker-compose
   ```sh
   sudo apt-get update && sudo apt-get install -y docker-compose
   ```

4. Generate a new key named `github-actions` with an empty password
   ```sh
   ssh-keygen -t rsa -b 4096 -f ~/.ssh/github-actions -q -P ""
   ```

5. Copy the content of `github-actions` into `authorized_keys`
   ```sh
   cat ~/.ssh/github-actions.pub >>~/.ssh/authorized_keys
   ```

6. Grab the private key, as you will need it soon
   ```sh
   cat ~/.ssh/github-actions
   ```

### Install action secrets

Navigate to your GitHub repository. Go to settings -> secrets -> actions.

Add the following secrets:

- SSH_USER
- SSH_HOST
- SSH_PRIVATE_KEY

### Install the workflow to your project

1. Copy the [workflow](https://github.com/MathiasReker/CI-CD/blob/develop/.github/workflows/ci-cd.yml) to this path of
   your repository: `/.github/workflows/ci-cd.yml`.

2. Copy the [docker-compose.yml](https://github.com/MathiasReker/CI-CD/blob/develop/docker-compose.yml) to the root
   folder of your project.

3. Copy the [Dockerfile](https://github.com/MathiasReker/CI-CD/blob/develop/Dockerfile) to the root folder of your
   project.

_Depending on your project, it is necessary to adapt the `docker-compose.yml` and the `Dockerfile`._

### Package visibility

To see the package, the CD pipeline must run at least once. The pipeline will create a package linked to your GitHub
repository.

Navigate to your GitHub repository. Go to the package -> select package settings -> select danger zone -> change
visibility -> make it public.

<p align="right">(<a href="#top">back to top</a>)</p>

## Usage

The CI pipeline is triggered on any change to the code on your repository.

The CD pipeline is triggered on push events. The CD pipeline will be skipped if the CI pipeline fails.

<p align="right">(<a href="#top">back to top</a>)</p>

## Roadmap

- [x] CI workflow
- [x] CD workflow
- [x] Unit test
- [x] Integration test using JPA

See the [open issues](https://github.com/MathiasReker/CI-CD/issues) for a complete list of proposed features (and known
issues).

<p align="right">(<a href="#top">back to top</a>)</p>

## Contributing

If you have a suggestion to improve this, please fork the repo and create a pull request. You can also open an issue
with the tag "enhancement". Finally, don't forget to give the project a star! Thanks again!

<p align="right">(<a href="#top">back to top</a>)</p>

## License

It is distributed under the MIT License. See `LICENSE` for more information.

<p align="right">(<a href="#top">back to top</a>)</p>

[contributors-shield]: https://img.shields.io/github/contributors/MathiasReker/CI-CD.svg

[contributors-url]: https://github.com/MathiasReker/CI-CD/graphs/contributors

[forks-shield]: https://img.shields.io/github/forks/MathiasReker/CI-CD.svg

[forks-url]: https://github.com/MathiasReker/CI-CD/network/members

[stars-shield]: https://img.shields.io/github/stars/MathiasReker/CI-CD.svg

[stars-url]: https://github.com/MathiasReker/CI-CD/stargazers

[issues-shield]: https://img.shields.io/github/issues/MathiasReker/CI-CD.svg

[issues-url]: https://github.com/MathiasReker/CI-CD/issues

[license-shield]: https://img.shields.io/github/license/MathiasReker/CI-CD.svg

[license-url]: https://github.com/MathiasReker/CI-CD/blob/master/LICENSE.txt

[cicd-shield]: https://github.com/MathiasReker/CI-CD/actions/workflows/ci-cd.yml/badge.svg?branch=develop

[cicd-url]: https://github.com/MathiasReker/CI-CD/actions/workflows/ci-cd.yml
