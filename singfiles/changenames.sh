#!/bin/bash

###################################################
#This is the changenames shell script in progress.#
###################################################

#namesfile needs to be a csv with the first column containing the current file names
#and second column containing the new names.

#declare your username
username=aaron.dickey

#declare the path to the folder containing the files to change (assume starting at home directory)
dirpath="data/Schmidt/hank1/results/assembly/shovill/corrections/"

#declare the path and name of the namesfile (assume starting at home directory)
namesfile="testnames3.csv"

##  DO NOT MODIFY PIPELINE BELOW THIS POINT  ##
home="/home/"${username}/; cd $home$dirpath; namepath=$home$namesfile
LC_ALL=C sed -e '1s/^\xEF\xBB\xBF//' -e 's/\r$//' \
-e 's/"//g' $namepath | while IFS=, read orig new; do mv "$orig" "$new" 2>/dev/null; done

