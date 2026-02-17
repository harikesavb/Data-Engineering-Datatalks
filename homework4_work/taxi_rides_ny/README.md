# NYC Taxi Rides dbt Project

## Run Locally (Windows / PowerShell)

Run commands from inside the project folder:

```powershell
cd taxi_rides_ny
```

Install dependencies:

```powershell
pip install dbt-duckdb duckdb requests
dbt deps
```

If source tables are not loaded yet, create them:

```powershell
python ingest.py
```

Then build the project:

```powershell
dbt seed
dbt build
```

## Notes

- The DuckDB database file used by dbt is `taxi_rides_ny.duckdb`.
- A full `dbt build` currently takes around 5 minutes on this dataset.
