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

# Clean up data.
cp $inputfile $outputfile 
sed -i '1,217d' $outputfile
cat head.ttl $outputfile > ${outputfile}_temp
mv ${outputfile}_temp ${outputfile}
sed -i 's/\t/    /g' $outputfile

sed -i ':t;N;s/\n//;b t' $outputfile
sed -i 's/ ;/ co_temp\n/g' $outputfile
sed -i 's/co_temp/;/g' $outputfile
sed -i 's/ \.\@/ co_temp\n\@/g' $outputfile
sed -i 's/ \.sws/ co_temp\n\nsws/g' $outputfile
sed -i 's/co_temp/\./g' $outputfile


# Remove redundant information.
sed -i 's/\"\"\"/\"/g' $outputfile
sed -i '/dcterms:isReferencedBy/d' $outputfile
sed -i '/void:inDataset/d' $outputfile
sed -i '/\"\"/d' $outputfile

# Apply new vocabulary terms.
sed -i ':t;N;s/;\n\n/.\n\n/;b t' $outputfile
sed -i '$a\end_of_file' $outputfile
sed -i ':t;N;s/;\nend_of_file/\./;b t' $outputfile
sed -i 's/raw:donor_name/rdf:type schema:DonateAction ;\n    schema:agent/g' $outputfile
sed -i 's/raw:donor_country/schema:addressCountry/g' $outputfile
sed -i 's/raw:flow_type/schema:additionalType/g' $outputfile
sed -i 's/raw:donor_type/schema:additionalType/g' $outputfile
sed -i 's/raw:aid_type/schema:object/g' $outputfile
sed -i 's/raw:transaction_type/schema:instrument/g' $outputfile
sed -i 's/raw:recipient_country/schema:location/g' $outputfile
sed -i 's/raw:recipient_type/schema:additionalType/g' $outputfile
sed -i 's/raw:receiver/schema:recipient/g' $outputfile
sed -i 's/raw:remarks/schema:comment/g' $outputfile
sed -i 's/raw:description/schema:description/g' $outputfile
sed -i 's/raw:target_geography/schema:addressLocality/g' $outputfile
sed -i 's/raw:targeted_beneficiaries/schema:recipient/g' $outputfile
sed -i 's/raw:amount/schema:price/g' $outputfile
sed -i 's/raw:currency/schema:priceCurrency/g' $outputfile
sed -i 's/raw:usd_amount \"/schema:PriceSpecification \"USD/g' $outputfile
sed -i 's/raw:disbursement_date/schema:endTime/g' $outputfile
sed -i 's/raw:information_source/schema:mainEntityOfPage/g' $outputfile
sed -i 's/raw:reference_link/schema:sameAs/g' $outputfile
sed -i 's/raw:updated_by/schema:author/g' $outputfile
sed -i 's/raw:email_address/schema:email/g' $outputfile
sed -i 's/sws:/earthquake:/g' $outputfile
sed -i '/raw:/d' $outputfile



