# files

alias l='ls -aFlt --color=auto'
alias ..='cd ..'
alias ...='cd ../..;'
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias cl='clear'
alias rr='rm -rf'
alias tr="tree -ac -I 'node_modules'"
alias cdl='cd ~/Downloads/'
alias cdb='cd -'
alias lg='l | grep -i'

# vim/bash

alias vv='vim ~/.vimrc'
alias vb='vim ~/.bash_aliases'
alias sb='source ~/.bashrc'
alias v='vim'
alias wf='~/executables/waterfox/waterfox'
alias bh='cat ~/.bash_history | tail -n 50'
alias bhg='cat ~/.bash_history | grep -i'
alias ag='alias | grep -i' 

# apt

alias au='sudo apt update'
alias ai='sudo apt install -y'
alias ar='sudo apt remove'
alias ap='sudo apt purge'
alias aug='sudo apt upgrade'
alias al='apt list --installed'
alias ar='sudo apt remove -y'
alias apg='sudo apt purge -y'
alias aar='sudo apt autoremov -y'
alias as='apt-cache search'

alias g++='gcc -Wall -pedantic -g'

# mvn

alias mp='mvn clean package'
alias mi='mvn clean install'
alias md='mvn clean deploy'
alias sfs='cd ~/Granditude/build;serve -s -p 3000'
alias cmi='cd ~/Granditude/web-export/common;mvn clean install'
alias clmi='cd ~/Granditude/web-export/client;mvn clean install'
alias emi='cd ~/Granditude/web-export/entity;mvn clean install'
alias csd="cmi;cd ~/Granditude/web-export/cloud-service;mvn clean deploy"
alias csi="cmi;cd ~/Granditude/web-export/cloud-service;mvn clean install"
alias csjp="csi;java -jar target/cloud-service-v0.64.0-jar-with-dependencies.jar ${CHROME_DRIVER} webexport@granditude.com 'H^9Mc<@u8A' https://api.granditude.com"

alias csjd="csi;java -jar target/cloud-service-v0.64.0-jar-with-dependencies.jar ${CHROME_DRIVER} webexport@granditude.com '1234' https://api-dev.granditude.com"

alias csjdt="csi;java -jar target/cloud-service-v0.64.0-jar-with-dependencies.jar ${CHROME_DRIVER} webexport@granditude.com 1234 https://api-dev.granditude.com scanVariants living.se false 61b33f31ca89c9bb81bed7e2 instance-1 asia null"

alias sti="cmi;cd ~/Granditude/web-export/scraping-tool;mvn clean install -Pprod"
alias std="cmi;cd ~/Granditude/web-export/scraping-tool;mvn clean install;mvn spring-boot:run -Dspring-boot.run.profiles=dev -Pdev"
alias stp="cmi;cd ~/Granditude/web-export/scraping-tool;mvn clean install;mvn spring-boot:run -Dspring-boot.run.profiles=prod -Pprod"
alias stjp="sti;java -jar -DCHROME_DRIVER=${CHROME_DRIVER} -Dspring.profiles.active=prod -DMONGODB_URI='mongodb+srv://webExport:dev3xport_k19@gsprod-26hsa.gcp.mongodb.net/webExport?retryWrites=true&ssl=true' target/scraping-tool-0.18.3.jar"

alias stjd="sti;java -jar -DCHROME_DRIVER=${CHROME_DRIVER} -Dspring.profiles.active=prod -DMONGODB_URI='mongodb+srv://webExport:dev3xport_k19@gsdev-26hsa.gcp.mongodb.net/webExport?retryWrites=true' target/scraping-tool-0.18.3.jar"

alias dsi="cmi;cd ~/Granditude/web-export/scraping-tool;mvn clean install"

# Granditude

alias gw='cd ~/Granditude/web-export'
alias bg='rr ~/BackUp_Granditude;cp -rf ~/Granditude ~/BackUp_Granditude'
alias dbq='cat ~/GrandMisc/dbQueries.txt'

alias kcd='pgrep chrome | xargs kill -9'
alias lpp='netstat -tulpn'

# JetBrains

alias ji='sh ~/executables/idea-IC-213.6461.79/bin/idea.sh'
alias jp='sh ~/executables/pycharm-community-2021.3.1/bin/pycharm.sh'
alias subl='~/executables/sublime_text_3/sublime_text'

# git

alias grh='git reset --soft HEAD~1'
alias gl='git log -n 5'
alias gs='git st'
alias gb='git branch'
alias gbr='git branch -r'
alias gd='git diff'
alias grst='git restore'
alias gst='git stash'
alias gsta='git stash apply'
alias gstp='git stash pop'
alias gstd='git stash drop'
alias gstl='git stash list'
alias guisw='git update-index --skip-worktree'
alias guinsw='git update-index --no-skip-worktree'
alias glsw='git ls-files -v . | grep ^S'
alias gsw='git switch'

# java

alias psj='ps -ef | grep java'
alias jst='jstat -gc'

#vscode

# alias code="~/executables/VSCode-linux-x64/bin/code" 

# Functions

# excludedirs={node_modules,target,.git,static}

fin() {
    find . -iname "*.$1" -exec grep -Hrni -C 2 --exclude-dir={node_modules,target,.git,static,scrapers} --color=always "$2" {} \;
}

f() {
	grep . -Hrni -C 2 --exclude-dir={node_modules,target,.git,static,scrapers} -e "$1"
}


sf() {
	sudo grep . -Hrni -C 2 --exclude-dir={node_modules,target,.git,static,scrapers} -e "$1"
}


fcs() {
	grep . -Hrn -C 2 --exclude-dir={node_modules,target,.git,static,scrapers} -e "$1"
}

fw() {
	grep . -Hrniw -C 2 --exclude-dir={node_modules,target,.git,static,scrapers} -e "$1"
}

fcsw() {
	grep . -Hrnw -C 2 --exclude-dir={node_modules,target,.git,static,scrapers} -e "$1"
}

ff() {
	find . -type f -iname "$1.*" -not -path "*/node_modules/*" -not -path "*/target/*" -not -path "*/.git/*" -not -path "*/static/*" -not -path "*/scrapers/*"
}

sff() {
	sudo find . -type f -iname "$1.*" -not -path "*/node_modules/*" -not -path "*/target/*" -not -path "*/.git/*" -not -path "*/static/*" -not -path "*/scrapers/*"
}

fd() {
	find . -type d -iname "$1" -not -path "*/node_modules/*" -not -path "*/target/*" -not -path "*/.git/*" -not -path "*/static/*" -not -path "*/scrapers/*"
}

dcdp() {
	sed -i '50d' ~/Granditude/web-export/common/src/main/java/com/granditude/webexport/common/util/DriverUtil.java
}

cg() {
	cat "$1" | grep -i "$2"
}

ggar() {
	git grep -Hrni -C 2 "$1" $(git rev-list --all)
}

