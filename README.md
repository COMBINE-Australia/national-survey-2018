# National student survey 2018

Analysis of responses to the 2018 COMBINE National Student Survey. The final
report is available at https://combine.org.au/national-survey-2018/.

Started on 2018-06-10.

## Directory structure

* **R** - Resuable R code (functions etc.)
* **analysis** - R Markdown analysis files
* **docs** - Rendered analysis reports
* **data** - Raw data used for analysis
* **output** - Output files

## Data

Input data files include:

* **responses_raw.csv** - Raw responses to the Google form

## Analysis

Current analysis files include:

* **template.Rmd** - Analysis template
* **01_exploration.Rmd** - Basic plots of each question
* **02_quality_control.Rmd** - Quality control and filtering of the dataset
  including renaming columns, combining responses and removing incorrect values.
* **03_analysis.Rmd** - More in depth analysis of the clean dataset.
* **04_report.Rmd** - Final report posted on the COMBINE website. Includes
  final figures are text describing/interpreting them.

## Code

Current code files include:

* **manipulation.R** - Functions for summarising responses
