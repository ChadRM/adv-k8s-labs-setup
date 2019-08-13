#!/usr/bin/python
rawfile = open('inventory/inv.concat','r')
outfile = open('inventory/inv.yaml','w')

outfile.writelines(["all: \n","  children: \n"])

thisline = rawfile.readline()
newline = ""
buildmaster = ""
masters = []
minions = []
while thisline:
  if "dcos-training" in thisline:
    newline = "    " + thisline[:len(thisline)-1] + ": \n"
    outfile.writelines([newline,"      vars: \n","        cluster: " + thisline[:len(thisline)-1] + " \n","      hosts: \n"])
    thisline = rawfile.readline()
  elif "bootstrap-node-public" in thisline:
    thisline = rawfile.readline()
    masters.append(thisline[:len(thisline)-1])
    buildmaster = thisline[:len(thisline)-1]
    newline = "        " + thisline[:len(thisline)-1] + ": \n"
    outfile.writelines([newline])
    thisline = rawfile.readline()
  elif "master-nodes-public" in thisline:
    thisline = rawfile.readline()
    minions.append(thisline[:len(thisline)-1])
    newline = "        " + thisline[:len(thisline)-1] + ": \n"
    outfile.writelines([newline])
    thisline = rawfile.readline()
  elif "publicagent-public" in thisline:
    thisline = rawfile.readline()
    while thisline != "\n":
      minions.append(thisline[:len(thisline)-1])
      newline = "        " + thisline[:len(thisline)-1] + ": \n"
      outfile.writelines([newline])
      thisline = rawfile.readline()
  else:
    thisline = rawfile.readline()

outfile.writelines(["    masters: \n","      hosts: \n"])
for i in masters:
  outfile.writelines(["        " + i + ": \n"])
outfile.writelines(["    minions: \n","      hosts: \n"])
for i in minions:
  outfile.writelines(["        " + i + ": \n"])
outfile.writelines(["    buildmaster: \n","      hosts: \n","        " + buildmaster + ": \n"])
outfile.writelines(["\n\n"])

rawfile.close()
outfile.close()

