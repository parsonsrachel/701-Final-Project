#!/bin/bash

DATADIR="/fs/cbcb-lab/ekmolloy/group/data/t2t_primate/data/"

# Step a is simulate short reads
DOSIM=0
#DOSIM=1

SAMPLES=( $(cat /fs/cbcb-lab/ekmolloy/rparsons/primates_T2T_short_v_long/data/panTro_t2t/mPanTro3_chr_list.txt ) )

DATADIR="/fs/cbcb-lab/ekmolloy/rparsons/rep_SINE_results/data/myotis"

if [ $DOSIM -eq 1 ]; then
for SAMPLE in ${SAMPLES[@]}; do
    echo "Simulating $SAMPLE reads..."
    sbatch \
        --job-name="a.$SAMPLE" \
	--output="a.$SAMPLE.%j.out" \
	--error="a.$SAMPLE.%j.err" \
	--export=SAMPLE="$SAMPLE" \
    a_driver.sbatch
done
fi

#DOMAP=0
DOMAP=1


if [ $DOMAP -eq 1 ]; then
#for SAMPLE in ${SAMPLES[@]}; do
    echo "Mapping reads $SAMPLE to reference..."

    sbatch \
        --job-name="b.mapTOpanTro" \
	--output="b.mapTOpanTro.%j.out" \
	--error="b.mapTOpanTro.%j.err" \
	#--export=SAMPLE="$SAMPLE" \
    b_driver.sbatch
#done
fi

DOPROC=0
#DOPROC=1


if [ $DOPROC -eq 1 ]; then
for SAMPLE in ${SAMPLES[@]}; do
    echo "Processing simulated reads $SAMPLE..."

    sbatch \
        --job-name="c.$SAMPLE.processing" \
	--output="c.$SAMPLE.processing.%j.out" \
	--error="c.$SAMPLE.processing.%j.err" \
	--export=SAMPLE="$SAMPLE" \
    c_driver.sbatch
done
fi

DOMERGE=0
#DOMERGE=1

if [ $DOMERGE -eq 1 ]; then
    echo "Merging reads..."

    sbatch \
        --job-name="d.merging" \
	--output="d.merging.%j.out" \
	--error="d.merging.%j.err" \
	--export=SAMPLES="$SAMPLES" \
    d_driver.sbatch
fi

RUNINSURVEYOR=0
#RUNINSURVEYOR=1

if [ $RUNINSURVEYOR -eq 1 ]; then
	sbatch \
	--job-name="e.insurveyor" \
	--output="e.insurveyor.%j.out" \
	--error="e.insurveyor.%j.err" \
	e_driver.sbatch
fi

RUNMELT=0
#RUNMELT=1

if [ $RUNMELT -eq 1 ]; then
	sbatch \
	--job-name="f.MELT" \
	--output="f.MELT.%j.out" \
	--error="f.MELT.%j.err" \
	f_driver.sbatch
fi
