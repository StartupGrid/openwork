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
fi

echo -e '\n'

easy_install nltk regex

echo -e '\n'

python -m nltk.downloader -d /usr/share/nltk_data stopwords
