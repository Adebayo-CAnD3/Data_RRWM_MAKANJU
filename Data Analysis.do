********************************************************************************
* Stata 15 Do-File: Descriptive Analysis and Binary Logit Regression
* Author: MAKANJU Adebayo
* Purpose: Conduct descriptive analysis and perform binary logistic regression
********************************************************************************

* 1. LOAD CLEANED DATA
* Load the cleaned dataset from the earlier step.
* Replace "path_to_your_file" with the actual path where you saved your cleaned dataset.
use "path_to_your_file/cleaned_data.dta", clear

********************************************************************************
* 2. DESCRIPTIVE ANALYSIS
********************************************************************************

* 2.1 FREQUENCY TABLES
* Generate frequency tables for each recoded variable to understand the distribution of the data.

* 2.1.1 Frequency of Home Ownership (Ownership)
tabulate ownership
label variable ownership "Home Ownership (1 = Own, 0 = Rent)"

* 2.1.2 Frequency of Income Categories (Income Category)
tabulate incomecat
label variable incomecat "Income Category (1 = Low, 6 = Very High)"

* 2.1.3 Frequency of Age Categories (New Age Category)
tabulate agecat_new
label variable agecat_new "Age Group (60-100)"

* 2.1.4 Frequency of Marital Status (Marital Status Category)
tabulate marstatcat
label variable marstatcat "Marital Status (1 = Married, 2 = Separated/Divorced/Widowed, 3 = Single)"

* 2.1.5 Frequency of Living Arrangements (Living Arrangement Category)
tabulate livarrcat
label variable livarrcat "Living Arrangement (1 = Alone, 2 = With Spouse, 3 = With Children, 4 = Other)"

* 2.1.6 Frequency of Race (Race Category)
tabulate racecat
label variable racecat "Race (1 = Visible Minority, 2 = Non-visible Minority)"

********************************************************************************
* 2.2 CROSS-TABULATIONS
* Perform cross-tabulations to explore relationships between the dependent variable (home ownership) 
* and independent variables. We will use weighted cross-tabulation where applicable.

* 2.2.1 Cross-tabulation: Home Ownership by Income
svy: tabulate ownership incomecat, column row
* This will show the distribution of home ownership across income categories, with row and column percentages.

* 2.2.2 Cross-tabulation: Home Ownership by Age Group
svy: tabulate ownership agecat_new, column row
* This will show the distribution of home ownership across age groups.

* 2.2.3 Cross-tabulation: Home Ownership by Marital Status
svy: tabulate ownership marstatcat, column row
* This will show the distribution of home ownership across marital status categories.

* 2.2.4 Cross-tabulation: Home Ownership by Living Arrangement
svy: tabulate ownership livarrcat, column row
* This will show the distribution of home ownership across different living arrangements.

* 2.2.5 Cross-tabulation: Home Ownership by Race
svy: tabulate ownership racecat, column row
* This will show the distribution of home ownership across race categories.

********************************************************************************
* 3. BINARY LOGISTIC REGRESSION
********************************************************************************

* 3.1 DEFINE THE MODEL
* The dependent variable is home ownership (ownership), and the independent variables are income, age, 
* marital status, living arrangement, and race.

* 3.2 Logistic Regression Model
* Estimate a binary logistic regression model where the outcome is the probability of owning a home.

svy: logistic ownership incomecat agecat_new marstatcat livarrcat racecat
* This model predicts home ownership based on income, age, marital status, living arrangement, and race.

* 3.3 DISPLAY ODDS RATIOS (ORs)
* Display the odds ratios instead of the logistic coefficients for easier interpretation.

svy: logistic ownership incomecat agecat_new marstatcat livarrcat racecat, or
* The ORs show the likelihood of owning a home relative to the reference group for each independent variable.

********************************************************************************
* 4. POST-ESTIMATION AND DIAGNOSTICS
********************************************************************************

* 4.1 PREDICT PROBABILITIES
* After running the logistic regression, you can predict the probability of home ownership for each observation.

predict phat, pr
* `phat` will contain the predicted probabilities of owning a home.

* 4.2 MODEL GOODNESS-OF-FIT (OPTIONAL)
* Check the goodness-of-fit of the logistic regression model to assess how well the model fits the data.

estat gof
* This provides a goodness-of-fit statistic, indicating how well the model fits the data.

********************************************************************************
* 5. INTERPRETATION OF RESULTS
********************************************************************************

* For each independent variable in the logistic regression, the odds ratios (ORs) show the likelihood of home ownership:
  * **Income**: Higher income levels are expected to increase the odds of owning a home.
  * **Age**: Different age groups will have varying probabilities of home ownership.
  * **Marital Status**: Marital status can influence the likelihood of home ownership (e.g., married individuals may have higher odds).
  * **Living Arrangement**: Living arrangements (e.g., living alone vs. with family) could impact home ownership decisions.
  * **Race**: Visible minorities may have different odds of home ownership compared to non-visible minorities.

* Odds Ratio (OR) Interpretation:
  * OR > 1: The factor increases the odds of home ownership compared to the reference category.
  * OR < 1: The factor decreases the odds of home ownership compared to the reference category.

********************************************************************************
* 6. SAVE RESULTS
********************************************************************************

* 6.1 Save the cleaned data with the predicted probabilities (optional).
save "path_to_your_file/cleaned_data_with_predictions.dta", replace

* 6.2 Export the logistic regression results to a text file or Word document (optional).
* Replace "path_to_output_file" with your desired file path.
outreg2 using "path_to_output_file/logit_results.doc", replace ctitle(Logit Model for Home Ownership)
