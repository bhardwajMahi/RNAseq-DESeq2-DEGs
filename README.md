# RNAseq-DESeq2-DEGs

**RNA-seq differential expression analysis using DESeq2**  
This repository demonstrates a complete small project: data → analysis → results using the Bioconductor `airway` dataset and `DESeq2`. It's ready to run and push to GitHub as a showcase project.

---


## What this project does
1. Loads the `airway` sample RNA-seq dataset (Bioconductor).
2. Runs the DESeq2 pipeline to find differentially expressed genes (DEGs).
3. Saves a CSV with results and generates an MA-plot and heatmap (top 30 DEGs).

This is intentionally simple and self-contained so it's easy to reproduce and extend.

---

## Requirements

- R >= 4.0
- Packages:
  - `BiocManager` (to install Bioconductor packages)
  - `DESeq2`
  - `airway`
  - `pheatmap`
  - `vsn` (optional - used by some plotting functions)
  
Install required packages (run in R):
```r
if (!requireNamespace("BiocManager", quietly = TRUE))
  install.packages("BiocManager")

BiocManager::install(c("DESeq2", "airway", "pheatmap", "vsn"))
