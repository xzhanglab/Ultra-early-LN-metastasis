# Data Availability

Raw scRNA-seq data accession information should be added here before public release.

## Included in this repository

- `scRNA.metatable.xlsx`: original sample metadata workbook.
- `metadata/scRNA.metatable.csv`: cleaned flat CSV export of the named columns in the workbook.
- `metadata/scRNA.metatable.schema.csv`: column-level profile of the CSV export.
- `code/`: analysis scripts and notebooks.

## Not included

The following generated or large files are excluded from git and should be regenerated or obtained from the data archive:

- Cell Ranger output directories.
- Seurat objects (`.rds`, `.RDS`, `.h5seurat`).
- AnnData objects (`.h5ad`).
- DESeq2 intermediate objects and result RDS files.
- Rendered figure/output folders such as `outs/`, `results/`, and `figures/`.

## Reanalysis notes

The scripts expect project-root-relative folders such as `data/`, `data/merged/`, and `outs/`. Some original notebooks also contain lab-local absolute paths; replace those with local project paths before rerunning.
