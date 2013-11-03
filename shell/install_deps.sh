#!/usr/bin/env bash

####
# Install NLTK and download data
####

if [[ `whoami` != 'root' ]]
then
   echo 'Script must run as root.'
   exit
fi

if (( `which yum >> /dev/null && echo $?` == 0  ))
then
   yum -y install gcc python-devel
elif (( `which apt-get >> /dev/null && echo $?` == 0 ))
then
   apt-get update
   apt-get -y install gcc python-setuptools python-dev

   sudo add-apt-repository ppa:webupd8team/java
   apt-get update
   echo oracle-java7-installer shared/accepted-oracle-license-v1-1 select true | sudo /usr/bin/debconf-set-selections
   apt-get install oracle-java7-installer
   apt-get install oracle-java7-set-default
fi

echo -e '\n'

easy_install nltk regex

echo -e '\n'

python -m nltk.downloader -d /usr/share/nltk_data stopwords
