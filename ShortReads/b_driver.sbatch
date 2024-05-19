#!/bin/bash

# https://slurm.schedmd.com/srun.html
# https://rc-docs.northeastern.edu/en/latest/using-discovery/srun.html

#driver to map short reads

#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=32
#SBATCH --mem=2000gb
#SBATCH --partition=cbcb
#SBATCH --account=cbcb
#SBATCH --qos=highmem
#SBATCH --time=48:00:00

REF="$DATADIR/genomes/mPanTro3.fa"
READS1="$DATADIR/short_reads/short_reads_1.fq"
READS2="$DATADIR/short_reads/short_reads_2.fq"
OUTPUT="/fs/cbcb-lab/ekmolloy/rparsons/primates_T2T_short_v_long/data/mappings/mPanTro_map_to_mPanTro_unmasked.sam"
NTHREADS=32

./map_reads_to_ref.sh $REF $READS1 $READS2 $OUTPUT $NTHREADS
