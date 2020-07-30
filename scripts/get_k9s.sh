#!/bin/sh
export K9S_VERSION="v0.21.4"
mkdir ./k9star
cd k9star
wget https://github.com/derailed/k9s/releases/download/${K9S_VERSION}/k9s_Linux_x86_64.tar.gz
tar xvf k9s_Linux_x86_64.tar.gz
mv k9s ../
cd ..
rm -r k9star
