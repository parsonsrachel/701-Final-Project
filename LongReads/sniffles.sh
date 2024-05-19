#!/bin/bash

INPUT=$1
OUTPUT=$2
NTHREADS=$3

sniffles --input $1 --vcf $2 --threads $3 --mosaic
