#!/bin/bash

#script to run repeatmasker
#installed using conda so activate the conda environment to run

CONSFASTA=$1
NTHREADS=$2
REF=$3
MASKREF=$4

source ~/.bashrc
conda activate repeatmasker
RepeatMasker \
	-e ncbi \
	-lib $CONSFASTA \
	-pa $NTHREADS \
	-dir $MASKREF \
	$REF
