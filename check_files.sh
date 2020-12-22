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
   echo "If you need, run the script download_metadata.sh to download and set the folders."
   echo "------------ ERROR -----------"
fi
