# RNAseq-DESeq2-DEGs

**RNA-seq differential expression analysis using DESeq2**  

This repository demonstrates a complete mini-project: **data → analysis → results** using the Bioconductor `airway` dataset and the `DESeq2` package in R.  
It showcases how to identify **differentially expressed genes (DEGs)** and visualize results with plots.  

---

## 🔬 Project Overview
- 📊 Input: RNA-seq count data from the **airway** dataset  
- ⚙️ Method: Differential expression with **DESeq2**  
- 📑 Output: DEGs table + MA-plot + heatmap  

This project is designed to be **self-contained, reproducible, and beginner-friendly**.

---

## 📂 Repository Structure
```bash
RNAseq-DESeq2-DEGs/
├── scripts/               # contains analysis scripts
│   └── analysis.R         # main DESeq2 analysis pipeline
├── results/               # outputs generated after running analysis
│   ├── DEGs.csv           # table of differentially expressed genes
│   ├── MAplot.png         # MA-plot of log2FC vs mean expression
│   └── Heatmap.png        # heatmap of top 30 DEGs
├── .gitignore             # files/folders to be ignored by git

---

## 📦 Requirements

- R >= 4.0
- Packages:
  - `DESeq2`
  - `airway`
  - `pheatmap`
  - `vsn` (optional, for variance-stabilizing transformations)

Install requirements:
```r
if (!requireNamespace("BiocManager", quietly = TRUE))
    install.packages("BiocManager")

BiocManager::install(c("DESeq2", "airway", "pheatmap", "vsn"))

├── LICENSE                # open-source license (MIT)
└── README.md              # project documentation (this file)
