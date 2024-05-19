import os

chrom_names = open("../data/panTro_t2t/mPanTro3_chr_list.txt","r")
name_lines = chrom_names.readlines();

chrom = open("../data/panTro_t2t/mPanTro3.fa","r")
lines = chrom.readlines()

name_dict = list()

for line in name_lines:
    name_dict.append(">"+line.strip())

w_file = open(lines[0].strip()[1:len(lines[0].strip())]+".fa","a")
w_file.write(lines[0])
for line in lines[1:]:
    if line.strip() in name_dict:
        #start writing to new file
        w_file.close()
        w_file = open(line.strip()[1:len(line.strip())]+".fa","a")
        w_file.write(line)
    else:
        w_file.write(line)

