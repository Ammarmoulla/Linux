#user+groups
adduser ali
addgroup dcadmins
adduser alia dbadmins
usermod -aG alia networkadmins #add to secondry group
usermod -g alia dcadmins #set primary group (dcadmins) to user alia
userdel -r ali # delete user ali and all files
groupdel networkadmins # delete group networkadmins

#permissons
chmod o+x file1.txt
chmod o+x,ug-r file1.txt
chmod a+x file1.txt # chmod +x file1.txt
chmod -R ug-r train/ # to folder train and all files within train
chown ali work/ # change owner user file or folder
chown :dcadmins work/ # change primary group file or folder
chown hussian:dcadmins work/ # change owner user and primary group file or folder
chmod 644 file1.txt
chmod o=rx,ug=rw file1.txt

#ٌRedirection
ls -l file1.txt file22.txt >res.txt 2>error.txt # overide
ls -l file1.txt file22.txt >>res.txt 2>>error.txt # add
cat <<EOF>> file1.txt 
cat <<ammar>> file1.txt # until input ammar word
ls -l file1.txt file22.txt 2&>output.txt # store output and error in same file

#hard and softlink
ln file1.txt file.txt
ln -s /home/ammar/file1.txt /tmp/file1.txt # should source and destation have full path

#creating and formatting filesystem
df -h ## show size logical and real disk
lsblk # ls block
fdisk -l # inforamtion about disks and this command(fdisk)deal with only disk not partation or other
fdisk -l /dev/sda # inforamtion about specific disk like sda
fdisk /dev/sdb # apply some opertation on disk (sdb) such as add partation or delete partation ..etc
partprobe /dev/sdb # cheak kerner to reread new partation add to disk (sdb)
mkfs.ext4 /dev/sdb1 # create filesystem type ext4 to partation /dev/sdb1
cat /dev/urandom >> /dev/sdb or cat /dev/random >> /dev/sdb# destroy MBR by me
dd if=/dev/zero of=/dev/sdb count=512 bs=1 # destory all MBR where size of MBR=512 Byte
dd if=/dev/zero of=/dev/sdb count=512 bs=1 # destory only PT in MBR where size of PT=64 Byte
mkfs.xfs -f /dev/sdb1 # write xfs force insted of ext4
mount /dev/sdb1 /media # mount partation sdb1 using media because run (df -h) dont show sdb1 after write xfs (dont accessable)
unmount /media # remove unmount --> ls /media --> dont accessble because data on sdb1
dumpe2fs /dev/sdb1 # information more about partatuon sdb1
e2fsck /dev/sdb1 # cheak partation contain problem such as mounted --> unmount /dev/sdb1
e2fsck -f /dev/sdb1 # cheak and solve problem !!! but should be take backup before apply
dd if=/dev/sdb1 of=/sdb1_backup # backup to partation sdb1 before e2fsck -f !!!!
dd if=/sdb1_backup of=/dev/sdb1 # restore backup partation sdb1 from sdb1_backup file

#Mounting filesystem
mount /dev/sdb1 /media # mount partation sdb1
unmount /media # remove unmount by mount point
unmount /dev/sdb1 # remove unmount by dev
blkid # show all partation and his uuid with type
mount uuid="____________" # the best because partation has uniqe uuid
umount uuid="____________"
cat /etc/fstab # fstab is config file contain all partartion that auto mount when boot or reboot machine
echo "/dev/sdb1 /work ext4 rw,exec 0 0" >> /etc/fstab #sytnux mount partation in fstab partation mount_point filesystem mount_options dump_order check_order
mount -a # mount all partations are written in /etc/fstab and check no error in syntex format
cat /etc/mtab # mtab is config file contain all partation that mount when boot machine


#zip and unzip
tar cvfz test.tar.gz * #gzip
tar xvfz test.tar.gz   #gunzip
tar xvfj test.tar.bz2 *  #bzip2
tar xvfj test.tar.bz2 #bunzip2

#Process Mangment
ps aux # show all process on system and detials for each process
ps -ef # show pid and ppid for process
pgrep firefox # search about pid using name process
kill -l # show all signals in system with number
kill 3456 # termiante process using PID with singel default SIGTERM 
kill -9 3456 #  destroy process using PID with singel SIGKILL
command & # run command in back
ls & # run command ls in back
jobs # show all process that work in back
fg %id # retrive process (using id) work in back or ouptut show message "[1] + Stopped"
bg %id # retrive process (using id) work in forword