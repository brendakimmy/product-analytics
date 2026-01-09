Credit Analytics Case Study

Project Overview
This repository contains a dbt-based analytics framework designed to monitor credit portfolio health and customer satisfaction

1. Portfolio Performance Analysis
- Trends: Repayment health is tracked across age and income segments. 
- Key Findings: Preliminary data suggests that middle-income segments (20k-50k) show the most stable repayment behavior.
2. Risk Metrics
I recommend tracking:
- PAR30 (Portfolio at Risk):Percentage of portfolio unpaid for >30 days.
- NPS-Credit Correlation:Monitoring how repayment friction impacts brand loyalty.

3. Data Limitations & Assumptions
- Assumptions: 'Duration' was assumed to be months; reference date for age is Dec 31, 2025.
- Limitations: Point-in-Time (PIT) snapshots hide intra-quarter delinquency. We miss the "hidden" risk of customers who fall behind and catch up between reports.

4. Recommendations
- Implement transaction-level logging instead of quarterly snapshots.
- Automate NPS surveys triggered by credit milestones (e.g., final payment).
