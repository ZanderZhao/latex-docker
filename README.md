# latex-docker

vscode + full overleaf + docker


## Feature

+ Update the latest overleaf

+ Complete tex environment

+ With code-server for online use of vscode

+ With Chinese language package


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
            # For overleaf, the previous 80 can change to others ports, eg: 8081:80, overleaf will server in port 8081 local
            - 80:80
            # For vscode, the previous 8090 can change to others ports, eg: 8082:8090, vscode will server in port 8082 local
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

## TODO

+ [code-server for multiple users](https://github.com/coder/code-server/issues/5906)

+ [code-server + latex workshop pdf display](https://github.com/James-Yu/LaTeX-Workshop/issues/3760)


## Reference

+ https://github.com/overleaf/overleaf
+ https://github.com/Tuetenk0pp/sharelatex-full
+ https://github.com/coder/code-server

