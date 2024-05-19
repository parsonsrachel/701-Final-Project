#!/bin/bash

# https://slurm.schedmd.com/srun.html
# https://rc-docs.northeastern.edu/en/latest/using-discovery/srun.html


#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=16
#SBATCH --mem=120gb
#SBATCH --partition=cbcb
#SBATCH --account=cbcb
#SBATCH --qos=high
#SBATCH --time=5:00:00

DATADIR="/fs/cbcb-lab/ekmolloy/rparsons/primates_T2T_short_v_long/data/mappings"

SAMFILE="$DATADIR/mPanTro_map_to_mPanTro_unmasked.sam"
BAMFILE="$DATADIR/mPanTro_map_to_mPanTro_unmasked.bam"

./process_reads.sh $SAMFILE $BAMFILE
