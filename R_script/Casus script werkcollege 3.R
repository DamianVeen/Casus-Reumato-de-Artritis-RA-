#locatie van documenten aangeven
setwd("C:/Users/damia/OneDrive - NHL Stenden/Casus 2026 J2P4/ncbi_dataset Homo sapiens/ncbi_dataset/data")
getwd()

# Count matrix inladen
counts <- read.table("count_matrix_RA.txt", header = TRUE)
head(counts)

#Biomanager inladen en installeren
install.packages('BiocManager')
library(BiocManager)

#packages installeren
BiocManager::install("DESeq2")
BiocManager::install("KEGGREST")
BiocManager::install("EnhancedVolcano")
BiocManager::install("pathview")

#Packages inladen
library(DESeq2)
library(KEGGREST)
library(EnhancedVolcano)
library(pathview)

#maken van een tabel voor het beschrijven van de monsters
treatment_casus <- c("Normal", "Normal", "Normal", "Normal", "Rheumatoid arthritis (established)", "Rheumatoid arthritis (established)", "Rheumatoid arthritis (established)", "Rheumatoid arthritis (established)")
treatment_table_casus <- data.frame(treatment_casus)

# Rijnamen veranderen
rownames(treatment_table_casus) <- c('SRR4785819', 'SRR4785820', 'SRR4785828', 'SRR4785831', 'SRR4785979', 'SRR4785980', 'SRR4785986', 'SRR4785988')

#bekijken van  de metadata
head(treatment_table_casus)

# Maak DESeqDataSet aan
dds_casus <- DESeqDataSetFromMatrix(countData = counts,
                              colData = treatment_table_casus,
                              design = ~ treatment_casus)

# Voer analyse uit
dds_casus <- DESeq(dds_casus)
resultaten_casus <- results(dds_casus)

#resultaten opslaan
write.table(resultaten_casus, file = 'ResultatenCasus.csv', row.names = TRUE, col.names = TRUE)

#bekijken welke genen zijn veranderd (significant)
sum(resultaten_casus$padj < 0.05 & resultaten_casus$log2FoldChange > 1, na.rm = TRUE)
sum(resultaten_casus$padj < 0.05 & resultaten_casus$log2FoldChange < -1, na.rm = TRUE)

#opvallendste genen eruit selecteren
hoogste_fold_change <- resultaten_casus[order(resultaten_casus$log2FoldChange, decreasing = TRUE), ]
laagste_fold_change <- resultaten_casus[order(resultaten_casus$log2FoldChange, decreasing = FALSE), ]
laagste_p_waarde <- resultaten_casus[order(resultaten_casus$padj, decreasing = FALSE), ]

#volcano plot produceren
EnhancedVolcano(resultaten_casus,
                lab = rownames(resultaten_casus),
                x = 'log2FoldChange',
                y = 'padj')

#plot opslaan
dev.copy(png, 'Volcanoplot_Casus(RA).png', 
         width = 8,
         height = 10,
         units = 'in',
         res = 500)
dev.off()

#downloaden pakketten
BiocManager::install("clusterProfiler")
BiocManager::install("org.Hs.eg.db")
BiocManager::install("DOSE")
BiocManager::install("goseq")
BiocManager::install("geneLenDataBase")

# Inladen
library(clusterProfiler)
library(org.Hs.eg.db)
library(DOSE)
library(dplyr)
library(goseq)
library(geneLenDataBase)

# Significante genen bekijken
res <- as.data.frame(resultaten_casus)
significante_genen <- res%>%
  filter(padj< 0.05)

head(significante_genen)
rownames(significante_genen)[1:5]

# Bepaal het type gen-ID
genen_lijst <- rownames(significante_genen)

genen_df <- bitr(
  genen_lijst,
  fromType = "SYMBOL",
  toType = "ENTREZID",
  OrgDb = org.Hs.eg.db
)

# Voer GO-analyse uit
ego <- enrichGO(
  gene = genen_df$ENTREZID,
  OrgDb = org.Hs.eg.db,
  keyType = "ENTREZID",
  ont = "BP",
  pAdjustMethod = "BH",
  pvalueCutoff = 0.05,
  qvalueCutoff = 0.05,
  readable = TRUE
)

# Resultaten bekijken
head(as.data.frame(ego))

# Plot maken
library(enrichplot)
library(stringr)

dotplot(ego, showCategory = 10) +
  ggplot2::labs(title = "GO-verrijking") +
  scale_y_discrete(labels  = function(x) str_wrap(x, width = 35)) +
  theme(
    axis.text.y = element_text(size = 11, lineheight = 0.9)
  )

ggsave("GO_plot.png", width = 8, height = 6, dpi = 300)

# KEGG pathways
nrow(significante_genen)

# Welk type gen ID
head(rownames(significante_genen))

genen_df_KEGG <- bitr(
  rownames(significante_genen),
  fromType = "SYMBOL",
  toType = "ENTREZID",
  OrgDb = org.Hs.eg.db
)

head(genen_df_KEGG)

# KEGG enrichment analyse uitvoeren
kegg <- enrichKEGG(
  gene = genen_df$ENTREZID,
  organism = "hsa",
  pvalueCutoff = 0.05
)

head(as.data.frame(kegg))

kegg_df <- as.data.frame(kegg)
head(kegg_df)

kegg_df$Percentage <- (kegg_df$Count / sum(kegg_df$Count)) * 100

kegg_df <- kegg_df[order(kegg_df$Percentage, decreasing = TRUE), ]

top10 <- head(kegg_df, 10)

ggplot(top10, aes(x = Percentage, 
                  y = reorder(Description, Percentage))) +
  geom_point(aes(size = Count, color = p.adjust)) +
  scale_color_gradient(low = "pink", high = "darkolivegreen4") +
  ylab("Pathway") +
  xlab("Percentage of genes (%)") +
  theme_minimal() +
  theme(axis.text.y = element_text(size = 10)) +
  labs(title = "KEGG Pathways Analysis in Rheumatoid Arthritis")

# Opslaan
ggsave("kegg_pathway_plot.png", width = 8, height = 6, dpi = 300)
