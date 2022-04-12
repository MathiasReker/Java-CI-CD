<div id="top"></div>

[![Contributors][contributors-shield]][contributors-url]
[![Forks][forks-shield]][forks-url]
[![Stargazers][stars-shield]][stars-url]
[![Issues][issues-shield]][issues-url]
[![MIT License][license-shield]][license-url]
[![CI/CD][cicd-shield]][cicd-url]

<div align="center">
<h3 align="center">CI/CD GitHub Action</h3>
  <p align="center">
    A CI/CD workflow for your maven project!
  </p>
</div>

## Getting Started

This is an example of building a CI & CD pipeline using GitHub actions.

The CI pipeline depends on maven to compile and test the project's code. JPA/MySQL is supported.

The CD pipeline will create a docker image of the project's code and deploy the docker containers to a remote server using
SSH. Using docker-compose, we can set a subnetwork along the docker containers that links the project's container with
an MySQL container.

In the `docker-compose.yml`, you can configure the tag of the images. By default, the tag of the project is `dev`.
However, you can change the tag to a specific version to control the deployment. The workflow supports tags in sem-version
format like `v*.*.*`.

To create a new release using a specific tag; go to tags -> create new release -> publish the release.

### Install the workflow to your project

Copy the [workflow](https://github.com/MathiasReker/CI-CD/blob/develop/.github/workflows/ci-cd.yml) to this path of your repository: `/.github/workflows/ci-cd.yml`.

### Install Actions secrets

Navigate to your GitHub repository. Go to settings -> secrets -> actions.

Add following secrets:
- SSH_USER
- SSH_HOST
- SSH_PRIVATE_KEY

### Prepare the production server

1. Connect to your server
   ```sh
   ssh -i <private key path> <user>@<host>
   ```
2. Update and upgrade packages
   ```sh
   sudo apt-get update && sudo apt-get -y upgrade
   ```
3. Install docker-compose
   ```sh
   sudo apt install -y docker-compose
   ```
4. Add environment variables
   ```sh
   echo "MYSQL_ROOT_PASSWORD=myrootpw
   MYSQL_DATABASE=mydb
   MYSQL_USER=myuser
   MYSQL_PASSWORD=mypw
   DOCKER_IMAGE_NAME=ci-cd
   GITHUB_USER=mathiasreker" >".env"
   ```

### Package visibility
In order for you to see package(s), the CD pipeline must run atleast once. The pipeline will create a package linked to your GitHib repository.

Go to the package -> select package settings -> select danger zone -> change visibility -> make it public.

<p align="right">(<a href="#top">back to top</a>)</p>

## Usage

The CI pipeline is triggered on any change to the code on your repository.
The CD pipeline is triggered on push events. The CD pipeline will be skipped if the CI pipeline fails.

<p align="right">(<a href="#top">back to top</a>)</p>

## Roadmap

- [x] CI workflow
- [x] CD workflow
- [x] UT test
- [ ] IT test using JPA

See the [open issues](https://github.com/MathiasReker/CI-CD/issues) for a complete list of proposed features (and known
issues).

<p align="right">(<a href="#top">back to top</a>)</p>

## Contributing

Contributions make the open-source community a fantastic place to learn, inspire, and create. Any donations you make
are **greatly appreciated**.

If you have a suggestion to improve this, please fork the repo and create a pull request. You can also open an issue
with the tag "enhancement". Finally, don't forget to give the project a star! Thanks again!

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3. Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the Branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

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
