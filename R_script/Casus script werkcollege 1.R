#locatie van documenten aangeven
setwd("C:/Users/damia/OneDrive - NHL Stenden/Casus 2026 J2P4/ncbi_dataset Homo sapiens/ncbi_dataset/data")
getwd()

#packages instellen (Bioconductur)
install.packages('BiocManager')
library(BiocManager)

#instaleren en inladen van Rsubread
# Package downloaden
BiocManager::install('Rsubread')
# Package laden
library(Rsubread)

#handleiding van een package aanvragen
browseVignettes('Rsubread')

#indexeren van Homo sapiens
buildindex(
  basename = 'ref_Homo.sapiens',
  reference = 'GCA_000001405.29/GCA_000001405.29_GRCh38.p14_genomic.fna',
  memory = 4000,
  indexSplit = TRUE)

#mappen van samples
#sample 1
align.SRR4785819 <- align(index = "ref_Homo.sapiens", readfile1 = "Data_RA_raw/Data_RA_raw/SRR4785819_1_subset40k.fastq", readfile2 = "Data_RA_raw/Data_RA_raw/SRR4785819_2_subset40k.fastq", output_file = "SRR4785819.BAM")
#sample 2
align.SRR4785820 <- align(index = "ref_Homo.sapiens", readfile1 = "Data_RA_raw/Data_RA_raw/SRR4785820_1_subset40k.fastq", readfile2 = "Data_RA_raw/Data_RA_raw/SRR4785820_2_subset40k.fastq", output_file = "SRR4785820.BAM")
#sample 3 
align.SRR4785828 <- align(index = "ref_Homo.sapiens", readfile1 = "Data_RA_raw/Data_RA_raw/SRR4785828_1_subset40k.fastq", readfile2 = "Data_RA_raw/Data_RA_raw/SRR4785828_2_subset40k.fastq", output_file = "SRR4785828.BAM")
#sample 4
align.SRR4785831 <- align(index = "ref_Homo.sapiens", readfile1 = "Data_RA_raw/Data_RA_raw/SRR4785831_1_subset40k.fastq",readfile2 = "Data_RA_raw/Data_RA_raw/SRR4785831_2_subset40k.fastq", output_file = "SRR4785831.BAM")
#sample 5
align.SRR4785979 <- align(index = "ref_Homo.sapiens", readfile1 = "Data_RA_raw/Data_RA_raw/SRR4785979_1_subset40k.fastq", readfile2 = "Data_RA_raw/Data_RA_raw/SRR4785979_2_subset40k.fastq", output_file = "SRR4785979.BAM")
#sample 6
align.SRR4785980 <- align(index = "ref_Homo.sapiens", readfile1 = "Data_RA_raw/Data_RA_raw/SRR4785980_1_subset40k.fastq", readfile2 = "Data_RA_raw/Data_RA_raw/SRR4785980_2_subset40k.fastq", output_file = "SRR4785980.BAM")
#sample 7
align.SRR4785986 <- align(index = "ref_Homo.sapiens", readfile1 = "Data_RA_raw/Data_RA_raw/SRR4785986_1_subset40k.fastq",readfile2 = "Data_RA_raw/Data_RA_raw/SRR4785986_2_subset40k.fastq", output_file = "SRR4785986.BAM")
#sample 8
align.SRR4785988 <- align(index = "ref_Homo.sapiens", readfile1 = "Data_RA_raw/Data_RA_raw/SRR4785988_1_subset40k.fastq", readfile2 = "Data_RA_raw/Data_RA_raw/SRR4785988_2_subset40k.fastq", output_file = "SRR4785988.BAM")

# Laad Rsamtools voor sorteren en indexeren (dowloaden indien nodig)
BiocManager::install('Rsamtools')
library(Rsamtools)

# Bestandsnamen van de monsters
samples <- c('SRR4785819','SRR4785820', 'SRR4785828', 'SRR4785831', 'SRR4785979', 'SRR4785980', 'SRR4785986', 'SRR4785988')

# Voor elk monster: sorteer en indexeer de BAM-file
# Sorteer BAM-bestanden
lapply(samples, function(s) {sortBam(file = paste0(s, '.BAM'), destination = paste0(s, '.sorted'))
})
# Indexeer de gesorteerde BAM-file
lapply(samples, function(s) {indexBam(file = paste0(s, '.sorted.bam'))
})
