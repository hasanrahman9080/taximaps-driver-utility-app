import csv
from datetime import datetime, timezone

DATA_PATH = "../data/sample_events.csv"

def parse_time(s: str) -> datetime:
    return datetime.fromisoformat(s.replace("Z", "+00:00")).astimezone(timezone.utc)

def main():
    events = []
    with open(DATA_PATH, newline="", encoding="utf-8") as f:
        reader = csv.DictReader(f)
        for row in reader:
            row["event_time"] = parse_time(row["event_time"])
            events.append(row)

    # Example WAU window
    start = parse_time("2026-02-01T00:00:00Z")
    end = parse_time("2026-02-08T00:00:00Z")

    window = [e for e in events if start <= e["event_time"] < end]
    wau = len({e["user_id"] for e in window})

    # Utility KPI example
    clicks = [e for e in window if e["feature"] == "utility_a" and e["event_name"] == "quick_action_click"]
    completes = [e for e in window if e["feature"] == "utility_a" and e["event_name"] == "quick_action_complete"]
    errors = [e for e in window if e["feature"] == "utility_a" and e["event_name"] == "quick_action_error"]

    completion_rate = (len(completes) / len(clicks)) if clicks else 0.0
    error_rate = (len(errors) / len(clicks)) if clicks else 0.0

    print("KPI Report (sample data)")
    print(f"WAU (2026-02-01 to 2026-02-08): {wau}")
    print(f"utility_a clicks: {len(clicks)}")
    print(f"utility_a completes: {len(completes)}")
    print(f"utility_a errors: {len(errors)}")
    print(f"utility_a completion rate: {completion_rate:.2%}")
    print(f"utility_a error rate: {error_rate:.2%}")

if __name__ == "__main__":
    main()
