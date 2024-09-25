* Step 1: Import the dataset
*
import document "C:\Users\User\Desktop\CAnD3_RRWM_1_ASSIGNMENT_1_\CAND3 Data\CAND3 Data\DATA_RRWM.xlsx", sheet("DATA_RRWM_MA
> KANJU") firstrow clear

* Step 2: Drop unnecessary variables (AGEC, AGEDC, AGEGR5)
drop AGEC AGEDC AGEGR5

* Step 3: Recode AGEGR10 into meaningful age groups
* Assuming that AGEGR10 represents 10-year age groups
label define agegrp10 1 "0-9" 2 "10-19" 3 "20-29" 4 "30-39" 5 "40-49" 6 "50-59" ///
                      7 "60-69" 8 "70-79" 9 "80-89" 10 "90+"
label values AGEGR10 agegrp10

* Step 4: Recode SEX variable to Male and Female
label define sexlbl 1 "Male" 2 "Female"
label values SEX sexlbl

* Step 5: Recode MARSTAT (Marital Status)
label define marlbl 1 "Married" 2 "Single" 3 "Divorced" 4 "Widowed" 5 "Separated" 6 "Common Law"
label values MARSTAT marlbl

* Step 6: Recode SEXPR (Sexual preference or experience)
* This recoding assumes categories; modify based on the actual coding in your data
label define sexprlbl 0 "Not reported" 1 "Heterosexual" 2 "Homosexual" 3 "Other"
label values SEXPR sexprlbl

* Step 7: Recode LIVARR12 (Living Arrangement)
label define livarrlbl 1 "Living alone" 2 "Living with spouse" 3 "Living with family" ///
                        4 "Living with friends" 5 "Institutionalized" 6 "Other"
label values LIVARR12 livarrlbl

* Step 8: Recode ODR_10 (Home Ownership)
label define ownership 1 "Owner" 0 "Renter"
label values ODR_10 ownership

* Step 9: Recode VISMIN (Visible Minority Status)
label define vislbl 1 "Non-minority" 2 "Minority"
label values VISMIN vislbl

* Step 10: Recode FAMINCG2 (Family Income Grouping)
label define faminc 1 "Low Income" 2 "Lower-middle Income" 3 "Middle Income" ///
                    4 "Upper-middle Income" 5 "High Income"
label values FAMINCG2 faminc

* Step 11: Exclude individuals younger than 60
* In AGEGR10, values of 6 and above represent individuals aged 60 and above
drop if AGEGR10 < 6

* Step 12: Optional - Rename variables for better readability
rename AGEGR10 Age_Group_10
rename FAMINCG2 Family_Income
rename LIVARR12 Living_Arrangement
rename ODR_10 Home_Ownership
rename VISMIN Visible_Minority

* Step 13: Save the cleaned and recoded dataset
save "C:\path\to\cleaned_data.dta", replace
