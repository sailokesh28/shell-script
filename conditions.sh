#!/bin/bash

NUMBER=$1

#-gt ,-lt, -eq, -ge, -le
if [ $NUMBER -gt 100 ]
then
    echo "Given Number is Greater Than 100"
else
    echo "Given Number is Less Than or Equal to 100"
fi