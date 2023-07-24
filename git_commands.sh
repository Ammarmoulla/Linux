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

#git add all folder expect folder or more
git add --all
git reset foldername

#add file to last commit
git add README.md
git commit --amend --no-edit
git push -f origin main


#merge with master
git push origin graphql
git checkout main
git pull origin main
git merge graphql
git push origin main

#ssh with github
ssh-keygen -t ed25519 -C "your_email@example.com" # using ed25519

#move new update from main to old branch(dev) and fix conflicts
git checkout dev
git merge main
git status # to show conflict file
git add file1 file2 ...
git commit -m "reslove ..."
git push origin dev


#stop merge
git merge --abort

#move main branch to new branch
git rebase main #change only name