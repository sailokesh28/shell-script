#!/bin/bash

echo "All Variables Passed: $@"
echo "Number of Variables: $#"
echo "Script Name: $0"
echo "Present Working Dirctory: $PWD"
echo "Home Directory of Current User:$HOME"
echo "Which User is Running This Script: $USER"
echo "Process Id Of Current Script: $$"
sleep 60 &
echo "Process Id of last command in BackGround: $!"