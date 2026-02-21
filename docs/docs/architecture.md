# Architecture (high-level)

## Components
- Client app: dashboard + utilities + event tracking
- API layer: configuration, event ingestion (future)
- Data store: preferences and saved presets (future)
- Analytics store: event stream for KPIs
- Integrations layer: maps/location services

## Diagram
```mermaid
flowchart LR
  A[Client App] --> B[API Layer]
  A --> C[Event Tracking]
  C --> D[(Analytics Store)]
  B --> E[Integrations Layer]
  E --> F[Maps/Location Provider]
