#!/usr/bin/env bash

source functions.sh

check_root

####
# Installing package dependencies and Java
####

package_manager = aptget_yum

if (( package_manager == 'yum'  ))
then
   # Python dependencies
   yum -y install gcc python-devel

   # Java JDK download and install
   curl -L -H "Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com" -o jdk_7u45_x64.rpm "http://download.oracle.com/otn-pub/java/jdk/7u45-b18/jdk-7u45-linux-x64.rpm" 
   yum install jdk_7u45_x64.rpm
elif (( package_manager == 'apt_get ))
then
   # Python dependencies 
   apt-get update
   apt-get -y install gcc python-setuptools python-dev python-software-properties

   # Java Repo and install
   add-apt-repository -y ppa:webupd8team/java
   apt-get update
   echo oracle-java7-installer shared/accepted-oracle-license-v1-1 select true | sudo /usr/bin/debconf-set-selections
   apt-get install -y oracle-java7-installer
   apt-get install -y oracle-java7-set-default
fi

echo -e '\n'

####
# Install Python regex and NLTK + download data
####

easy_install nltk regex

echo -e '\n'

python -m nltk.downloader -d /usr/share/nltk_data stopwords
