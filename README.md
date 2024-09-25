# Data_RRWM_MAKANJU
STUDY DESCRIPTION
This study examines the interplay between  home ownership and Social Economic Status (SES)among older adults in Canada. Using the General Social Survey, Cycle 31, from 2017, analyses find that older adults SES is a core determinants of oldage home ownership in Canada. 

Source of  Data
Data Source Availability Statement

Data used for this project is from the Canadian General Social Survey, Cycle 31, year 2017. Data was obtained through ODESI, a service provided by the Ontario Council of University Libraries (https://search1.odesi.ca/#/Links to an external site.).

As part of McGill University, the CAnD3 initiative has a license to use the data for the purposes of training. Those outside of McGill university should not use the data provided through CAnD3's training activities for purposes not related to their CAnD3 training.

Fellows who belong to another DLI institution should re-download the data using the ODESI site using the login provided by their institution if they wish to make use of the data for other purposes.

Citation Statistics Canada. 2020. General Social Survey, Cycle 31, 2017 [Canada]: Family (version 2020-09). Statistics Canada [producer and distributor], accessed September 18, 2024. ID: gss-12M0025-E-2017-c-31

Files Included

Analysis.do – Completes all the analysis for the output tables Cleaning.do – Cleans the data and all the variables used for analysis

Software Requirements Stata/SE 15.0 

Machine Information The analyses were conducted using Hp Windows 10 Home version AMD A10-5750M APU with Radeon(tm) HD Graphics 2.50 GHz

Data analysis Plan

Data upload and exploration

The dataset was downloaded from the 


Research question: Is old age home ownership in Canada determined by individualized social economic status?

Clean and generate the dependent variable (Home Ownership) and key independent variable (whether the individual owns or rent).
Clean and generate control variables: Socio-Demographic control variables: age, marital staus, living arrangement, gender. Economic control variables: income level, visible minority status
Save the cleaned dataset.
Generate analysis do-file.
Create a weighted summary table with all variables (t)
Create logistic regression models (t): Bivariate regression: dependent variable on home ownership. Multivariate regression: include all control variables.

Program and Associate Files

PUMFID: Identifier for the respondent.
WGHT_PER: Weight for the person in the dataset.
AGEGR10: Age grouped in 10-year categories.
SEX: Sex of the respondent.
MARSTAT: Marital status.
LIVARR12: Living arrangement.
VISMIN :visible minority status
FAMINCG2: family income group






