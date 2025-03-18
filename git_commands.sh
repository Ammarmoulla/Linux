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

#pull 
git checkout master
git checkout -B dev origin/dev


#
git reset HEAD^ --soft #(Save your changes, back to last commit)
git reset HEAD^ --hard #(Discard changes, back to last commit)



git push origin -d remote_branch
git branch -D local_branch # use -D instead d to force deleting the branch without checking merged status



git clone --single-branch -b wav2vecbert --depth 1 git@git.infostrategic.com:stt-tts/stt.git


git pull --rebase --autostash


#copy file from anthor barnch
git checkout target-branch
git show source-branch:path/to/file > path/to/file
git show id_commit:split_large_text.py > testinnnnnnng.py;

git config --global credential.helper store


git log --oneline
git log --graph --oneline --decorate --all

git checkout llm
git merge main