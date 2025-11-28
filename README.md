Global Maritime Connectivity Analysis

A comprehensive data analysis project examining 19 years of global shipping connectivity patterns using UNCTAD's official Liner Shipping Connectivity Index (LSCI) dataset.

## Project Overview

This project analyzes maritime connectivity trends across 191 economies from 2006 to 2025, identifying:
- Fastest-growing and declining shipping markets
- Regional connectivity patterns and gaps
- COVID-19's impact on global shipping networks
- Strategic opportunities in emerging markets

**Key Finding:** Iraq leads global growth at 13.5% CAGR, while Asia maintains dominance with connectivity levels double those of other regions.

## Business Value

This analysis provides actionable insights for:
- **Shipping companies** planning route expansions
- **Port operators** evaluating infrastructure investments
- **Supply chain managers** assessing connectivity risks
- **Investors** identifying emerging maritime markets

##  Key Insights

- Global connectivity grew 9.4% from 2006-2025, crossing the 100-mark in 2023
- Asia averages 192 LSCI vs. Africa's 54 and Oceania's 30, revealing massive infrastructure gaps
- China (958) and Singapore (568) dominate global shipping networks
- Top 5 growth markets: Iraq, Morocco, Timor-Leste, Somalia, Cambodia
- Venezuela, Ukraine, and Yemen show the fastest connectivity declines due to instability

##  Tech Stack

- **Python (Pandas)** - Data cleaning and transformation
- **MySQL** - Exploratory data analysis with 10+ complex queries
- **Power BI** - Interactive dashboard with 8 visualizations
- **Git** - Version control

## 📁 Project Structure
```
global-maritime-connectivity-analysis/
├── data/
│   ├── raw/                          # Original UNCTAD dataset
│   └── cleaned/                      # Processed data (long format)
├── notebooks/
│   └── data_cleaning.ipynb           # Python data preparation
├── sql/
│   └── eda_queries.sql               # All exploratory queries
├── dashboard/
│   └── maritime_connectivity.pbix    # Power BI dashboard
├── reports/
│   └── executive_summary.pdf         # One-page findings report
└── README.md
```

##  Analysis Highlights

### Data Preparation (Python)
- Transformed wide format to long format (76 quarters per economy)
- Added continent and region classifications for 191 economies
- Handled 1,078 null values representing genuine lack of connectivity
- Created temporal features (year, quarter, date)

### SQL Analysis
Key queries include:
1. Top/bottom economies by average LSCI
2. Year-over-year global connectivity trends
3. Continental comparison over 19 years
4. CAGR calculation for growth/decline analysis
5. Africa-specific deep dive

### Visualization (Power BI)
- Global connectivity trend line (2006-2025)
- Top 5 and bottom 5 economies
- Continental comparison
- Africa's connectivity evolution
- Fastest-growing economies (CAGR)
- Interactive world map with connectivity heatmap

##  Sample Findings

**Fastest Growing (CAGR):**
1. Iraq: 13.51%
2. Morocco: 7.31%
3. Timor-Leste: 7.07%

**Fastest Declining (CAGR):**
1. Venezuela: -5.60%
2. Ukraine: -4.52%
3. Yemen: -4.31%

**Continental Leaders:**
- Asia: 191.62 avg LSCI
- Europe: 131.80
- South America: 80.79

##  Skills Demonstrated

- Data wrangling and cleaning with Pandas
- SQL window functions and CTEs for complex analysis
- Time series analysis and growth rate calculations
- DAX measures for business intelligence
- Dashboard design and storytelling with data
- Working with official UN statistical data


##  Data Source

**UNCTAD Liner Shipping Connectivity Index (LSCI)**
- Source: United Nations Conference on Trade and Development (UNCTAD)
- Period: Q1 2006 - Q3 2025
- Coverage: 191 economies/territories
- Update frequency: Quarterly
- Link: [https://unctadstat.unctad.org/datacentre/dataviewer/US.LSCI]


## 📝 Key Learnings

- Missing data in official statistics often represents real-world conditions (e.g., no connectivity) rather than data quality issues
- CAGR provides more accurate growth assessment than simple percentage change for multi-year trends
- Long-format data structures enable more flexible and efficient SQL analysis
- Geopolitical events (COVID-19, conflicts, sanctions) have measurable impacts on maritime networks
