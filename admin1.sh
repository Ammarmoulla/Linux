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
mount uuid="____________" # the best because partation has uniqe 