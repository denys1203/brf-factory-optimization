# Industrial Operations Optimization - BRF

[![Python](https://img.shields.io/badge/Python-3.8%2B-blue)](https://www.python.org/)
[![Jupyter](https://img.shields.io/badge/Jupyter-Notebook-orange)](https://jupyter.org/)
[![License](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE)
[![Optimization](https://img.shields.io/badge/Optimization-Linear_Programming-red)](https://github.com)

*[Versão em Português](README.md)*

## Overview

**Industrial operations optimization** project developed for competitive analysis of production facilities. The goal is to determine the best investment and resource allocation strategy considering demand growth, operational efficiency, and financial returns.

### Business Problem

A company operates **3 factories** producing **5 product types**, with different:
- Production capacities
- Operating costs (fixed and variable)
- Production efficiencies
- Tax structures (ICMS - Brazilian state VAT)

**Challenge:** Determine which factory(ies) to expand by 60% capacity and which to close, considering:
- Meet 100% of projected 5-year demand
- Maximize financial returns
- Minimize investment payback

---

## Methodology

### 1. **Capacity Modeling**
Deliverable capacity calculation considering:
- Operational efficiency
- Waste rate (out-of-spec products)
- Weekdays vs. Saturdays

$$
\text{Cap}_{\text{deliverable}} = \left[\left(\text{Cap}_{\text{mon-fri}} \times 22\right) + \left(\text{Cap}_{\text{sat}} \times 4\right)\right] \times \text{Efficiency} \times (1 - \text{Waste})
$$

### 2. **Unit Contribution**
Unit economics analysis per factory and product:

$$
\text{Contrib}_{p,f} = \text{Price}_p \times (1-\text{ICMS}_f) - \text{Freight}_p - \frac{\text{VC}_{p,f}}{1-\text{Waste}_f}
$$

### 3. **Allocation Optimization**
Linear programming problem (greedy heuristic):

$$
\max \sum_{p,f} \text{Contrib}_{p,f} \times x_{p,f}
$$

Subject to:
$$
\sum_f x_{p,f} = \text{Demand}_p \quad \forall p \qquad \sum_p x_{p,f} \leq \text{Cap}_f \quad \forall f
$$

### 4. **Scenario Analysis**
Exhaustive enumeration of all combinations of:
- Expansion (+60% capacity)
- Facility closures
- Filter: only scenarios meeting 100% of demand

### 5. **Financial Metrics**

**Monthly Incremental Gain (Δ):**
$$
\Delta = (\text{Profit}_{\text{scenario}} - \text{ExtraPayroll} + \text{SavedFixed}) - \text{Profit}_{\text{baseline}}
$$

**Payback:**
$$
\text{Payback (months)} = \frac{\text{CAPEX}}{\Delta}
$$

---

## Key Results

### Optimal Solution

| Metric | Value |
|---------|-------|
| **Strategy** | Expand Factories A + B / Close Factory C |
| **Monthly Gain (Δ)** | R$ 688,470 |
| **CAPEX** | R$ 8,000,000 |
| **Payback** | **11.6 months** |
| **Demand Coverage** | 100% (7,036 tons/month) |

### Scenario Comparison

**Key Insight:** The optimal solution combines:
- Expansion in factories with better unit economics (A and B have lower variable costs and more competitive ICMS)
- Saves R$ 500k/month in fixed costs by closing Factory C
- ROI of 8.6% per month (11.6-month payback)

---

## How to Run

### Prerequisites
```bash
python >= 3.8
```

### Installation
```bash
# Clone the repository
git clone https://github.com/your-username/brf-optimization.git
cd brf-optimization

# Create virtual environment
python -m venv venv
source venv/bin/activate  # Windows: venv\Scripts\activate

# Install dependencies
pip install -r requirements.txt
```

### Execution
```bash
# Start Jupyter Notebook
jupyter notebook

# Open: notebooks/otimizacao_BRF_Denys.ipynb
```

---

## Project Structure

```
brf-optimization/
│
├── notebooks/
│   └── otimizacao_BRF_Denys.ipynb    # Main analysis notebook
│
├── data/                              # (Data embedded in notebook)
│
├── outputs/                           # HTML reports and charts
│
├── docs/                              # Additional documentation
│   └── case_description.md
│
├── requirements.txt                   # Python dependencies
├── .gitignore
├── README.md                          # Portuguese version
└── README_EN.md                       # English version (this file)
```

---

## Technologies

- **Python 3.x** - Main language
- **Pandas** - Data manipulation and analysis
- **NumPy** - Numerical computing
- **Matplotlib** - Visualizations
- **Jupyter Notebook** - Interactive development environment
- **Linear Programming** - Optimization (greedy heuristic)

---

## Technical Details

### Step 1: Current Situation Analysis
- Comparable deliverable capacity calculation
- Unit contribution matrix (15 product × factory combinations)
- Optimal allocation of current demand
- Monthly P&L per factory

### Step 2: Future Projection (5 years)
- Demand growth: +10% p.a. → **+61% cumulative**
- Individual expansion testing (+60% capacity)
- Payback and incremental gain calculation

### Step 3: Combinatorial Optimization
- **Power set**: 2³ × 2² = 32 theoretical combinations
- Feasibility filter: 100% demand fulfillment
- **8 admissible scenarios** identified
- Selection criteria: (1) max Δ, (2) min payback, (3) min CAPEX

---

## Sensitivity Analysis

### Admissible Scenarios (100% Demand Met)

| # | Expand | Close | Δ Monthly | Payback | CAPEX |
|---|--------|-------|-----------|---------|-------|
| 1 | A, B | C | R$ 688k | 11.6 m | R$ 8M |
| 2 | A, C | B | R$ 648k | 11.6 m | R$ 7.5M |
| 3 | A, B | - | R$ 138k | 58.0 m | R$ 8M |
| 4 | B, C | A | R$ 98k | 56.1 m | R$ 5.5M |
| ... | ... | ... | ... | ... | ... |

> **Note:** All scenarios including factory closure show **significantly better payback** due to fixed cost savings.

---

## Insights and Recommendations

### Strategic Recommendation
**Expand Factories A and B (+60%) and close Factory C**

**Rationale:**
1. **Fast return**: Only 11.6-month payback
2. **Highest operational gain**: R$ 688k/month additional
3. **Tax efficiency**: ICMS reduction (A=18%, B=15% vs C=16.5%)
4. **Variable costs**: A and B have VC ~R$ 20/ton lower than C per product
5. **Fixed cost savings**: R$ 500k/month eliminated by closing C

### Risk Analysis
- **Installed capacity post-expansion**: 7,300 tons/month
- **Year 5 demand**: 7,036 tons/month
- **Safety margin**: 3.8% (buffer for volatility)

### Suggested Next Steps
1. NPV/IRR analysis considering time value of money
2. Sensitivity study for demand variations (±10%)
3. Transition cost assessment (severances, logistics)
4. Social/regional impact analysis of closure

---

## References and Context

This project was developed as part of a selection process for **Optimization Specialist (OTM)** at BRF S.A., one of the world's largest food companies.

### Applied Concepts
- Operations Research
- Linear Programming
- Investment Analysis (Payback, ROI)
- Unit Economics
- Industrial Operations Management

---

## Author

**Denys Santos**

[![LinkedIn](https://img.shields.io/badge/LinkedIn-Connect-blue)](https://linkedin.com/in/your-profile)
[![GitHub](https://img.shields.io/badge/GitHub-Follow-black)](https://github.com/your-username)
[![Email](https://img.shields.io/badge/Email-Contact-red)](mailto:your-email@example.com)

---

## License

This project is under the MIT License - see the [LICENSE](LICENSE) file for details.

---

## Acknowledgments

- BRF S.A. for the opportunity and challenging case study
- Python/Data Science community for open-source tools

---

<p align="center">
  <i>Developed for industrial operations optimization</i>
</p>

