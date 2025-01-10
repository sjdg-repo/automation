The below templates create an aws RHEL ami with partitions defined.

Step to reproduce: 
 1. image_os.yml
 2. image_api.yml
 3. image_uuid.yml
 3. miscellaneous.sh
 4. image_ap2.yml
 5. ami_create.yml

These are the partitions that will be defined and will be in the image (ami) template.

/dev/mapper/volGroup00-logvol--home        10G  104M  9.9G   2% /home
/dev/mapper/volGroup00-logvol--var         10G  104M  9.9G   2% /var
/dev/mapper/volGroup00-logvol--tmp        5.0G   68M  4.9G   2% /tmp
/dev/xvda3                                960M  172M  789M  18% /boot
/dev/mapper/volGroup00-logvol--var_log     15G  140M   15G   1% /var/log
/dev/mapper/volGroup00-logvol--var_audit  5.0G   68M  4.9G   2% /var/log/audit



 
