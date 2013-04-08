#! /usr/bin/env bash
set -e
set -u

[ ! $# -eq 2 ] && echo "Usage $0 input-dir output-dir" && exit 1
inputDir="$1"
outputDir="$2"

[ ! -d $outputDir ] && mkdir -p $outputDir

for file in $inputDir/*
do
    outFile=$outputDir/$(basename $file)
    echo "$file -> $outFile"
    ./extract.sh < $file > $outFile
done
