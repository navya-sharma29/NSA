# Task 2: Construct a 2024–2025 Provider-Dispute Panel

## Objective

Construct a combined dataset using the CMS Federal Independent Dispute Resolution (IDR) Public Use Files for 2024 and 2025.

The goal is to track providers across quarters and disputes by creating a provider-dispute-level dataset containing provider identifiers, dispute identifiers, date information, and other relevant variables.

## Data Sources

This task will use the relevant CMS Federal IDR Public Use Files for all available quarters in 2024 and 2025.

The CMS data dictionaries and codebooks will be reviewed to identify the appropriate tables, variables, and identifiers needed to construct the panel.

## Methodology

The analysis will involve the following steps:

1. Download the relevant quarterly CMS Federal IDR datasets for 2024 and 2025.
2. Review the associated codebooks and data dictionaries.
3. Identify the appropriate tables and variables for provider and dispute information.
4. Construct a consistent provider identifier across quarters.
5. Standardize variable names and formats across quarterly datasets.
6. Append the quarterly datasets into one combined dataset.
7. Construct a provider-dispute-level dataset.
8. Retain relevant date, quarter, and other dispute information.
9. Check for missing identifiers, duplicate observations, and consistency across quarters.

## Intended Unit of Observation

The intended unit of observation is one provider-dispute combination.

A provider may appear in multiple disputes and across multiple quarters. The dataset should preserve these observations to allow providers to be tracked over time.

## Expected Variables

The final variable list will depend on the CMS codebooks. Potential variables include:

- Provider identifier
- Provider name
- Dispute number
- Dispute date or relevant date information
- Year
- Quarter
- Other relevant dispute characteristics

## Folder Contents

- `code/`: Stata scripts used to download, process, combine, and construct the panel.
- `output/`: Combined and processed datasets, along with summary statistics and validation results.

## Status

In progress.
