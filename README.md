# Docker BFG

- [Docker BFG](#docker-bfg)
  - [Overview](#overview)
  - [Usage](#usage)
  - [References](#references)

## Overview

A multi platform **BFG** Docker image to allow cleansing Git history without having to install Java Runtime Environment.

## Usage

An example of running the container is below. The **repository root** must be mounted to **/home/bfg/workspace** for command to work.

``` bash
docker run --rm --it \
    -v "${PWD}:/home/bfg/workspace" \
    milkyware/bfg \
    --delete-files sensitive.txt
```

To get a list of available parameters for BFG, run the container without any parameters **after the image name**:

``` bash
docker run --rm --it \
    -v "${PWD}:/home/bfg/workspace" \
    milkyware/bfg
```

## References

- [GitHub Removing Sensitive Data](https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/removing-sensitive-data-from-a-repository)
- [BFG Repo Cleaner](https://rtyley.github.io/bfg-repo-cleaner/)
