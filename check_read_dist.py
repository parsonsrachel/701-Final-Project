
num_reads = open("read_num.txt","r")

num_lines = open("line_num.txt","r")

read_lines = num_reads.readlines()
read_dict = dict()
for line in read_lines:
    sp = line.split(" ")
    r_num = sp[0]
    chrom = sp[1].strip()
    read_dict[chrom] = r_num

lines_lines = num_lines.readlines()
print("chromosome\tratio: num_reads/num_lines\tnum_reads\tnum_lines")
for line in lines_lines:
    sp_hash = line.strip().split("#")
    chrom_fa = sp_hash[-1].split(".")
    chrom = chrom_fa[0]
    sp_space = line.split(" ")
    if len(sp_space) > 2:
        ratio = int(read_dict[chrom])/int(sp_space[1])
    else:
        ratio = int(read_dict[chrom])/int(sp_space[0])
    print(f"{chrom}\t{ratio}\t{read_dict[chrom]}\t{sp_space[0]}\n")

