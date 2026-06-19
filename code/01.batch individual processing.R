library(Seurat)
library(dplyr)
library(ggplot2)
library(readr)
setwd("~/Library/CloudStorage/OneDrive-BaylorCollegeofMedicine/Lab/Yunfeng/data/cellranger_outs/processed")
# Read the metadata CSV (ensure header names are correct)
metadata <- read_csv("metadata.csv")
# Increase the maximum allowed size of global variables to 8 GB
options(future.globals.maxSize = 8 * 1024^3)  # 8 GB

# Loop through each row of metadata
for (i in 1:nrow(metadata)) {
  
  # Get sample ID (also used as folder name and output filename)
  sample_id <- metadata$sample_id[i]
  data_dir <- file.path(".", sample_id)  # adjust if data is in another directory
  
  # Check if directory exists
  if (!dir.exists(data_dir)) {
    message("Skipping ", sample_id, " - directory does not exist.")
    next
  }
  
  # Read 10X data
  df.data <- Read10X(data.dir = data_dir)
  
  # Create Seurat object
  df <- CreateSeuratObject(counts = df.data[["Gene Expression"]], project = sample_id, min.cells = 3, min.features = 200)
  
  # Calculate additional QC metrics
  df$log10GenesPerUMI <- log10(df$nFeature_RNA) / log10(df$nCount_RNA)
  df$mitoRatio <- PercentageFeatureSet(object = df, pattern = "^mt-") / 100
  
  # Add metadata from the current row
  meta_row <- metadata[i, ]  # this is a 1-row tibble/data.frame
  for (colname in colnames(meta_row)) {
    df[[colname]] <- as.character(meta_row[[colname]])
  }
  
  # Quality filtering
  df <- subset(df, subset = nFeature_RNA >= 250 & 
                 nFeature_RNA < 6000 & 
                 log10GenesPerUMI > 0.80 & 
                 mitoRatio < 0.20)
  
  # Normalize and run standard workflow
  df[["percent.mt"]] <- PercentageFeatureSet(df, pattern = "^mt-")
  df <- NormalizeData(df, normalization.method = "LogNormalize", scale.factor = 10000)
  df <- FindVariableFeatures(df, selection.method = "vst", nfeatures = 2000)
  df <- SCTransform(df, vars.to.regress = "percent.mt", verbose = FALSE)
  df <- RunPCA(df, features = VariableFeatures(object = df))
  df <- FindNeighbors(df, dims = 1:20)
  df <- FindClusters(df, resolution = 0.5)

  # Run UMAP if umap-learn is installed
  if ("umap-learn" %in% rownames(installed.packages())) {
    df <- RunUMAP(df, dims = 1:20)
  }
  
  # Save Seurat object with sample_id as filename in current directory
  saveRDS(df, paste0(sample_id, ".rds"))
}
"NeuRatHA" %in% rownames(df)
