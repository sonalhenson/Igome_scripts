#!/usr/bin/env bash

# Make sure we are in the working directory because IgomeProfiler uses lots of
# relative paths, but we still use paths relative to the workdir for the real
# script invocation because we don't know where some of the jobs submitted by
# wrapper scripts run from...
WORKDIR=/home/shenson/soft/IgomeProfiling/sonal/2021Sept/IgomeProfiling
cd $WORKDIR
OUTDIR=/home/shenson/Deep_Panning/output_2021Sept

#rm -rf output
#mkdir ${OUTDIR} && mkdir ${OUTDIR}/analysis && mkdir ${OUTDIR}/logs

# this seems to be important but it doesn't get created...?
#echo "Creating $OUTDIR/logs/error.txt"
#touch $OUTDIR/logs/error.txt

source .venv/bin/activate

python3 reads_filtration/module_wraper.py \
    --maximum_length_required 14 \
    --check_files_valid \
    --rpm \
    --gz \
    --queue batch \
	--verbose \
    /home/shenson/Deep_Panning/Miseq_R1.fastq.gz \
	${OUTDIR}/analysis/reads_filtration \
    ${OUTDIR}/logs/reads_filtration \
    /home/shenson/Deep_Panning/bc2replicate.txt \
    AGGCGGCCAACGTGGC \
    GCCGCTGGGGCCGACC \
    1 \
    38 \
    ${OUTDIR}/logs/reads_filtration_done.txt \
    3

