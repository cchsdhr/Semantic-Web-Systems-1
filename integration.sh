#!/bin/bash

if [ ! $1 ]; then
  inputfile="dataset.ttl"
else
  inputfile=$1
fi

if [ ! $2 ]; then
  outputfile="dataset_output.ttl"
else
  outputfile=$2
fi

# Match URIs.
sed -i 's/\"Canada\"/<http:\/\/sws.geonames.org\/6251999\/>/g' $outputfile
sed -i 's/\"CANADA\"/<http:\/\/sws.geonames.org\/6251999\/>/g' $outputfile
sed -i 's/\"Nepal\"/<http:\/\/sws.geonames.org\/1282988\/>/g' $outputfile
sed -i 's/\"United Arab Emirates\"/<http:\/\/sws.geonames.org\/290557\/>/g' $outputfile
sed -i 's/\"United Kingdom\"/<http:\/\/sws.geonames.org\/2635167\/>/g' $outputfile
sed -i 's/\"United States\"/<http:\/\/sws.geonames.org\/6252001\/>/g' $outputfile

