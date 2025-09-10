#!/usr/bin/bash

# Move all CSV and JSON files from raw_json_and_csv_files to moved_json_and_csv

echo "Moving CSV and JSON files"

mv raw_json_and_csv_files/*.csv raw_json_and_csv_files/*.json moved_json_and_csv/

echo "Done."