#!/bin/bash

# https://slurm.schedmd.com/srun.html
# https://rc-docs.northeastern.edu/en/latest/using-discovery/srun.html




#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=32
#SBATCH --mem=2000gb
#SBATCH --partition=cbcb
#SBATCH --account=cbcb
#SBATCH --qos=highmem
#SBATCH --time=48:00:00


DATADIR="/fs/cbcb-lab/ekmolloy/rparsons/primates_T2T_short_v_long/data"
READS="$DATADIR/mappings/mPanTro_map_to_mPanTro_unmasked.bam"
REF="/fs/cbcb-lab/ekmolloy/te_sim/genomes/mPanTro3.fa"
NTHREADS=32

./run_insurveyor.sh $REF $READS $NTHREADS $DATADIR
