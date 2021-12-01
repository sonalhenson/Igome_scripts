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

python3 model_fitting/module_wraper.py \
    --rank_method shuffles \
    --shuffles 10 \
    --is_output_sequences_scanning \
    --use_rpm_faa_scanning \
    --queue batch \
    --verbose \
    ${OUTDIR}/analysis/reads_filtration \
    ${OUTDIR}/analysis/motif_inference \
    ${OUTDIR}/analysis/model_fitting \
    ${OUTDIR}/logs/model_fitting \
    /home/shenson/Deep_Panning/replicate2condition.txt \
    10 \
    ${OUTDIR}/logs/model_fitting_done.txt

