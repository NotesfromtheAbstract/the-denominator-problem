# Notes from the Abstract — Men's Health Piece

**Working Title:** TBD
**Author:** Andrew R. Crocker
**Publication:** [Notes from the Abstract](https://andrewrcrocker.substack.com)

## Overview

This repository contains the data, code, and visual assets for a long-form piece arguing that men are the underserved population in American healthcare, supported by original primary research surveying all 20 US News & World Report Honor Roll hospitals (2025-2026) for the existence of men's versus women's health center programming.

## Contents

```
├── mens_health_full_draft.md       # Full prose draft with endnotes
├── aeo_assets.md                   # Subtitle, meta description, social sharing text
├── data/
│   └── honor_roll_health_centers.csv   # Original dataset: Honor Roll hospital survey
├── R/
│   ├── 01_who_gets_a_program.R         # Hospital health center comparison chart
│   ├── 02_the_rural_penalty.R          # Rural-urban life expectancy gap by sex
│   └── 03_adjusted_mortality_ratios.R  # JAMA cause-specific mortality ratios
├── charts/
│   ├── honor_roll_health_centers.png   # Rendered chart 1
│   ├── rural_penalty_chart.png         # Rendered chart 2
│   └── adjusted_mortality_ratios.png   # Rendered chart 3
├── README.md
├── LICENSE
└── .gitignore
```

## Original Data

The `data/honor_roll_health_centers.csv` file contains the results of a June 2026 survey of all 20 US News & World Report Best Hospitals Honor Roll hospitals (2025-2026). Each hospital was checked for the existence of a branded women's health center and a men's health center, with men's health centers further classified by type (multidisciplinary vs. urology-only).

Key findings:
- 19 of 19 hospitals (100%) have a women's health center
- 9 of 19 hospitals (47%) have any kind of men's health center
- 3 of 19 hospitals (16%) have a multidisciplinary men's health center

Baseline comparison: Alam et al. (2017, PMID: 29264139) found 98% vs. 32% among the top 50 hospitals.

## Charts

All charts use the `theme_1950s()` custom ggplot2 theme. R scripts are designed to render at 1456x819px (16:9) at 100 DPI with Arial font. Local rendering at 150 DPI is recommended.

The repository includes pre-rendered PNGs generated via Python/matplotlib matching the theme palette for preview. Run the R scripts locally for publication-quality output.

## Key Sources

- Francis J, Graubard BI, Katki H, Jackson SS. "Sex and All-Cause Mortality in the US, 1999 to 2018." *JAMA Netw Open.* 2026;9(1):e2556299.
- Chapel JM, et al. "The urban-rural gap in older Americans' healthy life expectancy." *J Rural Health.* 2025 Jan;41(1):e12875.
- Alam R, et al. "The men's health center: disparities in gender specific health services among the top 50 'best hospitals' in America." *Int J Mens Comm Soc Health.* 2017. PMID: 29264139.
- Kamath SD, et al. "Disparities in NIH and federal cancer research funding across different cancer types." *J Clin Oncol.* 2025;43(16_suppl):11025.
- CDC/NCHS Data Brief No. 548. "Mortality in the United States, 2024." January 2026.

## License

Copyright (c) 2026 Andrew R. Crocker. All rights reserved. See LICENSE file.
