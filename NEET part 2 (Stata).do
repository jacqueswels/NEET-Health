clear
use "/Users/jacqueswels/NEETdata2.dta"

* create dummies for equivalized income quantiles (note: no factor variable in BO in Stata) 
tab eq_income_q, gen(eqinc_)

* create dummies for child responsibilities (note: no factor variable in BO in Stata) 
tab child_resp, gen(child_)

* create dummies for ethnicity (note: no factor variable in BO in Stata) 
tab ethn, gen(ethn_)

* create dummies for education (note: no factor variable in BO in Stata) 
tab educbi, gen(educbi_)

* create dummies for region (note: no factor variable in BO in Stata) 
tab region, gen(region_)

* create dummies for IMD (note: no factor variable in BO in Stata) 
tab IMD, gen(IMD_)

* create dummies for age group (note: no factor variable in BO in Stata) 
tab agegroup, gen(agegroup_)

* create dummies for sex (note: no factor variable in BO in Stata) 
tab sex, gen(sex_)

* create dummies for multimorbidity (note: no factor variable in BO in Stata) 
tab bicount, gen(multiorbidity_)

* create dummies for Asthma (note: no factor variable in BO in Stata) 
tab Asthma, gen(Asthma_)

* create dummies for Diabetes (note: no factor variable in BO in Stata) 
tab Diabetes, gen(Diabetes_)

* create dummies for Epilepsy (note: no factor variable in BO in Stata) 
tab Epilepsy, gen(Epilepsy_)

* create dummies for Epilepsy (note: no factor variable in BO in Stata) 
tab Hypotiroidism, gen(Hypotiroidism_)

* create dummies for Depression (note: no factor variable in BO in Stata) 
tab Depression, gen(Depression_)

* create dummies for Blood (note: no factor variable in BO in Stata) 
tab Blood, gen(Blood_)

* create dummies for NEET sub-categories (note: no factor variable in BO in Stata) 
tab NEET_sub, gen(category_)

*Generate GHQ-12 caseness with a cut point at 3 
* Create binary caseness variable using standard cutoff (3+)
gen caseness = (scghq2_dv >= 3) if !missing(scghq2_dv)
* Label it clearly
label variable caseness "GHQ-12 Caseness (score >= 4)"
label define caseness_lb 0 "No caseness" 1 "Caseness"
label values caseness caseness_lb
* Check the result
tabulate scghq2_dv caseness

*multimorbidity without asthma 
rename multimorbidity_withoutasthma multimorb_wo_asthma
gen multinoasthma = (multimorb_wo_asthma >= 2)

*Generate caseness with a cut point at 4 
gen caseness_conservative = .
replace caseness_conservative = 0 if scghq2_dv >= 0 & scghq2_dv <= 3
replace caseness_conservative = 1 if scghq2_dv >= 4 & scghq2_dv <= 12
* Check the result
tab caseness_conservative



* note: we need to generate different groups because we moved from high to low to high NEET – so cutting the 2009-2023 period in 2 might be a problem). 
* Generate year_bi2 (2013-2018 = 0, 2019-2023 = 1)
gen year_201923 = .
replace year_201923 = 0 if inrange(year, 2014, 2018)
replace year_201923 = 1 if inrange(year, 2019, 2023)
*here we compare 2019-2023 to 2014-2018

* Generate year_bi3 (2014-2018 = 0, 2009-2013 = 1)
gen year_200913 = .
replace year_200913 = 0 if inrange(year, 2014, 2018)
replace year_200913 = 1 if inrange(year, 2009, 2013)
*here we compare 2009-2013 to 2014-2018


 
* MAIN UNIVARIATE ANALYSES *

* loop for  2019-23 compared to 2014-18 *

tempname results
postfile `results' str20 variable total_gap total_gap_se total_gap_lb total_gap_ub explained_total explained_total_se explained_total_lb explained_total_ub unexplained_total unexplained_total_se unexplained_total_lb unexplained_total_ub var_explained var_explained_se var_explained_lb var_explained_ub var_unexplained var_unexplained_se var_unexplained_lb var_unexplained_ub constant constant_se constant_lb constant_ub using results_temp.dta, replace

foreach var in health_binary caseness_conservative multiorbidity_2 Asthma_2 Depression_2 Diabetes_2 Epilepsy_2 Blood_2 agegroup_2 sex_2 ethn_1 educbi_1 region_1 child_2 eqinc_1 IMD_1{
    di "Running: `var'"
    oaxaca NEET `var' [pw=weight_combined], by(year_201923) swap weight(1) probit detail
    
    matrix gap = r(table)
    
    * Overall components (columns 3,4,5)
    local total = gap[1,3]
    local total_se = gap[2,3]
    local total_lb = gap[5,3]
    local total_ub = gap[6,3]
    
    local explained_total = gap[1,4]
    local explained_total_se = gap[2,4]
    local explained_total_lb = gap[5,4]
    local explained_total_ub = gap[6,4]
    
    local unexplained_total = gap[1,5]
    local unexplained_total_se = gap[2,5]
    local unexplained_total_lb = gap[5,5]
    local unexplained_total_ub = gap[6,5]
    
    * Variable-specific components (column 6 for explained, column 7 for unexplained)
    local var_exp = gap[1,6]
    local var_exp_se = gap[2,6]
    local var_exp_lb = gap[5,6]
    local var_exp_ub = gap[6,6]
    
    local var_unexp = gap[1,7]
    local var_unexp_se = gap[2,7]
    local var_unexp_lb = gap[5,7]
    local var_unexp_ub = gap[6,7]
    
    * Constant (column 8)
    local constant = gap[1,8]
    local constant_se = gap[2,8]
    local constant_lb = gap[5,8]
    local constant_ub = gap[6,8]
    
    post `results' ("`var'") (`total') (`total_se') (`total_lb') (`total_ub') (`explained_total') (`explained_total_se') (`explained_total_lb') (`explained_total_ub') (`unexplained_total') (`unexplained_total_se') (`unexplained_total_lb') (`unexplained_total_ub') (`var_exp') (`var_exp_se') (`var_exp_lb') (`var_exp_ub') (`var_unexp') (`var_unexp_se') (`var_unexp_lb') (`var_unexp_ub') (`constant') (`constant_se') (`constant_lb') (`constant_ub')
}

postclose `results'

preserve
use results_temp.dta, clear
export excel using "oaxaca_201923.xlsx", firstrow(variables) replace

restore


* loop for  2009-13 compared to 2014-18###

tempname results
postfile `results' str20 variable total_gap total_gap_se total_gap_lb total_gap_ub explained_total explained_total_se explained_total_lb explained_total_ub unexplained_total unexplained_total_se unexplained_total_lb unexplained_total_ub var_explained var_explained_se var_explained_lb var_explained_ub var_unexplained var_unexplained_se var_unexplained_lb var_unexplained_ub constant constant_se constant_lb constant_ub using results_temp.dta, replace

foreach var in health_binary caseness_conservative multiorbidity_2 Asthma_2 Depression_2 Diabetes_2 Epilepsy_2 Blood_2 agegroup_2 sex_2 ethn_1 educbi_1 region_1 child_2 eqinc_1 IMD_1{
    di "Running: `var'"
    oaxaca NEET `var' [pw=weight_combined], by(year_200913) swap weight(1) probit detail
    
    matrix gap = r(table)
    
    * Overall components (columns 3,4,5)
    local total = gap[1,3]
    local total_se = gap[2,3]
    local total_lb = gap[5,3]
    local total_ub = gap[6,3]
    
    local explained_total = gap[1,4]
    local explained_total_se = gap[2,4]
    local explained_total_lb = gap[5,4]
    local explained_total_ub = gap[6,4]
    
    local unexplained_total = gap[1,5]
    local unexplained_total_se = gap[2,5]
    local unexplained_total_lb = gap[5,5]
    local unexplained_total_ub = gap[6,5]
    
    * Variable-specific components (column 6 for explained, column 7 for unexplained)
    local var_exp = gap[1,6]
    local var_exp_se = gap[2,6]
    local var_exp_lb = gap[5,6]
    local var_exp_ub = gap[6,6]
    
    local var_unexp = gap[1,7]
    local var_unexp_se = gap[2,7]
    local var_unexp_lb = gap[5,7]
    local var_unexp_ub = gap[6,7]
    
    * Constant (column 8)
    local constant = gap[1,8]
    local constant_se = gap[2,8]
    local constant_lb = gap[5,8]
    local constant_ub = gap[6,8]
    
    post `results' ("`var'") (`total') (`total_se') (`total_lb') (`total_ub') (`explained_total') (`explained_total_se') (`explained_total_lb') (`explained_total_ub') (`unexplained_total') (`unexplained_total_se') (`unexplained_total_lb') (`unexplained_total_ub') (`var_exp') (`var_exp_se') (`var_exp_lb') (`var_exp_ub') (`var_unexp') (`var_unexp_se') (`var_unexp_lb') (`var_unexp_ub') (`constant') (`constant_se') (`constant_lb') (`constant_ub')
}

postclose `results'

preserve
use results_temp.dta, clear
export excel using "oaxaca_200913.xlsx", firstrow(variables) replace

 
*** COMPARING all years to the mid-year (2016baseline) ***
*** YEAR-BY-YEAR BLINDER-OAXACA DECOMPOSITIONS - COMPARING EACH YEAR TO 2016 ***

restore 

***this command only for stratification ***
****** keep if region_1== 0


*** COMPARING EACH YEAR TO 2016 - SEPARATE MODELS ***

* Create results file
tempname yearly_results
postfile `yearly_results' str20 variable year gap gap_se gap_lb gap_ub explained_total explained_total_se explained_total_lb explained_total_ub unexplained_total unexplained_total_se unexplained_total_lb unexplained_total_ub var_explained var_explained_se var_explained_lb var_explained_ub var_unexplained var_unexplained_se var_unexplained_lb var_unexplained_ub constant constant_se constant_lb constant_ub using yearly_results_2016.dta, replace

* Define variables
local vars health_binary caseness_conservative multiorbidity_2 Asthma_2 Depression_2 Diabetes_2 Epilepsy_2 Blood_2 agegroup_2 sex_2 ethn_1 educbi_1 region_1 child_2 eqinc_1 IMD_1

* 2009 vs 2016
di "Running 2009 vs 2016"
tempvar comp09
gen `comp09' = .
replace `comp09' = 0 if year == 2016
replace `comp09' = 1 if year == 2009
foreach var in `vars' {
    di "  Running: `var'"
    oaxaca NEET `var' [pw=weight_combined], by(`comp09') swap weight(1) probit detail
    matrix gap = r(table)
    local total = gap[1,3]
    local total_se = gap[2,3]
    local total_lb = gap[5,3]
    local total_ub = gap[6,3]
    local explained_total = gap[1,4]
    local explained_total_se = gap[2,4]
    local explained_total_lb = gap[5,4]
    local explained_total_ub = gap[6,4]
    local unexplained_total = gap[1,5]
    local unexplained_total_se = gap[2,5]
    local unexplained_total_lb = gap[5,5]
    local unexplained_total_ub = gap[6,5]
    local var_exp = gap[1,6]
    local var_exp_se = gap[2,6]
    local var_exp_lb = gap[5,6]
    local var_exp_ub = gap[6,6]
    local var_unexp = gap[1,7]
    local var_unexp_se = gap[2,7]
    local var_unexp_lb = gap[5,7]
    local var_unexp_ub = gap[6,7]
    local constant = gap[1,8]
    local constant_se = gap[2,8]
    local constant_lb = gap[5,8]
    local constant_ub = gap[6,8]
    post `yearly_results' ("`var'") (2009) (`total') (`total_se') (`total_lb') (`total_ub') (`explained_total') (`explained_total_se') (`explained_total_lb') (`explained_total_ub') (`unexplained_total') (`unexplained_total_se') (`unexplained_total_lb') (`unexplained_total_ub') (`var_exp') (`var_exp_se') (`var_exp_lb') (`var_exp_ub') (`var_unexp') (`var_unexp_se') (`var_unexp_lb') (`var_unexp_ub') (`constant') (`constant_se') (`constant_lb') (`constant_ub')
}
drop `comp09'

* 2010 vs 2016
di "Running 2010 vs 2016"
tempvar comp10
gen `comp10' = .
replace `comp10' = 0 if year == 2016
replace `comp10' = 1 if year == 2010
foreach var in `vars' {
    di "  Running: `var'"
    oaxaca NEET `var' [pw=weight_combined], by(`comp10') swap weight(1) detail
    matrix gap = r(table)
    local total = gap[1,3]
    local total_se = gap[2,3]
    local total_lb = gap[5,3]
    local total_ub = gap[6,3]
    local explained_total = gap[1,4]
    local explained_total_se = gap[2,4]
    local explained_total_lb = gap[5,4]
    local explained_total_ub = gap[6,4]
    local unexplained_total = gap[1,5]
    local unexplained_total_se = gap[2,5]
    local unexplained_total_lb = gap[5,5]
    local unexplained_total_ub = gap[6,5]
    local var_exp = gap[1,6]
    local var_exp_se = gap[2,6]
    local var_exp_lb = gap[5,6]
    local var_exp_ub = gap[6,6]
    local var_unexp = gap[1,7]
    local var_unexp_se = gap[2,7]
    local var_unexp_lb = gap[5,7]
    local var_unexp_ub = gap[6,7]
    local constant = gap[1,8]
    local constant_se = gap[2,8]
    local constant_lb = gap[5,8]
    local constant_ub = gap[6,8]
    post `yearly_results' ("`var'") (2010) (`total') (`total_se') (`total_lb') (`total_ub') (`explained_total') (`explained_total_se') (`explained_total_lb') (`explained_total_ub') (`unexplained_total') (`unexplained_total_se') (`unexplained_total_lb') (`unexplained_total_ub') (`var_exp') (`var_exp_se') (`var_exp_lb') (`var_exp_ub') (`var_unexp') (`var_unexp_se') (`var_unexp_lb') (`var_unexp_ub') (`constant') (`constant_se') (`constant_lb') (`constant_ub')
}
drop `comp10'

* 2011 vs 2016
di "Running 2011 vs 2016"
tempvar comp11
gen `comp11' = .
replace `comp11' = 0 if year == 2016
replace `comp11' = 1 if year == 2011
foreach var in `vars' {
    di "  Running: `var'"
    oaxaca NEET `var' [pw=weight_combined], by(`comp11') swap weight(1) detail
    matrix gap = r(table)
    local total = gap[1,3]
    local total_se = gap[2,3]
    local total_lb = gap[5,3]
    local total_ub = gap[6,3]
    local explained_total = gap[1,4]
    local explained_total_se = gap[2,4]
    local explained_total_lb = gap[5,4]
    local explained_total_ub = gap[6,4]
    local unexplained_total = gap[1,5]
    local unexplained_total_se = gap[2,5]
    local unexplained_total_lb = gap[5,5]
    local unexplained_total_ub = gap[6,5]
    local var_exp = gap[1,6]
    local var_exp_se = gap[2,6]
    local var_exp_lb = gap[5,6]
    local var_exp_ub = gap[6,6]
    local var_unexp = gap[1,7]
    local var_unexp_se = gap[2,7]
    local var_unexp_lb = gap[5,7]
    local var_unexp_ub = gap[6,7]
    local constant = gap[1,8]
    local constant_se = gap[2,8]
    local constant_lb = gap[5,8]
    local constant_ub = gap[6,8]
    post `yearly_results' ("`var'") (2011) (`total') (`total_se') (`total_lb') (`total_ub') (`explained_total') (`explained_total_se') (`explained_total_lb') (`explained_total_ub') (`unexplained_total') (`unexplained_total_se') (`unexplained_total_lb') (`unexplained_total_ub') (`var_exp') (`var_exp_se') (`var_exp_lb') (`var_exp_ub') (`var_unexp') (`var_unexp_se') (`var_unexp_lb') (`var_unexp_ub') (`constant') (`constant_se') (`constant_lb') (`constant_ub')
}
drop `comp11'

* 2012 vs 2016
di "Running 2012 vs 2016"
tempvar comp12
gen `comp12' = .
replace `comp12' = 0 if year == 2016
replace `comp12' = 1 if year == 2012
foreach var in `vars' {
    di "  Running: `var'"
    oaxaca NEET `var' [pw=weight_combined], by(`comp12') swap weight(1) detail
    matrix gap = r(table)
    local total = gap[1,3]
    local total_se = gap[2,3]
    local total_lb = gap[5,3]
    local total_ub = gap[6,3]
    local explained_total = gap[1,4]
    local explained_total_se = gap[2,4]
    local explained_total_lb = gap[5,4]
    local explained_total_ub = gap[6,4]
    local unexplained_total = gap[1,5]
    local unexplained_total_se = gap[2,5]
    local unexplained_total_lb = gap[5,5]
    local unexplained_total_ub = gap[6,5]
    local var_exp = gap[1,6]
    local var_exp_se = gap[2,6]
    local var_exp_lb = gap[5,6]
    local var_exp_ub = gap[6,6]
    local var_unexp = gap[1,7]
    local var_unexp_se = gap[2,7]
    local var_unexp_lb = gap[5,7]
    local var_unexp_ub = gap[6,7]
    local constant = gap[1,8]
    local constant_se = gap[2,8]
    local constant_lb = gap[5,8]
    local constant_ub = gap[6,8]
    post `yearly_results' ("`var'") (2012) (`total') (`total_se') (`total_lb') (`total_ub') (`explained_total') (`explained_total_se') (`explained_total_lb') (`explained_total_ub') (`unexplained_total') (`unexplained_total_se') (`unexplained_total_lb') (`unexplained_total_ub') (`var_exp') (`var_exp_se') (`var_exp_lb') (`var_exp_ub') (`var_unexp') (`var_unexp_se') (`var_unexp_lb') (`var_unexp_ub') (`constant') (`constant_se') (`constant_lb') (`constant_ub')
}
drop `comp12'

* 2013 vs 2016
di "Running 2013 vs 2016"
tempvar comp13
gen `comp13' = .
replace `comp13' = 0 if year == 2016
replace `comp13' = 1 if year == 2013
foreach var in `vars' {
    di "  Running: `var'"
    oaxaca NEET `var' [pw=weight_combined], by(`comp13') swap weight(1) detail
    matrix gap = r(table)
    local total = gap[1,3]
    local total_se = gap[2,3]
    local total_lb = gap[5,3]
    local total_ub = gap[6,3]
    local explained_total = gap[1,4]
    local explained_total_se = gap[2,4]
    local explained_total_lb = gap[5,4]
    local explained_total_ub = gap[6,4]
    local unexplained_total = gap[1,5]
    local unexplained_total_se = gap[2,5]
    local unexplained_total_lb = gap[5,5]
    local unexplained_total_ub = gap[6,5]
    local var_exp = gap[1,6]
    local var_exp_se = gap[2,6]
    local var_exp_lb = gap[5,6]
    local var_exp_ub = gap[6,6]
    local var_unexp = gap[1,7]
    local var_unexp_se = gap[2,7]
    local var_unexp_lb = gap[5,7]
    local var_unexp_ub = gap[6,7]
    local constant = gap[1,8]
    local constant_se = gap[2,8]
    local constant_lb = gap[5,8]
    local constant_ub = gap[6,8]
    post `yearly_results' ("`var'") (2013) (`total') (`total_se') (`total_lb') (`total_ub') (`explained_total') (`explained_total_se') (`explained_total_lb') (`explained_total_ub') (`unexplained_total') (`unexplained_total_se') (`unexplained_total_lb') (`unexplained_total_ub') (`var_exp') (`var_exp_se') (`var_exp_lb') (`var_exp_ub') (`var_unexp') (`var_unexp_se') (`var_unexp_lb') (`var_unexp_ub') (`constant') (`constant_se') (`constant_lb') (`constant_ub')
}
drop `comp13'

* 2014 vs 2016
di "Running 2014 vs 2016"
tempvar comp14
gen `comp14' = .
replace `comp14' = 0 if year == 2016
replace `comp14' = 1 if year == 2014
foreach var in `vars' {
    di "  Running: `var'"
    oaxaca NEET `var' [pw=weight_combined], by(`comp14') swap weight(1) detail
    matrix gap = r(table)
    local total = gap[1,3]
    local total_se = gap[2,3]
    local total_lb = gap[5,3]
    local total_ub = gap[6,3]
    local explained_total = gap[1,4]
    local explained_total_se = gap[2,4]
    local explained_total_lb = gap[5,4]
    local explained_total_ub = gap[6,4]
    local unexplained_total = gap[1,5]
    local unexplained_total_se = gap[2,5]
    local unexplained_total_lb = gap[5,5]
    local unexplained_total_ub = gap[6,5]
    local var_exp = gap[1,6]
    local var_exp_se = gap[2,6]
    local var_exp_lb = gap[5,6]
    local var_exp_ub = gap[6,6]
    local var_unexp = gap[1,7]
    local var_unexp_se = gap[2,7]
    local var_unexp_lb = gap[5,7]
    local var_unexp_ub = gap[6,7]
    local constant = gap[1,8]
    local constant_se = gap[2,8]
    local constant_lb = gap[5,8]
    local constant_ub = gap[6,8]
    post `yearly_results' ("`var'") (2014) (`total') (`total_se') (`total_lb') (`total_ub') (`explained_total') (`explained_total_se') (`explained_total_lb') (`explained_total_ub') (`unexplained_total') (`unexplained_total_se') (`unexplained_total_lb') (`unexplained_total_ub') (`var_exp') (`var_exp_se') (`var_exp_lb') (`var_exp_ub') (`var_unexp') (`var_unexp_se') (`var_unexp_lb') (`var_unexp_ub') (`constant') (`constant_se') (`constant_lb') (`constant_ub')
}
drop `comp14'

* 2015 vs 2016
di "Running 2015 vs 2016"
tempvar comp15
gen `comp15' = .
replace `comp15' = 0 if year == 2016
replace `comp15' = 1 if year == 2015
foreach var in `vars' {
    di "  Running: `var'"
    oaxaca NEET `var' [pw=weight_combined], by(`comp15') swap weight(1) detail
    matrix gap = r(table)
    local total = gap[1,3]
    local total_se = gap[2,3]
    local total_lb = gap[5,3]
    local total_ub = gap[6,3]
    local explained_total = gap[1,4]
    local explained_total_se = gap[2,4]
    local explained_total_lb = gap[5,4]
    local explained_total_ub = gap[6,4]
    local unexplained_total = gap[1,5]
    local unexplained_total_se = gap[2,5]
    local unexplained_total_lb = gap[5,5]
    local unexplained_total_ub = gap[6,5]
    local var_exp = gap[1,6]
    local var_exp_se = gap[2,6]
    local var_exp_lb = gap[5,6]
    local var_exp_ub = gap[6,6]
    local var_unexp = gap[1,7]
    local var_unexp_se = gap[2,7]
    local var_unexp_lb = gap[5,7]
    local var_unexp_ub = gap[6,7]
    local constant = gap[1,8]
    local constant_se = gap[2,8]
    local constant_lb = gap[5,8]
    local constant_ub = gap[6,8]
    post `yearly_results' ("`var'") (2015) (`total') (`total_se') (`total_lb') (`total_ub') (`explained_total') (`explained_total_se') (`explained_total_lb') (`explained_total_ub') (`unexplained_total') (`unexplained_total_se') (`unexplained_total_lb') (`unexplained_total_ub') (`var_exp') (`var_exp_se') (`var_exp_lb') (`var_exp_ub') (`var_unexp') (`var_unexp_se') (`var_unexp_lb') (`var_unexp_ub') (`constant') (`constant_se') (`constant_lb') (`constant_ub')
}
drop `comp15'

* 2017 vs 2016
di "Running 2017 vs 2016"
tempvar comp17
gen `comp17' = .
replace `comp17' = 0 if year == 2016
replace `comp17' = 1 if year == 2017
foreach var in `vars' {
    di "  Running: `var'"
    oaxaca NEET `var' [pw=weight_combined], by(`comp17') swap weight(1) detail
    matrix gap = r(table)
    local total = gap[1,3]
    local total_se = gap[2,3]
    local total_lb = gap[5,3]
    local total_ub = gap[6,3]
    local explained_total = gap[1,4]
    local explained_total_se = gap[2,4]
    local explained_total_lb = gap[5,4]
    local explained_total_ub = gap[6,4]
    local unexplained_total = gap[1,5]
    local unexplained_total_se = gap[2,5]
    local unexplained_total_lb = gap[5,5]
    local unexplained_total_ub = gap[6,5]
    local var_exp = gap[1,6]
    local var_exp_se = gap[2,6]
    local var_exp_lb = gap[5,6]
    local var_exp_ub = gap[6,6]
    local var_unexp = gap[1,7]
    local var_unexp_se = gap[2,7]
    local var_unexp_lb = gap[5,7]
    local var_unexp_ub = gap[6,7]
    local constant = gap[1,8]
    local constant_se = gap[2,8]
    local constant_lb = gap[5,8]
    local constant_ub = gap[6,8]
    post `yearly_results' ("`var'") (2017) (`total') (`total_se') (`total_lb') (`total_ub') (`explained_total') (`explained_total_se') (`explained_total_lb') (`explained_total_ub') (`unexplained_total') (`unexplained_total_se') (`unexplained_total_lb') (`unexplained_total_ub') (`var_exp') (`var_exp_se') (`var_exp_lb') (`var_exp_ub') (`var_unexp') (`var_unexp_se') (`var_unexp_lb') (`var_unexp_ub') (`constant') (`constant_se') (`constant_lb') (`constant_ub')
}
drop `comp17'

* 2018 vs 2016
di "Running 2018 vs 2016"
tempvar comp18
gen `comp18' = .
replace `comp18' = 0 if year == 2016
replace `comp18' = 1 if year == 2018
foreach var in `vars' {
    di "  Running: `var'"
    oaxaca NEET `var' [pw=weight_combined], by(`comp18') swap weight(1) detail
    matrix gap = r(table)
    local total = gap[1,3]
    local total_se = gap[2,3]
    local total_lb = gap[5,3]
    local total_ub = gap[6,3]
    local explained_total = gap[1,4]
    local explained_total_se = gap[2,4]
    local explained_total_lb = gap[5,4]
    local explained_total_ub = gap[6,4]
    local unexplained_total = gap[1,5]
    local unexplained_total_se = gap[2,5]
    local unexplained_total_lb = gap[5,5]
    local unexplained_total_ub = gap[6,5]
    local var_exp = gap[1,6]
    local var_exp_se = gap[2,6]
    local var_exp_lb = gap[5,6]
    local var_exp_ub = gap[6,6]
    local var_unexp = gap[1,7]
    local var_unexp_se = gap[2,7]
    local var_unexp_lb = gap[5,7]
    local var_unexp_ub = gap[6,7]
    local constant = gap[1,8]
    local constant_se = gap[2,8]
    local constant_lb = gap[5,8]
    local constant_ub = gap[6,8]
    post `yearly_results' ("`var'") (2018) (`total') (`total_se') (`total_lb') (`total_ub') (`explained_total') (`explained_total_se') (`explained_total_lb') (`explained_total_ub') (`unexplained_total') (`unexplained_total_se') (`unexplained_total_lb') (`unexplained_total_ub') (`var_exp') (`var_exp_se') (`var_exp_lb') (`var_exp_ub') (`var_unexp') (`var_unexp_se') (`var_unexp_lb') (`var_unexp_ub') (`constant') (`constant_se') (`constant_lb') (`constant_ub')
}
drop `comp18'

* 2019 vs 2016
di "Running 2019 vs 2016"
tempvar comp19
gen `comp19' = .
replace `comp19' = 0 if year == 2016
replace `comp19' = 1 if year == 2019
foreach var in `vars' {
    di "  Running: `var'"
    oaxaca NEET `var' [pw=weight_combined], by(`comp19') swap weight(1) detail
    matrix gap = r(table)
    local total = gap[1,3]
    local total_se = gap[2,3]
    local total_lb = gap[5,3]
    local total_ub = gap[6,3]
    local explained_total = gap[1,4]
    local explained_total_se = gap[2,4]
    local explained_total_lb = gap[5,4]
    local explained_total_ub = gap[6,4]
    local unexplained_total = gap[1,5]
    local unexplained_total_se = gap[2,5]
    local unexplained_total_lb = gap[5,5]
    local unexplained_total_ub = gap[6,5]
    local var_exp = gap[1,6]
    local var_exp_se = gap[2,6]
    local var_exp_lb = gap[5,6]
    local var_exp_ub = gap[6,6]
    local var_unexp = gap[1,7]
    local var_unexp_se = gap[2,7]
    local var_unexp_lb = gap[5,7]
    local var_unexp_ub = gap[6,7]
    local constant = gap[1,8]
    local constant_se = gap[2,8]
    local constant_lb = gap[5,8]
    local constant_ub = gap[6,8]
    post `yearly_results' ("`var'") (2019) (`total') (`total_se') (`total_lb') (`total_ub') (`explained_total') (`explained_total_se') (`explained_total_lb') (`explained_total_ub') (`unexplained_total') (`unexplained_total_se') (`unexplained_total_lb') (`unexplained_total_ub') (`var_exp') (`var_exp_se') (`var_exp_lb') (`var_exp_ub') (`var_unexp') (`var_unexp_se') (`var_unexp_lb') (`var_unexp_ub') (`constant') (`constant_se') (`constant_lb') (`constant_ub')
}
drop `comp19'

* 2020 vs 2016
di "Running 2020 vs 2016"
tempvar comp20
gen `comp20' = .
replace `comp20' = 0 if year == 2016
replace `comp20' = 1 if year == 2020
foreach var in `vars' {
    di "  Running: `var'"
    oaxaca NEET `var' [pw=weight_combined], by(`comp20') swap weight(1) detail
    matrix gap = r(table)
    local total = gap[1,3]
    local total_se = gap[2,3]
    local total_lb = gap[5,3]
    local total_ub = gap[6,3]
    local explained_total = gap[1,4]
    local explained_total_se = gap[2,4]
    local explained_total_lb = gap[5,4]
    local explained_total_ub = gap[6,4]
    local unexplained_total = gap[1,5]
    local unexplained_total_se = gap[2,5]
    local unexplained_total_lb = gap[5,5]
    local unexplained_total_ub = gap[6,5]
    local var_exp = gap[1,6]
    local var_exp_se = gap[2,6]
    local var_exp_lb = gap[5,6]
    local var_exp_ub = gap[6,6]
    local var_unexp = gap[1,7]
    local var_unexp_se = gap[2,7]
    local var_unexp_lb = gap[5,7]
    local var_unexp_ub = gap[6,7]
    local constant = gap[1,8]
    local constant_se = gap[2,8]
    local constant_lb = gap[5,8]
    local constant_ub = gap[6,8]
    post `yearly_results' ("`var'") (2020) (`total') (`total_se') (`total_lb') (`total_ub') (`explained_total') (`explained_total_se') (`explained_total_lb') (`explained_total_ub') (`unexplained_total') (`unexplained_total_se') (`unexplained_total_lb') (`unexplained_total_ub') (`var_exp') (`var_exp_se') (`var_exp_lb') (`var_exp_ub') (`var_unexp') (`var_unexp_se') (`var_unexp_lb') (`var_unexp_ub') (`constant') (`constant_se') (`constant_lb') (`constant_ub')
}
drop `comp20'

* 2021 vs 2016
di "Running 2021 vs 2016"
tempvar comp21
gen `comp21' = .
replace `comp21' = 0 if year == 2016
replace `comp21' = 1 if year == 2021
foreach var in `vars' {
    di "  Running: `var'"
    oaxaca NEET `var' [pw=weight_combined], by(`comp21') swap weight(1) detail
    matrix gap = r(table)
    local total = gap[1,3]
    local total_se = gap[2,3]
    local total_lb = gap[5,3]
    local total_ub = gap[6,3]
    local explained_total = gap[1,4]
    local explained_total_se = gap[2,4]
    local explained_total_lb = gap[5,4]
    local explained_total_ub = gap[6,4]
    local unexplained_total = gap[1,5]
    local unexplained_total_se = gap[2,5]
    local unexplained_total_lb = gap[5,5]
    local unexplained_total_ub = gap[6,5]
    local var_exp = gap[1,6]
    local var_exp_se = gap[2,6]
    local var_exp_lb = gap[5,6]
    local var_exp_ub = gap[6,6]
    local var_unexp = gap[1,7]
    local var_unexp_se = gap[2,7]
    local var_unexp_lb = gap[5,7]
    local var_unexp_ub = gap[6,7]
    local constant = gap[1,8]
    local constant_se = gap[2,8]
    local constant_lb = gap[5,8]
    local constant_ub = gap[6,8]
    post `yearly_results' ("`var'") (2021) (`total') (`total_se') (`total_lb') (`total_ub') (`explained_total') (`explained_total_se') (`explained_total_lb') (`explained_total_ub') (`unexplained_total') (`unexplained_total_se') (`unexplained_total_lb') (`unexplained_total_ub') (`var_exp') (`var_exp_se') (`var_exp_lb') (`var_exp_ub') (`var_unexp') (`var_unexp_se') (`var_unexp_lb') (`var_unexp_ub') (`constant') (`constant_se') (`constant_lb') (`constant_ub')
}
drop `comp21'

* 2022 vs 2016
di "Running 2022 vs 2016"
tempvar comp22
gen `comp22' = .
replace `comp22' = 0 if year == 2016
replace `comp22' = 1 if year == 2022
foreach var in `vars' {
    di "  Running: `var'"
    oaxaca NEET `var' [pw=weight_combined], by(`comp22') swap weight(1) detail
    matrix gap = r(table)
    local total = gap[1,3]
    local total_se = gap[2,3]
    local total_lb = gap[5,3]
    local total_ub = gap[6,3]
    local explained_total = gap[1,4]
    local explained_total_se = gap[2,4]
    local explained_total_lb = gap[5,4]
    local explained_total_ub = gap[6,4]
    local unexplained_total = gap[1,5]
    local unexplained_total_se = gap[2,5]
    local unexplained_total_lb = gap[5,5]
    local unexplained_total_ub = gap[6,5]
    local var_exp = gap[1,6]
    local var_exp_se = gap[2,6]
    local var_exp_lb = gap[5,6]
    local var_exp_ub = gap[6,6]
    local var_unexp = gap[1,7]
    local var_unexp_se = gap[2,7]
    local var_unexp_lb = gap[5,7]
    local var_unexp_ub = gap[6,7]
    local constant = gap[1,8]
    local constant_se = gap[2,8]
    local constant_lb = gap[5,8]
    local constant_ub = gap[6,8]
    post `yearly_results' ("`var'") (2022) (`total') (`total_se') (`total_lb') (`total_ub') (`explained_total') (`explained_total_se') (`explained_total_lb') (`explained_total_ub') (`unexplained_total') (`unexplained_total_se') (`unexplained_total_lb') (`unexplained_total_ub') (`var_exp') (`var_exp_se') (`var_exp_lb') (`var_exp_ub') (`var_unexp') (`var_unexp_se') (`var_unexp_lb') (`var_unexp_ub') (`constant') (`constant_se') (`constant_lb') (`constant_ub')
}
drop `comp22'

* 2023 vs 2016
di "Running 2023 vs 2016"
tempvar comp23
gen `comp23' = .
replace `comp23' = 0 if year == 2016
replace `comp23' = 1 if year == 2023
foreach var in `vars' {
    di "  Running: `var'"
    oaxaca NEET `var' [pw=weight_combined], by(`comp23') swap weight(1) detail
    matrix gap = r(table)
    local total = gap[1,3]
    local total_se = gap[2,3]
    local total_lb = gap[5,3]
    local total_ub = gap[6,3]
    local explained_total = gap[1,4]
    local explained_total_se = gap[2,4]
    local explained_total_lb = gap[5,4]
    local explained_total_ub = gap[6,4]
    local unexplained_total = gap[1,5]
    local unexplained_total_se = gap[2,5]
    local unexplained_total_lb = gap[5,5]
    local unexplained_total_ub = gap[6,5]
    local var_exp = gap[1,6]
    local var_exp_se = gap[2,6]
    local var_exp_lb = gap[5,6]
    local var_exp_ub = gap[6,6]
    local var_unexp = gap[1,7]
    local var_unexp_se = gap[2,7]
    local var_unexp_lb = gap[5,7]
    local var_unexp_ub = gap[6,7]
    local constant = gap[1,8]
    local constant_se = gap[2,8]
    local constant_lb = gap[5,8]
    local constant_ub = gap[6,8]
    post `yearly_results' ("`var'") (2023) (`total') (`total_se') (`total_lb') (`total_ub') (`explained_total') (`explained_total_se') (`explained_total_lb') (`explained_total_ub') (`unexplained_total') (`unexplained_total_se') (`unexplained_total_lb') (`unexplained_total_ub') (`var_exp') (`var_exp_se') (`var_exp_lb') (`var_exp_ub') (`var_unexp') (`var_unexp_se') (`var_unexp_lb') (`var_unexp_ub') (`constant') (`constant_se') (`constant_lb') (`constant_ub')
}
drop `comp23'

postclose `yearly_results'

 
*** Rename variables  ***

clear
use yearly_results_2016.dta

gen varlabel = ""
replace varlabel = "Has condition vs. No condition" if variable == "health_binary"
replace varlabel = "Psychological distress vs. No distress" if variable == "caseness_conservativ"
replace varlabel = "Depression vs. No depression" if variable == "Depression_2"
replace varlabel = "Asthma vs. No Asthma" if variable == "Asthma_2"
replace varlabel = ">= 2 conditions vs. < 2 conditions" if variable == "multiorbidity_2"
replace varlabel = "Diabetes vs. No diabetes" if variable == "Diabetes_2"
replace varlabel = "Epilepsy vs. No epilepsy" if variable == "Epilepsy_2"
replace varlabel = "High blood pressure vs. normal" if variable == "Blood_2"

replace varlabel = "16-17 vs. 18-24" if variable == "agegroup_2"
replace varlabel = "Female vs. Male" if variable == "sex_2"
replace varlabel = "Non white vs. White" if variable == "ethn_1"
replace varlabel = "GCSE maximum vs. Above GCSE" if variable == "educbi_1"
replace varlabel = "London & South vs. Other" if variable == "region_1"
replace varlabel = "Child-ren responsibility vs. none" if variable == "child_2"
replace varlabel = "Lowest quintile vs. Other quintiles" if variable == "eqinc_1"
replace varlabel = "Most deprived vs. Less deprived" if variable == "IMD_1"

save yearly_results_2016baseline.dta, replace
