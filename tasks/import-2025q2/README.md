# NSA

## Data 

I used two CMS 2025 Q2 OON files:

1. OON Emergency and Non-Emergency
2. OON Air Ambulance

The QPA and Offers file was  reviewed but excluded from the final counts because it does not contain the provider NPIs, health plan names, dispute numbers, or DLI numbers needed for this analysis.

The relevant variables were identified by examining the dataset descriptions, variable names, and variable labels.

**The original CSV files are not included in this repository because of their large file sizes.**

## Setup Instructions

1. Download the CMS Federal IDR Public Use Files for 2025 Q2.
2. Create a folder named `data` in the repository's main directory.
3. Place the following two OON CSV files inside the `data` folder:
   - `Federal IDR PUF for 2025 Q2 - OON Emergency & Non-Emergency (As of January 21, 2026).csv`
   - `Federal IDR PUF for 2025 Q2 - OON Air Ambulance (As of January 21, 2026).csv`
4. Open `analysis.do` in Stata.
5. Set the working directory to the repository's main directory.
6. Run the entire do-file.

The CSV filenames must match the filenames used in the import commands in `analysis.do`.

## Variables Used

| Variable | Description |
|---|---|
| `providerfacilitynpinumber` | Provider/facility NPI |
| `providerfacilityname` | Provider/facility name |
| `healthplanissuername` | Health plan/issuer name |
| `disputenumber` | Dispute identifier |
| `dlinumber` | Dispute line item identifier |



## Results: 2025 Q2

| Measure | Unique Count |
|---|---:|
| Providers (unique NPIs) | 9,741 |
| Health plans/issuers | 10,621 |
| Disputes | 616,013 |
| Dispute line items | 1,647,029 |

No missing or unreported provider or health plan names were identified in either OON dataset.

## Repository Contents

- `README.md`: Project overview, setup instructions, methodology, and results.
- `analysis.do`: Stata code for importing, cleaning, combining, and analyzing the data.
- `data/`: Local folder containing the original CMS CSV files. The data files are not uploaded to GitHub.
