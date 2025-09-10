# CoreDataEngineers ETL & SQL Assignment

This repository contains my solutions for the **CoreDataEngineers ETL and SQL assignment**.

##  Repository Structure

- **Scripts/** – Main folder containing all scripts  
  - **Bash scripts/** – Bash scripts for ETL process, file movement, and PostgreSQL loading  
  - **SQL scripts/** – SQL scripts answering the manager's analytical questions  

## Tasks Completed

### 1. ETL Bash Script
- **Extract:** Downloads a CSV file from a URL (set using an environment variable) and saves it in the `raw/` folder.  
- **Transform:** Renames `Variable_code` to `variable_code` and selects only `year`, `Value`, `Units`, `variable_code`.  
  Saves the result to `Transformed/2023_year_finance.csv`.  
- **Load:** Moves the transformed file to the `Gold/` folder.  

### 2. Cron Job
- Scheduled the ETL script to run **daily at 12:00 AM** using crontab on wsl

### 3. File Movement Script
- Moves all CSV and JSON files from a given folder into `json_and_CSV/`.

### 4. PostgreSQL Loader Script
- Iterates over CSV files and loads them into a PostgreSQL database named **posey_db**.

### 5. SQL Queries
- SQL scripts answer the manager’s questions, including:
  - Orders with high `gloss_qty` or `poster_qty`
  - Orders where `standard_qty = 0`
  - Company name and contact filters
  - Region, sales rep, and account report (alphabetically sorted)
