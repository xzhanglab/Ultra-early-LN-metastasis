# Metadata

This directory contains machine-readable exports derived from `../scRNA.metatable.xlsx`.

| File | Description |
| --- | --- |
| `scRNA.metatable.csv` | Flat CSV export of the named columns in the `scRNA.metatable` worksheet. Blank unnamed columns from the workbook were omitted. |
| `scRNA.metatable.schema.csv` | Column profile with non-empty value counts, unique-value counts, and example values. |

Each row in `scRNA.metatable.csv` represents one scRNA-seq sample or sample-library entry. Important columns include sample identifiers, batch/library information, mouse identifiers, treatment, tissue, CD45 status, lymph node treatment, harvest time, HA tag status, QC status, and initial cell counts.
