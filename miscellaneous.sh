#!/bin/bash
# Written by ojp cloud team
make_temp_mount () {
        mkdir /mnt/mnt1
        mkdir /mnt/{var,var_log,var_audit,home,tmp}
        mount /dev/xvdc2 /mnt/mnt1
}
# mount the filesystems
temp_mountPoing (){
        mount /dev/volGroup00/logvol-home /mnt/home
        mount /dev/volGroup00/logvol-tmp /mnt/tmp
        mount /dev/volGroup00/logvol-var_audit /mnt/var_audit
        mount /dev/volGroup00/logvol-var_log /mnt/var_log
        mount /dev/volGroup00/logvol-var /mnt/var
}
# sync sync the folders
rsync_files (){
        rsync -arv /mnt/mnt1/var/log/audit/ /mnt/var_audit
        rsync -arv --exclude=audit /mnt/mnt1/var/log/ /mnt/var_log
        rsync -arv --exclude=log /mnt/mnt1/var/ /mnt/var
        rsync -arv /mnt/mnt1/home/ /mnt/home
        rsync -arv /mnt/mnt1/tmp/ /mnt/tmp
}
# create /var/log/ and /var/log/audit
log_audit (){
        mkdir /mnt/var/log
        mkdir /mnt/var_log/audit
}
# Remove files from filesystem
remove_files () {
        rm -rf /mnt/mnt1/var/*
        rm -rf /mnt/mnt1/home/*
        rm -rf /mnt/mnt1/tmp/*
        touch /mnt/mnt1/.autorelabel
}
# umount temporary mount points
unmount () {
        umount /mnt/var_audit
        umount /mnt/var_log
        umount /mnt/var
        umount /mnt/home
        umount /mnt/tmp
        umount /mnt/mnt1
}
make_temp_mount
temp_mountPoing
rsync_files
log_audit
remove_files
unmount
