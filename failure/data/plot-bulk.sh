#! /usr/bin/env bash
set -e
set -u

# Configure bulk-plotting parameters here.
pdfWidth=7
pdfHeight=7
ylimMin=0
ylimMax=10
xlimMin=0
xlimMax=110
lTypes="5,1"
lWidth=1
pScale=1
fScale=1

# Nothing to edit below here.

[ ! $# -eq 2 ] && echo "Usage $0 input-dir output-dir" && exit 1
inputDir="$1"
outputDir="$2"

[ ! -d $inputDir ] && echo "Error: $inputDir: cannot access" && exit 1
[ ! -d $outputDir ] && mkdir -p $outputDir

for file in $inputDir/*
do
    echo $file
    ./plot.sh $file $outputDir/$(basename $file).pdf $pdfWidth $pdfHeight $ylimMin $ylimMax $xlimMin $xlimMax \
            $lTypes $lWidth $pScale $fScale
done
