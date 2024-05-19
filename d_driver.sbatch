#!/bin/bash


#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=32
#SBATCH --mem=2000gb
#SBATCH --partition=cbcb
#SBATCH --account=cbcb
#SBATCH --qos=highmem
#SBATCH --time=48:00:00

DATADIR="/fs/cbcb-lab/ekmolloy/rparsons/primates_T2T_short_v_long/data"
READS="$DATADIR/mappings/*.bam"
#READS=""
#for SAMPLE in ${SAMPLES[@]}; do
#       READS+="$DATADIR/mappings/${SAMPLE}_map_to_chm13.bam "
#done      

OUTPUT="$DATADIR/mappings/hg002_sim_reads_mapped_to_chm13.bam"

./merge_reads.sh $READS $OUTPUT
