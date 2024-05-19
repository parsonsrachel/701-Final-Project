import sys
import os

path = "/fs/cbcb-lab/ekmolloy/te_sim/long_reads/mPanTro3_0.5x/"
dir_list = os.listdir(path)

sum_seq_len = 0
num_seq = 0
for d in dir_list:
    if d.split(".")[-1]=="fastq":
        fq = open(path+d,"r")

        lines = fq.readlines()
        check =0

        for line in lines:
            if check == 1:
                sum_seq_len+=len(line)
                check = 0
            if line[0]=="@":
                check=1
                num_seq+=1
print(sum_seq_len,num_seq)
print(sum_seq_len/num_seq)

