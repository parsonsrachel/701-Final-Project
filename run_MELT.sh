#!/bin/bash


#script to run MELT single

MELT="/fs/cbcb-lab/ekmolloy/group/software/MELTv2.2.2/MELT.jar"
REF=$1
BAM=$2
BED=$3
MEILIST=$4
WORKDIR=$5

java -Xmx6G -jar \
	$MELT Single \
	-h $REF \
	-bamfile $BAM \
	-n $BED \
	-t $MEILIST \
	-w $WORKDIR
