#!/bin/bash

#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=32
#SBATCH --mem=2000gb
#SBATCH --partition=cbcb
#SBATCH --account=cbcb
#SBATCH --qos=highmem
#SBATCH --time=24:00:00

ART="/fs/cbcb-lab/ekmolloy/group/software/art_src_MountRainier_Linux/art_illumina"
DATADIR="/fs/cbcb-lab/ekmolloy/rparsons/primates_T2T_short_v_long/data/panTro_t2t/$SAMPLE.fa"
SEQSYST="HS25"
READLEN=150
READCOV=20
AVGSIZE=200
STD=10
OUTFILE="/fs/cbcb-lab/ekmolloy/rparsons/primates_T2T_short_v_long/data/panTro_t2t/$SAMPLE"

./sim_short_reads.sh $ART \
	$DATADIR \
	$SEQSYST \
	$READLEN \
	$READCOV \
	$AVGSIZE \
	$STD \
	$OUTFILE
