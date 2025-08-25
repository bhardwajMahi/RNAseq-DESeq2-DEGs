
---
  
  ## 2) `scripts/analysis.R`

#!/usr/bin/env Rscript
#By Mahima Bhardwaj
# analysis.R
# RNA-seq differential expression analysis using DESeq2 and the airway dataset
# Saves results to results/ directory: DEGs.csv, MAplot.png, Heatmap.png

# -------------------------
# Setup / install (optional)
# -------------------------
# Uncomment the following lines if you need to install packages.
# if (!requireNamespace("BiocManager", quietly = TRUE))
#   install.packages("BiocManager")
BiocManager::install(c("DESeq2", "airway", "pheatmap", "vsn"))

# -------------------------
# Load libraries
# -------------------------
suppressPackageStartupMessages({
  library(DESeq2)
  library(airway)
  library(pheatmap)
  library(vsn)     # used internally by plot functions (optional)
})

# Create results directory if it doesn't exist
if (!dir.exists("results")) dir.create("results")

# -------------------------
# Load data & prepare DESeq2 dataset
# -------------------------
data("airway")                 # loads 'airway' SummarizedExperiment
dds <- DESeqDataSet(airway, design = ~ cell + dex)

# Pre-filter: remove rows with very low counts
keep <- rowSums(counts(dds)) >= 10
dds <- dds[keep, ]

# -------------------------
# Run DESeq2
# -------------------------
dds <- DESeq(dds)

# Extract results for 'dex' effect (treated vs untreated)
res <- results(dds, contrast = c("dex", "trt", "untrt"))
resOrdered <- res[order(res$pvalue), ]

# Save full results table
write.csv(as.data.frame(resOrdered), file = "results/DEGs.csv", row.names = TRUE)

# -------------------------
# MA-plot (saved to PNG)
# -------------------------
png("results/MAplot.png", width = 1000, height = 800, res = 120)
plotMA(res, ylim = c(-5, 5), main = "DESeq2 MA-plot (dex effect)")
dev.off()

# -------------------------
# Heatmap of top DEGs
# -------------------------
# Use rlog transformation for visualization (stabilizes variance)
rld <- rlog(dds, blind = FALSE)
topGenes <- head(order(res$pvalue, na.last = NA), 30)
mat <- assay(rld)[topGenes, , drop = FALSE]
# Scale rows (genes) for better visualization
mat_scaled <- t(scale(t(mat)))

png("results/Heatmap.png", width = 1000, height = 800, res = 120)
pheatmap(mat_scaled,
         show_rownames = TRUE,
         show_colnames = TRUE,
         main = "Top 30 DEGs (by p-value)",
         fontsize_row = 8)
dev.off()

# -------------------------
# Print summary to console
# -------------------------
cat("DESeq2 analysis complete.\n")
cat("Results written to:\n")
cat(" - results/DEGs.csv\n")
cat(" - results/MAplot.png\n")
cat(" - results/Heatmap.png\n")

# Optional: session info for reproducibility
cat("\nSession Info:\n")
print(sessionInfo())
