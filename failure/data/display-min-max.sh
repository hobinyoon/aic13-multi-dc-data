#! /usr/bin/env bash
set -e
set -u

[ $# -ne 1 ] && echo "Usage: $0 input-dir" && exit 1
inputDir="$1"

[ ! -d $inputDir ] && echo "Error: $inputDir: cannot access"

# Max time in timeseries. Largest value in first column across files.
# They're already sorted, so just need last line in each.
maxTime=$(tail -q -n 1 $inputDir/* | cut -d ' ' -f 1 | sort -nu | tail -1)
echo "max runtime: $maxTime"

# Min and max latencies. Merge all 2nd and 3rd columns across files. Print first
# and last values.
echo -n "min/max latencies: "
tail -q -n +2 plots/baseline/n8_rep6/* \
            | cut -d ' ' -f 2,3 \
            | tr ' ' '\n' \
            | sort -nu \
            | sed -n '1p;$p' \
            | tr '\n' ' '
echo ''
