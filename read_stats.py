
chromosomes = open("/fs/cbcb-lab/ekmolloy/rparsons/primates_T2T_short_v_long/data/hg002_reads_map_to_chm13.sam","r")

c_lines = chromosomes.readlines()
chrm = dict()
for line in c_lines:
    chrm[line[1:]] = 0

sam = open("/fs/cbcb-lab/ekmolloy/rparsons/primates_T2T_short_v_long/data/chromosomes.txt","r")
s_lines = sam.readlines()
for line in s_lines:
    if line[:5]=="hg002":
        no_tab = line.split("\t")
        chrm[no_tab[2]]+=1;

output = open("/fs/cbcb-lab/ekmolloy/rparsons/primates_T2T_short_v_long/data/read_stats.txt","a")
for key in chrm.keys():
    output.write(key+":"+str(chrm[key]))

output.close()
sam.close()
chromosomes.close()
