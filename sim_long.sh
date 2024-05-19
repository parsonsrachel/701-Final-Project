#!/bin/bash

DATADIR=$1
PBSIM=$2
MODEL=$3

$PBSIM --strategy wgs --method qshmm --qshmm $MODEL --depth 0.5 --genome $DATADIR
