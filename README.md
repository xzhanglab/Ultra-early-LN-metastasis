# Ultra-early LN metastasis

Analysis code and sample metadata for the manuscript:

**Ultra-early lymph node metastasis is a part of immunosurveillance and inhibits DCIS progression**

Authors: Yunfeng Ding, Fengshuo Liu, Li Yang, Ling Wu, Zhan Xu, Diana Feng, Crystal Yang, Siyue Wang, Dane Hoffman, Jongmin Choi, Xiaoxin Hao, Liqun Yu, Xuan Li, Nan Guan, Yang Gao, Jun Liu, David G. Edwards, Hilda L. Chan, Yi-Hsuan Wu, Han Xiao, Yong Lu, Weiguo Wu, Wen Bu, Yi Li, Fariba Behbod, and Xiang H.-F. Zhang.

This repository contains scripts and notebooks used for single-cell RNA-seq processing, integration, pseudobulk differential expression, GSEA, and figure generation in a murine DCIS immunosurveillance study.

## Repository contents

| Path | Description |
| --- | --- |
| `code/01.batch individual processing.R` | Per-sample 10x Genomics preprocessing and Seurat object generation. |
| `code/01.2.integration.Rmd` | Seurat integration, clustering, annotation, and export steps. |
| `code/02.0_Matrix.utils.R` | Matrix aggregation utilities used during pseudobulk generation. |
| `code/02.1_data_processing_for_DESeq2.Rmd` | Pseudobulk count aggregation and DESeq2 object preparation. |
| `code/02.2_DESeq2.Rmd` | Differential expression analysis, PCA/heatmaps, and volcano/heatmap outputs. |
| `code/02.3_GSEA.Rmd` | Gene set enrichment analysis and pathway visualization. |
| `code/Code for generate plots.ipynb` | Python/Scanpy plotting notebook for manuscript figures and exploratory summaries. |
| `scRNA.metatable.xlsx` | Source sample metadata workbook. |
| `metadata/scRNA.metatable.csv` | Machine-readable CSV export of the source metadata sheet. |
| `metadata/scRNA.metatable.schema.csv` | Compact schema/profile for the exported metadata columns. |

## Data availability

Raw scRNA-seq data accession information should be added before public release. Large generated objects are intentionally not committed to this repository, including Cell Ranger outputs, Seurat `.rds` objects, AnnData `.h5ad` files, DESeq2 `.rds` objects, and rendered figure outputs.

Expected local working directories used by the scripts:

```text
data/cellranger_outs/processed/
data/merged/
data/LTA_vs_WT/
outs/
```

Some notebooks retain original lab-local `setwd()` paths from the analysis workstation. To rerun outside that environment, edit those paths to the repository root and place downloaded/processed input data under the relative directories above.

## Analysis workflow

1. Download raw scRNA-seq data from the final public accession.
2. Process each 10x sample with `code/01.batch individual processing.R`.
3. Integrate per-sample Seurat objects with `code/01.2.integration.Rmd`.
4. Build pseudobulk matrices and DESeq2 inputs with `code/02.1_data_processing_for_DESeq2.Rmd`.
5. Run differential expression analysis with `code/02.2_DESeq2.Rmd`.
6. Run GSEA/pathway analyses with `code/02.3_GSEA.Rmd`.
7. Generate final plots with `code/Code for generate plots.ipynb`.

## Software

The analysis uses R/Seurat/Bioconductor and Python/Scanpy. Package lists are provided in:

- `r-packages.txt`
- `requirements.txt`

Exact package versions may depend on the original analysis environment. For manuscript reproduction, record the R `sessionInfo()` and Python package versions after rebuilding the environment.

## Citation

If you use this code or metadata, cite the manuscript and this repository. A GitHub-compatible citation file is provided in `CITATION.cff`.

## License

No open-source license has been selected yet. See `LICENSE` for the current reuse terms.
