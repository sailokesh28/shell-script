#!/bin/bash


Number1=$1
Number2=$2

TIMESTAMP=$(date)
echo "script exectuted at: $TIMESTAMP"
SUM=$(($Number1+$NUMBER2))

echo "SUM of $NUMBER1 and $NUMBER2 is :$SUM "
