#!/bin/bash

SAMFILE=$1
BAMFILE=$2

samtools view -bS $SAMFILE | samtools sort - -o $BAMFILE

