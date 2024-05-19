#!/bin/bash

BWA="/fs/cbcb-lab/ekmolloy/group/software/bwa/bwa"

REF=$1
READS1=$2
READS2=$3
OUTPUT=$4
NTHREADS=$5

#need to run bwa index in the bwa directory to index the reference genome before running this

$BWA mem \
    -t $NTHREADS \
    $REF \
    $READS1 \
    $READS2  \
    > $OUTPUT \
