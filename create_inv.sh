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
  if "mk100-environment" in thisline:
    newline = "    " + thisline[:len(thisline)-1] + ": \n"
    outfile.writelines([newline,"      vars: \n","        cluster: " + thisline[:len(thisline)-1] + " \n"])
    thisline = rawfile.readline()
  elif "master-nodes-public-ips" in thisline:
    thisline = rawfile.readline()
    masters.append(thisline[:len(thisline)-1])
    if buildmaster == "":
      buildmaster = thisline[:len(thisline)-1]
    newline = "        cluster_master: " + thisline[:len(thisline)-1] + "\n"
    newline = "        buildmaster: " + buildmaster + "\n"
    outfile.writelines([newline,"      hosts: \n"])
    newline = "        " + thisline[:len(thisline)-1] + ": \n"
    outfile.writelines([newline])
    thisline = rawfile.readline()
  elif "minion-public-ips" in thisline:
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

