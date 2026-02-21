# TaxiMaps – Driver Utility App (MVP)

TaxiMaps is a driver utility app concept focused on reducing day-to-day friction through real-time utility features and optimisation tools. This repository documents the product thinking and technical approach behind an MVP, including requirements, roadmap, architecture, and a small KPI demo using sample data.

## What I’m demonstrating here
- Product thinking: problem framing, MVP scope, prioritisation, requirements, acceptance criteria
- Technical thinking: integration approach, scalable architecture, instrumentation plan
- Data thinking: KPI definitions + example queries using dummy data (no proprietary information)

## MVP scope (initial)
- Core utility features (MVP set)
- Simple alerts/logic (rules-based)
- Lightweight analytics to support iteration
- Map + location functionality (integration approach documented)

## Success metrics (MVP)
- Weekly active users (WAU)
- Feature adoption rate (per feature)
- Retention (7-day / 30-day)
- Task completion time for key flows
- Error rate (failed actions / requests)

## Repo structure
- /docs/PRD.md – product requirements + user stories + acceptance criteria
- /docs/roadmap.md – MVP → V1 → V2 plan
- /docs/architecture.md – scalable system design + instrumentation plan
- /data/sample_events.csv – dummy event data
- /sql/kpi_queries.sql – example KPI queries
- /scripts/kpi_report.py – simple script to output KPI summary from sample data

- ## Run the KPI demo (optional)
This repo includes a small KPI demo using sample event data.

1) Download or clone the repo  
2) Run the script:
```bash
python scripts/kpi_report.py
