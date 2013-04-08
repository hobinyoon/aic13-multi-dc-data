#! /usr/bin/env bash
set -e
set -u

[ $# -ne 12 ] && \
        echo Usage: $0 inputFile pdfFile pdfWidth pdfHeight ylimMin ylimMax xlimMin xlimMax \
        lTypes lWidth pScale fScale && \
        exit 1

_dir=$(dirname $1)
inputFile=$(basename $1)
pdfFile="$2"
pdfWidth="$3"
pdfHeight="$4"

ylimMin="$5"
ylimMax="$6"
xlimMin="$7"
xlimMax="$8"

lTypes="$9"
lWidth="${10}"
pScale="${11}"
fScale="${12}"

plt=$(mktemp)
cp plot_template.R $plt

cd $_dir

sedstr='s:__INPUT_FILE__:'$inputFile':'  &&  sed  -i  $sedstr  $plt
sedstr='s:__PDF_FILE__:'$pdfFile':'      &&  sed  -i  $sedstr  $plt
sedstr='s:__PDF_WIDTH__:'$pdfWidth':'    &&  sed  -i  $sedstr  $plt
sedstr='s:__PDF_HEIGHT__:'$pdfHeight':'  &&  sed  -i  $sedstr  $plt
sedstr='s:__YLIM_MIN__:'$ylimMin':'      &&  sed  -i  $sedstr  $plt
sedstr='s:__YLIM_MAX__:'$ylimMax':'      &&  sed  -i  $sedstr  $plt
sedstr='s:__XLIM_MIN__:'$xlimMin':'      &&  sed  -i  $sedstr  $plt
sedstr='s:__XLIM_MAX__:'$xlimMax':'      &&  sed  -i  $sedstr  $plt
sedstr='s:__LTYPES__:'$lTypes':'         &&  sed  -i  $sedstr  $plt
sedstr='s:__LWIDTH__:'$lWidth':'         &&  sed  -i  $sedstr  $plt
sedstr='s:__PSCALE__:'$pScale':'         &&  sed  -i  $sedstr  $plt
sedstr='s:__FSCALE__:'$fScale':'         &&  sed  -i  $sedstr  $plt

R --slave --vanilla < $plt
