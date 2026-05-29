#package Rsubread inladen
library(Rsubread)

#locatie van documenten aangeven
setwd("C:/Users/damia/OneDrive - NHL Stenden/Casus 2026 J2P4/ncbi_dataset Homo sapiens/ncbi_dataset/data")
getwd()

#count matrix
#sample 1
count_matrix <- featureCounts(
  files = "SRR4785819.BAM",
  annot.ext = "GCF_000001405.40/genomic.gtf",
  isPairedEnd = TRUE,
  isGTFAnnotationFile = TRUE,
  GTF.attrType = "gene_id",
  useMetaFeatures = TRUE
)
#sample 2
count_matrix <- featureCounts(
  files = "SRR4785820.BAM",
  annot.ext = "GCF_000001405.40/genomic.gtf",
  isPairedEnd = TRUE,
  isGTFAnnotationFile = TRUE,
  GTF.attrType = "gene_id",
  useMetaFeatures = TRUE
)
#sample 3
count_matrix <- featureCounts(
  files = "SRR4785828.BAM",
  annot.ext = "GCF_000001405.40/genomic.gtf",
  isPairedEnd = TRUE,
  isGTFAnnotationFile = TRUE,
  GTF.attrType = "gene_id",
  useMetaFeatures = TRUE
)
#sample 4
count_matrix <- featureCounts(
  files = "SRR4785831.BAM",
  annot.ext = "GCF_000001405.40/genomic.gtf",
  isPairedEnd = TRUE,
  isGTFAnnotationFile = TRUE,
  GTF.attrType = "gene_id",
  useMetaFeatures = TRUE
)
#sample 5
count_matrix <- featureCounts(
  files = "SRR4785979.BAM",
  annot.ext = "GCF_000001405.40/genomic.gtf",
  isPairedEnd = TRUE,
  isGTFAnnotationFile = TRUE,
  GTF.attrType = "gene_id",
  useMetaFeatures = TRUE
)
#sample 6
count_matrix <- featureCounts(
  files = "SRR4785980.BAM",
  annot.ext = "GCF_000001405.40/genomic.gtf",
  isPairedEnd = TRUE,
  isGTFAnnotationFile = TRUE,
  GTF.attrType = "gene_id",
  useMetaFeatures = TRUE
)
#sample 7
count_matrix <- featureCounts(
  files = "SRR4785986.BAM",
  annot.ext = "GCF_000001405.40/genomic.gtf",
  isPairedEnd = TRUE,
  isGTFAnnotationFile = TRUE,
  GTF.attrType = "gene_id",
  useMetaFeatures = TRUE
)
#sample 8
count_matrix <- featureCounts(
  files = "SRR4785988.BAM",
  annot.ext = "GCF_000001405.40/genomic.gtf",
  isPairedEnd = TRUE,
  isGTFAnnotationFile = TRUE,
  GTF.attrType = "gene_id",
  useMetaFeatures = TRUE
)

#opslaan van samples in vectoren
allsamples <- c("SRR4785819.BAM", "SRR4785820.BAM", "SRR4785828.BAM", "SRR4785831.BAM", "SRR4785979.BAM", "SRR4785980.BAM", "SRR4785986.BAM","SRR4785988.BAM" )

#count matrix maken van alle samples
count_matrix_casus <- featureCounts(
  files = allsamples,
  annot.ext = "GCF_000001405.40/genomic.gtf",
  isPairedEnd = TRUE,
  isGTFAnnotationFile = TRUE,
  GTF.attrType = "gene_id",
  useMetaFeatures = TRUE
) 

#kijken wat er in count_matrix staat
str(count_matrix_casus)

#count selecteren uit de count matrix
counts_casus <- count_matrix_casus$counts
head(counts_casus)

#kolom namen geven
colnames(counts_casus) <- c('SRR4785819','SRR4785820', 'SRR4785828', 'SRR4785831', 'SRR4785979', 'SRR4785980', 'SRR4785986', 'SRR4785988')
head(counts_casus)

#matrix opslaan
write.csv(counts_casus, "casus_countmatrix.csv")