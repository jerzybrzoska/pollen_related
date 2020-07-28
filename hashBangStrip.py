#!/usr/bin/env python3

#This code is meant to strip .html.pmd files of "#lang pollen" it it is present in their first linw.
#Recursive use is thouroughly explained in https://christophergs.com/python/2017/01/01/python-glob/
import glob, os

hashBangPollen = "#lang pollen"

cwd = os.getcwd()

fileList = glob.glob(f"{cwd}/**/*.html.pmd", recursive=True)

for f in fileList:
    with open(f) as pmd:
        firstLine = pmd.readline()
        hashBangPollen = "#lang pollen"
        if firstLine.startswith(hashBangPollen):
            data = pmd.read().splitlines(True)
            with open(f, "w") as pmd2:
                pmd2.writelines(data[0:])
