#!/bin/bash

# https://slurm.schedmd.com/srun.html
# https://rc-docs.northeastern.edu/en/latest/using-discovery/srun.html

#map long reads to reference

#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=8
#SBATCH --mem=64gb
#SBATCH --partition=cbcb
#SBATCH --account=cbcb
#SBATCH --constraint=EPYC-7313
#SBATCH --qos=high
#SBATCH --time=6:00:00

#READS="/fs/cbcb-lab/ekmolloy/te_sim/long_reads/mPanTro3_5x"
READS="/fs/cbcb-lab/ekmolloy/te_sim/long_reads/mPanTro3_0.5x"
REF="/fs/cbcb-lab/ekmolloy/te_sim/genomes/mPanTro3.fa"
OUTPUT="/fs/cbcb-lab/ekmolloy/te_sim/long_reads/alignments/0.5x_mPanTro3_alignment.sam"
NTHREADS=8

./minimap_script.sh $NTHREADS $READS $REF $OUTPUT
