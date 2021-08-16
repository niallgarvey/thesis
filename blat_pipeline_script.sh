#! /bin/bash


#uncomment each wget one at time to avoid running out of disk space

#wget -r -l6 -np -nd -A.bam https://fantom.gsc.riken.jp/5/datafiles/reprocessed/hg38_latest/basic/human.cell_line.hCAGE/ -P ~/research_project/blat_comparisons/FANTOM_bam/
#wget -r -l6 -np -nd -A.bam https://fantom.gsc.riken.jp/5/datafiles/reprocessed/hg38_latest/basic/human.fractionation.hCAGE/ -P ~/research_project/blat_comparisons/FANTOM_bam/
#wget -r -l6 -np -nd -A.bam https://fantom.gsc.riken.jp/5/datafiles/reprocessed/hg38_latest/basic/human.primary_cell.hCAGE/ -P ~/research_project/blat_comparisons/FANTOM_bam/
#wget -r -l6 -np -nd -A.bam https://fantom.gsc.riken.jp/5/datafiles/reprocessed/hg38_latest/basic/human.timecourse.hCAGE/ -P ~/research_project/blat_comparisons/FANTOM_bam/
#wget -r -l6 -np -nd -A.bam https://fantom.gsc.riken.jp/5/datafiles/reprocessed/hg38_latest/basic/human.tissue.hCAGE/ -P ~/research_project/blat_comparisons/FANTOM_bam/ 





for file in ~/research_project/blat_comparisons/FANTOM_bam/*.bam;
do samtools bam2fq ${file} | seqtk seq -A > "${file%%.*}.fa";
done;

rm ~/research_project/blat_comparisons/FANTOM_bam/*.bam 

for file in ~/research_project/blat_comparisons/FANTOM_bam/*.fa;
do blat -t=dna -q=dna ~/research_project/blat_comparisons/histones-cdna-all-210703-1723.fa ${file} "${file%%.*}.psl";
done;

rm ~/research_project/blat_comparisons/FANTOM_bam/*.fa


