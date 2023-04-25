# latex-docker

vscode + full overleaf + docker

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
            # For overleaf
            - 80:80
            # For vscode
            - 8080:8090
        volumes:
            # For overleaf 
            - ./sharelatex_data:/var/lib/sharelatex
            # For vscode
            - ./codeserver_data:/var/lib/codeserver
        environment:
            # For vscode
            PASSWORD: 123456
```

Reference

+ https://github.com/overleaf/overleaf
+ https://github.com/Tuetenk0pp/sharelatex-full
+ https://github.com/coder/code-server

