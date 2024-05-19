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

#need index for the reference and the bam file
DATADIR="/fs/cbcb-lab/ekmolloy/rparsons/primates_T2T_short_v_long/data"
MELTDIR="/fs/cbcb-lab/ekmolloy/group/software/MELTv2.2.2"
REF="$DATADIR/chm13.fa"
BAM="$DATADIR/mappings/hg002_short_reads_to_chm13.fa"
BED="$MELTDIR/add_bed_files/1KGP_Hg19/hg19.genes.bed"

ZIP="$MELTDIR/me_refs/1KGP_Hg19/*.zip"
TELIST="$DATADIR/mei_list.txt"

ls $ZIP > $TELIST

WORKDIR="$DATADIR/MELT_output/"

./run_MELT.sh $REF $BAM $BED $TELIST $WORKDIR
