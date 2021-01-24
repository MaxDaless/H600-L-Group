#!/bin/bash
checkfile=`ls data/sampled | wc -l`
if [ $checkfile == 281 ] ; then
   echo "------------ READY TO START -----------"
else
   diff=$((281-$checkfile))
   echo "------------ ERROR -----------"
   echo "Well... apparently $diff files are missing. All the csv files should be in data/sampled"
   echo "Please make sure you execute this notebook in the parent folder."
   echo "You are here: `pwd` "
   echo -n "Do you want I help you to download the data (y/n)? "
   read answer
   if [ "$answer" != "${answer#[Yy]}" ] ; then
       ./download_and_check_data.sh
   else 
       echo "If you need, run the script download_and_check_data.sh to download and set the folders."
       echo "and try again"
   fi 
fi

mkdir data/metadata &>/dev/null
checkfile=`ls data/metadata | wc -l`
if [ $checkfile != 13 ] ; then
  echo "I will now download some documents to help you understand the data."
  cat metadata_urls.txt | xargs -n 1 -P 6 wget -c -P data/metadata/ &>/dev/null
  cd data/metadata
  unzip taxi_zones.zip &>/dev/null && rm -f *.zip
  cd ../..
  echo "------------ READY TO START -----------"
elif [ $checkfile == 13 ] ; then
   echo "------------ READY TO START -----------"
fi