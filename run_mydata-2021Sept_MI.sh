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

python3 motif_inference/module_wraper.py \
    --check_files_valid \
    --aln_cutoff 24 \
    --pcc_cutoff 0.7 \
    --threshold 0.6 \
    --word_length 4 \
    --discard 4 \
    --cluster_algorithm_mode 1 \
    --concurrent_cutoffs \
    --queue batch \
    --verbose \
    ${OUTDIR}/analysis/reads_filtration \
    ${OUTDIR}/analysis/motif_inference \
    ${OUTDIR}/logs/motif_inference \
    /home/shenson/Deep_Panning/replicate2condition.txt \
    100 \
    400 \
    1000 \
    100 \
    0.5 \
    ${OUTDIR}/logs/motif_inference_done.txt

