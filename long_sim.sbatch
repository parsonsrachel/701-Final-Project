#!/bin/bash

#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=32
#SBATCH --mem=2000gb
#SBATCH --partition=cbcb
#SBATCH --account=cbcb
#SBATCH --qos=highmem
#SBATCH --time=24:00:00

DATADIR="/fs/cbcb-lab/ekmolloy/rparsons/primates_T2T_short_v_long/data/panTro_t2t/mPanTro3.fa"
PBSIM="/fs/cbcb-lab/ekmolloy/group/software/pbsim3/bin/pbsim"
MODEL="/fs/cbcb-lab/ekmolloy/group/software/pbsim3/data/QSHMM-ONT-HQ.model"

./sim_long.sh $DATADIR $PBSIM $MODEL
