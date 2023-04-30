#!/bin/bash
# CODE Server
curl -fsSL https://code-server.dev/install.sh | sh
code-server --install-extension=James-Yu.latex-workshop
code-server --install-extension=cweijan.vscode-office
code-server --install-extension=MS-CEINTL.vscode-language-pack-zh-hans
mkdir -p /var/lib/codeserver

curl -fsSL https://raw.githubusercontent.com/ZanderZhao/latex-docker/main/docker/use/src/install_clean.sh | sh