#!/bin/bash


MINIMAP="/fs/cbcb-lab/ekmolloy/group/software-compiled-on-EPYC-7313/minimap2/minimap2"

NTHREADS=$1
READS=$2
REF=$3
OUTPUT=$4

$MINIMAP -ax map-ont -t $NTHREADS -o $OUTPUT $REF $READS/*.fastq

