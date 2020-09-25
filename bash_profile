## This file is managed by Ansible; any manual modification will be overwritten on the next Ansible run 
# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
        . ~/.bashrc
fi

# User specific environment and startup programs

PATH=$PATH:$HOME/bin

export PATH
# histtimeformat enables timestamping of bash history
export HISTTIMEFORMAT="%d/%m/%y %T "

#root password change
DAYSLEFT=$((90-($(($(date --utc --date "$1" +%s)/86400))-$(grep -h ^ssevalie /etc/shadow | cut -d: -f3))))
if [ $DAYSLEFT -gt 10 ]; then
   echo $DAYSLEFT days left for current root password.
else    #cfagewarn
   echo -e "\e[05;31mWARNING\e[01;31m $DAYSLEFT days left for current root password.\e[0m"
fi
