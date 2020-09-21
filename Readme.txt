We wanted a way to automate the process of creating golden image anytime a new instance is needed using aws provided ami (specifically RHEL 8); so i wrote these playbooks. I could have written roles instead but because we have tower i did not see the need for it. 

Step to reproduce: 
 1. image_os.yml
 2. image_api.yml
 3. image_uuid.yml
 3. miscellaneous.sh
 4. image_ap2.yml
 
