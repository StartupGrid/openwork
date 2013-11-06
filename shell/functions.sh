function check_root 
{
   if [[ `whoami` != 'root' ]]
   then
      echo 'Script must run as root.'
      exit
   fi
}

function aptget_yum
{
   if (( `which yum >> /dev/null; echo $?` == 0  ))
   then
      echo "yum"
   elif (( `which apt-get >> /dev/null; echo $?` == 0 ))
   then
      echo "apt-get"
   else
      echo "unknown"
   fi
}
