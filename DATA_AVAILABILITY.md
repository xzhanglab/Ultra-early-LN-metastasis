# Data Availability

Processed and analysis-ready datasets are hosted on Zenodo:

- Record: <https://zenodo.org/records/20434756>
- Concept DOI: <https://doi.org/10.5281/zenodo.20434755>
- Version DOI: <https://doi.org/10.5281/zenodo.20434756>

The Zenodo record is listed as restricted access and includes processed datasets supporting the mouse tumor study, including mouse scRNA-seq Cell Ranger output matrices, per-sample Seurat RDS objects, integrated scRNA-seq objects in RDS and H5AD formats, sample metadata, IHC image-analysis inputs and outputs, IMC image-analysis inputs and outputs with spatial-analysis results, and a human DCIS scRNA-seq reference dataset available under GEO accession `GSE333697`.

## Included in this repository

- `scRNA.metatable.xlsx`: original sample metadata workbook.
- `metadata/scRNA.metatable.csv`: cleaned flat CSV export of the named columns in the workbook.
- `metadata/scRNA.metatable.schema.csv`: column-level profile of the CSV export.
- `code/`: analysis scripts and notebooks.
- `GitHub.png`: repository banner used by the README.
- `index.html`: static project page source.

## Not included

The following generated or large files are excluded from git and should be regenerated or obtained from the data archive:

- Cell Ranger output directories.
- Seurat objects (`.rds`, `.RDS`, `.h5seurat`).
- AnnData objects (`.h5ad`).
- DESeq2 intermediate objects and result RDS files.
- Rendered figure/output folders such as `outs/`, `results/`, and `figures/`.

## Imaging analysis

For multichannel IMC data spatial imaging analysis, we used the published TME Spatial pipeline:

- <https://github.com/fengshuoliu/TME_spatial>

## Reanalysis notes

The scripts expect project-root-relative folders such as `data/`, `data/merged/`, and `outs/`. Some original notebooks also contain lab-local absolute paths; replace those with local project paths before rerunning.
