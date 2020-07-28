#!/usr/bin/env python3

#This code is meant to check whether the first line of a file with .html.pmd extension starts with "#lang pollen".
#If it is not so, then it is meant to prepend the file with "#lang pollen".

import glob, os

hashBangPollen = "#lang pollen"

cwd = os.getcwd()

fileList = glob.glob(f"{cwd}/**/*.html.pmd", recursive=True)

for f in fileList:
    with open(f) as pmd:
        firstLine = pmd.readline()
        if firstLine.startswith(hashBangPollen):
            pass
        else:
            with open(f, 'r+') as pmd2:
                content = pmd2.read()
                pmd2.seek(0, 0)
                pmd2.write(hashBangPollen.rstrip('\r\n') + '\n' + content)
