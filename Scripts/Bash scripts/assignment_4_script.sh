#!/usr/bin/bash

# Script to load all CSV files from posey folder into PostgreSQL (posey_db)

DB_NAME="posey_db"
DB_USER="postgres"
FOLDER="posey"

for file in "$FOLDER"/*.csv; do
  table_name=$(basename "$file" .csv)
  echo "Importing $file into table: $table_name"
  
  # Copy the CSV file into the table
  psql -U "$DB_USER" -d "$DB_NAME" -c "\copy $table_name FROM '$file' CSV HEADER"
done

echo "All CSV files imported successfully into $DB_NAME"
