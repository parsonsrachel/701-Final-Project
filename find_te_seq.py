import os

genome = open("/fs/cbcb-lab/ekmolloy/te_sim/genomes/mPanTro3.fa","r")
bed = open("/fs/cbcb-lab/ekmolloy/rparsons/primates_T2T_short_v_long/data/mPanTro3.pri.cur.20231122.combo.bed","r")

b_lines = bed.readlines()
g_lines = genome.readlines()

genome.close()
bed.close()

chrom_dict = dict()
cur_chrom = ''

#read whole genome into a dictionary
for line in g_lines:
    if line[0] == '>':
        cur_chrom = line.strip().split('#')[-1]
        chrom_dict[cur_chrom]=''
        
    else:
        chrom_dict[cur_chrom]+=line.strip()

te=''
out_bed = open("Lines.fa","a")
for line in b_lines:
    b_sp = line.split("\t")
    if b_sp[0] == cur_chrom:
        if b_sp[3]=='L1MC1#LINE/L1':
            te = chrom_dict[sp[0]][sp[1]-1:sp[2]-1]
            #write output
            out_bed.write(line.strip()+"\t"+te+"\n")

out_bed.close()
                
