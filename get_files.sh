#!/bin/sh
rm inventory/*
cp ../education-toolbox/student_key .
chmod 600 student_key
cp ../education-toolbox/inventory/generated/dist/* ./inventory/
cat ./inventory/* > ./inventory/inv.concat

