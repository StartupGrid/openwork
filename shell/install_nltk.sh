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
   yum install gcc python-devel
elif (( `which apt-get >> /dev/null && echo $` == 0 ))
then
   apt-get install gcc python-setuptools
fi

echo -e '\n'

easy_install nltk

echo -e '\n'

python -m nltk.downloader -d /usr/share/nltk_data stopwords