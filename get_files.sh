#!/bin/sh
rm inventory/*
cp ../education-toolbox/envctl/student_key .
chmod 600 student_key
cp ../education-toolbox/envctl/inventory/dist/* ./inventory/
cat ./inventory/* > ./inventory/inv.concat
