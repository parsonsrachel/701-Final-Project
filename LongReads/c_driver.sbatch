#!/bin/bash

# https://slurm.schedmd.com/srun.html
# https://rc-docs.northeastern.edu/en/latest/using-discovery/srun.html

#run sniffles

#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=32
#SBATCH --mem=2000gb
#SBATCH --partition=cbcb
#SBATCH --account=cbcb
#SBATCH --qos=highmem
#SBATCH --time=48:00:00

source /nfshomes/lmatalop/miniconda3/etc/profile.d/conda.sh

conda activate sniffles


DATA="/fs/cbcb-lab/ekmolloy/te_sim/long_reads/alignments/0.5x_mPanTro3_alignment.bam"
NTHREADS=32
OUTPUT="/fs/cbcb-lab/ekmolloy/te_sim/long_reads/sniffles_output/snout.vcf"

./sniffles.sh $DATA $OUTPUT $NTHREADS
