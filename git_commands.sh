# add to empty repo
echo "# Docker" >> README.md
git init
git add README.md
git commit -m "first commit"
git branch -M main 
git remote add origin https://github.com/Ammarmoulla/Docker.git
git push -u origin main

#git_config
git config --list
git config --global user.name "Ammar moulla"
git config --global user.email "ammarturing@gmail.com"

#git_add
git add -- . :^README.md ## add all files without except some files

#add file to last commit
git add README.md
git commit --amend --no-edit
git push -f origin master
