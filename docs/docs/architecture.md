# Architecture (high-level)

This document outlines a scalable, integration-friendly approach for the TaxiMaps MVP and how it would be instrumented to support KPI-led iteration.

## Components
- **Client (future app/web):** Utility dashboard, quick actions, alerts, feedback, event tracking
- **API layer (future):** Auth, feature config, user preferences, event ingestion endpoint
- **App database (future):** User settings, saved presets, configuration
- **Analytics store:** Event stream/table to track usage, reliability, and outcomes
- **Integrations layer:** External services such as Maps/Location APIs

## High-level flow
1. User triggers an action in the client (dashboard view, quick action, alert setting, etc.)
2. The client emits an event to the analytics store (directly or via an API ingestion endpoint)
3. Events are used to compute KPIs (WAU, adoption, completion rate, error rate)
4. KPI outcomes inform prioritisation and iteration of the MVP

## Diagram
```mermaid
flowchart LR
  A[Client App] --> B[API Layer]
  A --> C[Event Tracking]
  C --> D[(Analytics Store)]
  B --> E[(App DB)]
  B --> F[Integrations Layer]
  F --> G[Maps/Location Provider]
