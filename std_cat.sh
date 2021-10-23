#!/bin/bash

filename=$1
gender=$2

echo "========================"
echo "Check if the correct number of command line inputs are received."
if test $# -eq 2
then
    echo "Two command line inputs received. Validating each input.";
else
    echo -e "USAGE:\nscriptname <filename={student_score.txt}> <gendervalue={M,F,NR}>"
    exit 1
fi

echo "========================"
echo "check if a file exists"
echo "Use of test commands"

if test -e $filename;
then
    echo "Valid file input is received."
else
    echo "Invalid input file. Please enter the correct file."
fi

if [[ -e $filename ]]
then
    echo "Valid file input is received."

else
    echo "Invalid input file; please enter a correct file";
    exit 1
fi

echo "========================"
echo "Check if the correct gender is inputed."
echo "Use of test commands"

if test $gender = "M" || test $gender = "F" || test $gender = "NR";
then
    echo "Valid gender input is received"
else
    echo "Invalid gender input. Please enter either M or F or NR as gender"
fi

echo "Use of multiple double brackets"

if [[ $gender = "M" ]] || [[ $gender = "F" ]] || [[ $gender = "NR" ]]
then
    echo "Valid gender input is received."
else
        echo "Invalid gender input. Please enter either M or F or NR as gender"
fi

echo "use of single, double bracket"

if [[ $gender = "M" || $gender = "F" || $gender = "NR" ]]
then
    echo "Valid gender input is received."
else
        echo "Invalid gender input. Please enter either M or F or NR as gender"
fi

echo "Caution: Use of a parenthesis"

if (( $gender == "M" || $gender == "F" || $gender == "NR" ))
then
    echo "Gender input: $gender";
    echo "Valid gender input is received."
else
        echo "Invalid gender input. Please enter either M or F or NR as gender"
fi
echo "******"
echo -e "\e[5mWarning! \e[25m Use of parentheses with /bin/bash does not work correctly. It works with /bin/sh only"
echo "******"

echo "Using regex. Do not use any quotes around patterns."

if [[ $gender =~ ^[mM]$ ]] || [[ $gender =~ ^[fF]$ ]] || [[ $gender =~ ^[nN][rR]$ ]]
then
    echo "Valid gender input is received."
else
        echo "Invalid gender input. Please enter either M or F or NR as gender"
fi

echo "========================"
echo "Filter lines in the given file by sex."

while IFS="," read -r oid fname lname email gpa sex
do
    echo $oid
    if [[ $gender = "$sex" ]]
    then
        echo $oid, $fname, $lname, $gpa, $sex

    fi

done < $filename

echo "========================"
echo "Count  the number of rows of the specific gender"
echo "Also, sum up the total gpa of the specific gender"

count=0
totalgpa=0

while IFS="," read -r oid fname lname email gpa sex
do
    echo $oid
    if [[ $gender = "$sex" ]]
    then
        let count++ #OR count=$$($count+1))
        #totalgpa=$(($totalgpa+$gpa))
        totalgpa=$( echo "$totalgpa+$gpa" | bc)
    fi

done < $filename
echo "Total $gender found: $count"
echo "Total GPA=$totalgpa"

echo "========================"
echo "Compute average gpa by specific gender"

#average=$(($totalgpa/$count))
average=$( echo "$totalgpa/$count" | bc )
echo "Average gpa of $gender:"$average
