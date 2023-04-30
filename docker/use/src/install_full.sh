#!/bin/bash
# update tlmgr itself
wget "https://mirror.ctan.org/systems/texlive/tlnet/update-tlmgr-latest.sh" \
    && sh update-tlmgr-latest.sh \
    && tlmgr --version
#
# initialize usertree to allow user-mode
#tlmgr init-usertree
#
# enable tlmgr to install ctex
# https://tex.stackexchange.com/questions/598380/cannot-install-ctex-via-tlmgr-unknown-option-status-file-when-running-fmtuti
tlmgr update texlive-scripts 
#
# update packages
tlmgr update --all
#
# install all the packages
# https://tex.stackexchange.com/questions/340964/what-do-i-need-to-install-to-make-more-packages-available-under-sharelatex
tlmgr install scheme-full
#
# recreate symlinks
# https://www.tug.org/texlive/doc/tlmgr.html#path
tlmgr path add
#
# get minted to work
# https://github.com/overleaf/overleaf/issues/851#issuecomment-830276429
apt-get update
apt-get install python3-pygments -y
#
# install inkscape for svg support
apt-get install inkscape -y
#
# either put a latexmkrc-file in the root directory of your project:
#
# # latexmkrc
# $pdflatex = 'pdflatex --shell-escape';
#
# or enable shell-escape by default:
TEXLIVE_FOLDER=$(find /usr/local/texlive/ -type d -name '20*') \
    && echo % enable shell-escape by default >> /$TEXLIVE_FOLDER/texmf.cnf \
    && echo shell_escape = t >> /$TEXLIVE_FOLDER/texmf.cnf

curl -fsSL https://raw.githubusercontent.com/ZanderZhao/latex-docker/main/docker/use/src/install_clean.sh | sh
