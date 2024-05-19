#!/bin/bash

READS=$1
OUTPUT=$2
BAMS="/fs/cbcb-lab/ekmolloy/rparsons/primates_T2T_short_v_long/data/mappings/*.bam"

#samtools merge -o $OUTPUT $READS
samtools merge -o $OUTPUT $BAMS

samtools index $OUTPUT
