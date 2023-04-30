# latex-docker

[![GitHub license](https://img.shields.io/github/license/ZanderZhao/latex-docker)](https://github.com/ZanderZhao/latex-docker/blob/master/LICENSE)
[![GitHub Workflow Status](https://img.shields.io/github/actions/workflow/status/ZanderZhao/latex-docker/test-build.yml)](https://github.com/ZanderZhao/latex-docker/actions/workflows/test-build.yml)
[![GitHub issues](https://img.shields.io/github/issues/ZanderZhao/latex-docker)](https://github.com/ZanderZhao/latex-docker/issues)
[![Docker Pulls](https://img.shields.io/docker/pulls/ZanderZhao/latex-docker)](https://hub.docker.com/r/ZanderZhao/latex-docker)
[![Docker Image Size (latest by date)](https://img.shields.io/docker/image-size/zanderzhao/latex-docker)](https://hub.docker.com/r/zanderzhao/latex-docker)
[![Docker Stars](https://img.shields.io/docker/stars/zanderzhao/latex-docker)](https://hub.docker.com/r/zanderzhao/latex-docker)
[![Docker Image Version (latest by date)](https://img.shields.io/docker/v/zanderzhao/latex-docker)](https://hub.docker.com/r/zanderzhao/latex-docker)

A docker image of the latex environment, with support for pre-installing the latest full environment of overleaf and vscode(code-server)

> vscode + full overleaf + docker


## Feature

+ Update the latest overleaf

+ Complete tex environment

+ With code-server for online use of vscode

+ With Chinese language package

## Usage

### Step 1: download Official compose

> save as `docker-compose.yml`

<https://github.com/overleaf/overleaf/blob/main/docker-compose.yml>



### Step 2: Configuration Rewrite Configuration

> save as `docker-compose.override.yml`

```yaml
# RAW https://github.com/overleaf/overleaf/blob/main/docker-compose.yml
services:
    sharelatex:
        restart: always
        # 0.overleaf
        # image: zanderzhao/latex-docker:overleaf-latest
        # 1.overleaf vscode
        # image: zanderzhao/latex-docker:overleaf-vscode-latest
        # 2.overleaf-full
        # image: zanderzhao/latex-docker:overleafull-latest
        # 3.overleaf-full vscode
        # image: zanderzhao/latex-docker:overleafull-vscode-latest
        # 4.overleaf-full cn-fonts
        # image: zanderzhao/latex-docker:overleafull-cn-latest
        # 5.overleaf-full vscode cn-fonts
        image: zanderzhao/latex-docker:overleafull-vscode-cn-latest
        ports:
            # For overleaf, the previous 80 can change to others ports, eg: 8081:80, overleaf will server at port 8081 local
            - 80:80
            # For vscode, the previous 8090 can change to others ports, eg: 8082:8090, vscode will server at port 8082 local
            - 8090:8090
        volumes:
            # For overleaf 
            - ./sharelatex_data:/var/lib/sharelatex
            # For vscode
            - ./codeserver_data:/var/lib/codeserver
        environment:
            # For vscode
            PASSWORD: 123456
```

> more tags: <https://hub.docker.com/r/zanderzhao/latex-docker/tags>


# Step 3: Setup

use `docker-compose up -d` setup

# Step 4: Open from Browser

The overleaf will server at 80(default port), <http://127.0.0.1:80>

The code-server(vscode) will server at 8090(default port), <http://127.0.0.1:8090>


## TODO

+ [code-server for multiple users](https://github.com/coder/code-server/issues/5906)

+ [code-server + latex workshop pdf display](https://github.com/James-Yu/LaTeX-Workshop/issues/3760)


## Reference

+ https://github.com/overleaf/overleaf
+ https://github.com/ZanderZhao/latex-docker
+ https://github.com/coder/code-server

