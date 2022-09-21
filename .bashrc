 1 # .bashrc file
 2 parse_git_branch() {
 3        git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
 4 }
 5 
 6 PS1='\[\033[01;35m\]\u\[\e[0m\] :\[\033[01;34m\]\w \[\033[33m\]$(parse_git_branch)\$ \[\033[00m\]'
 7 
 8 PROMPT_DIRTRIM=1 #shows just the current directory name
 9 alias ls='ls --color=auto'
10 alias ll='ls -alF'
11 alias la='ls -A'
12 alias l='ls -CF'
13 
14 export NVM_DIR="$HOME/.nvm"
15 [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
16 [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
17 
18 g() {
19     git add -A
20     git commit -m "$1"
21     git push origin main
22     echo "Jonner"
23 }
24 
25 ts() {
26     npm install typescript --save-dev
27         npm install ts-node --save-dev
28         npx tsc --init!
29     mkdir src
30     touch ./src/$1.ts
31     npm install prettier --save-dev --save-exact
32     npm install eslint --save-dev
33     npm install --save-dev eslint-plugin-jsdoc
34     npm init @eslint/config
35     cp ~/.prettierc ./
36     cp ~/.eslintignore ./
37         cp ~/.eslintrc.json ./
38     nvim $1.ts
39 }
40 
41 runts() {
42     npx ts-node ./src/$1
43         npx prettier --write ./src/$1
44     npx eslint ./src/$1
45 }
46 
47 rules() { 
48     printf "g \nts \nrunts\n"