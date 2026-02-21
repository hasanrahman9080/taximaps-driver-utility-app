# PRD – TaxiMaps (Driver Utility App) – MVP

## Problem statement
Drivers often rely on multiple disconnected tools for common tasks. TaxiMaps aims to consolidate high-frequency utility needs into a single lightweight workflow, reducing time spent switching apps and improving decision-making.

## Goals (MVP)
- Provide a small set of utility features that remove friction in common daily workflows
- Validate demand using measurable usage signals (adoption, retention, repeated use)
- Establish an instrumentation baseline to iterate based on data

## Non-goals (MVP)
- Building a full dispatch/ride allocation product
- Advanced ML optimisation
- Multi-platform native builds (architecture documented; implementation can follow)

## MVP features (prioritised)
P0 (must have)
1. Utility Dashboard
2. Quick Actions
3. Alerts (rules-based)
4. Basic Analytics (usage + outcomes tracking)

P1 (should have)
5. Saved presets
6. Feedback capture

## User stories + acceptance criteria
**US1: Dashboard**
- Loads in under 2 seconds on normal connectivity
- Tracks event: dashboard_view

**US2: Quick action**
- Reachable in 2 taps or fewer from app open
- Tracks: quick_action_click, quick_action_complete, quick_action_error

**US3: Alerts**
- Enable/disable per rule
- Tracks: alert_enabled, alert_triggered, alert_dismissed

## Metrics
- WAU (weekly active users)
- Feature adoption
- Completion rate
- Error rate
- 7-day retention
