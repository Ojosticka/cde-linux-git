#!/usr/bin/bash

data_url="https://www.stats.govt.nz/assets/Uploads/Annual-enterprise-survey/Annual-enterprise-survey-2023-financial-year-provisional/Download-data/annual-enterprise-survey-2023-financial-year-provisional.csv"

# ETL Script for ETL assignment 

set -e

# define a base directory (absolute path) because of cron job (wsl context issue faced)
base_dir="/mnt/c/Users/user/OneDrive - 1s3w3h/Desktop/CDE Bootcamp/Linux and Git/cde-linux-git"

echo "$(date '+[%Y-%m-%d %H:%M:%S]') 1) EXTRACT: creating folder raw and downloading file..."
mkdir -p "$base_dir/raw"
curl -fSL "$data_url" -o "$base_dir/raw/enterprise_survey.csv"
if [ -f "$base_dir/raw/enterprise_survey.csv" ]; then
  echo "File saved successfully in $base_dir/raw"
else
  echo "File download failed!" >&2
  exit 1
fi

echo "$(date '+[%Y-%m-%d %H:%M:%S]') 2) TRANSFORM: processing raw CSV -> Transformed folder..."
mkdir -p "$base_dir/Transformed"
awk -F, 'NR==1 {
    for (i=1; i<=NF; i++) if ($i == "Variable_code") $i = "variable_code";
    print "year","Value","Units","variable_code";
    next
  } {print $1,$2,$3,$4}' OFS=, "$base_dir/raw/enterprise_survey.csv" > "$base_dir/Transformed/transformed_enterprise_survey.csv"
if [ -f "$base_dir/Transformed/transformed_enterprise_survey.csv" ]; then
  echo "Transformed file saved successfully in $base_dir/Transformed"
else
  echo "Transformation failed!" >&2
  exit 1
fi

echo "$(date '+[%Y-%m-%d %H:%M:%S]') 3) LOAD: putting transformed file into Gold folder..."
mkdir -p "$base_dir/Gold"
cp "$base_dir/Transformed/transformed_enterprise_survey.csv" "$base_dir/Gold/"
if [ -f "$base_dir/Gold/transformed_enterprise_survey.csv" ]; then
  echo "File successfully loaded to $base_dir/Gold"
else
  echo "Loading failed!" >&2
  exit 1
fi

echo "$(date '+[%Y-%m-%d %H:%M:%S]') ETL complete!"
