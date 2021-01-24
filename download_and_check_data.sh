# Create working folders
mkdir data data/sampled data/metadata &>/dev/null
# Invite to download the data:
echo "-------------------------------"
echo "--------- H600 Project --------"
echo "Welcome, did you already download the TLC files called tlc_0.2perc.zip from the UV? (Yes or No)" 
read rep && rep1=${rep:0:1}
echo "-------------------------------"
if [ ${rep1,,} == 'y' ] ; then 
 echo "Great! You should now unzip tlc_0.2perc.zip in the data/sampled folder I created for you."
 echo "-------------------------------"
 echo "Do you want help to do unzip the files (Y/N)?" 
 read rep && rep2=${rep:0:1}
 echo "-------------------------------"
 checkfile=`ls data/sampled | wc -l`
 if [ ${rep2,,} == 'y' ] && [ $checkfile != 281 ] ; then
  echo "Write down the full path of where you downladed the tlc_0.2perc.zip file, example: /home/Downloads/tlc_0.2perc.zip" 
  read rep
  cp $rep data/sampled/
  cd data/sampled
  unzip tlc_0.2perc.zip &>/dev/null && mv tlc_0.2perc/* . && rm -rf tlc_0.2perc ; rm -f tlc_0.2perc.zip 
  if [ `ls | wc -l` == 281 ]; then 
   echo "-------------------------------"
   echo "OK, I did it for you :)"
   cd ../..
  else
   echo "------------ ERROR -----------"
   echo "I'm sorry, something went wrong, please restart me..."
   exit 1
  fi
 else
  if [ `ls data/sampled | wc -l` != 281 ]; then
   echo "------------ ERROR -----------"
   echo "Well... apparently the data are not well situated. All the csv files should be in data/sampled"
   echo "Please try again or ask me help"
  fi 
 fi
 checkfile=`ls data/metadata | wc -l`
 if [ $checkfile != 13 ] ; then
  echo "I will now download some documents to help you understand the data."
  cat metadata_urls.txt | xargs -n 1 -P 6 wget -c -P data/metadata/ &>/dev/null
  cd data/metadata
  unzip taxi_zones.zip &>/dev/null && rm -f *.zip
  cd ../..
 fi
 echo "-------------------------------"
 echo "Documents about the data are in data/metadata."
 echo "--------------------------------"
 echo "---- EVERYTHING GOES RIGHT -----"
 echo "-- Now let's explore the data --"
 echo "--------------------------------"
else
 echo "Please use the link below to download the tlc_0.2perc.zip file and then, restart me."
 echo "-------------------"
 echo "https://drive.google.com/u/0/uc?id=1Hb729JcOo_oQqJRVq0B9TNcGnOc_WEuv&export=download"
 echo "-------------------"
fi

