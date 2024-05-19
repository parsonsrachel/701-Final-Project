#!/bin/bash


REF=$1
READS=$2
NTHREADS=$3
WORKDIR=$4

#run using conda environment

source ~/.bashrc

conda activate insurveyor

insurveyor.py --threads $NTHREADS $READS $WORKDIR $REF
