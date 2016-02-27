#!/bin/bash

if [ ! $1 ]; then
  inputfile="dataset.csv"
else
  inputfile=$1
fi
#sed -i 's/\"//g' $inputfile
sed -i '$a\end_of_file' $inputfile
sed -i 's/,,,,,/c_tac_x5/g' $inputfile
sed -i 's/,,,,/,,,,,/g' $inputfile
sed -i 's/c_tac_x5/,,,,,/g' $inputfile
sed -i ':t;N;s/,\n/\n/;b t' $inputfile
sed -i '$a\end_of_file' $inputfile
sed -i '/end_of_file/d' $inputfile


