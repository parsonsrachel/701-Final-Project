#!/bin/bash

ART=$1
DATADIR=$2
SEQSYST=$3
READLEN=$4
READCOV=$5
AVGSIZE=$6
STD=$7
OUTFILE=$8

#$ART -ss $SEQSYST \
#	-sam \
#	-i $DATADIR \
#	-p \
#	-l $READLEN \
#	-f $READCOV \
#	-m $AVGSIZE \
#	-s $STD \
#	-o $OUTFILE \

$ART -ss $SEQSYST \
	-i $DATADIR \
	-p \
	-l $READLEN \
	-f $READCOV \
	-m $AVGSIZE \
	-s $STD \
	-o $OUTFILE


