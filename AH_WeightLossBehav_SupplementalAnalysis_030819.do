/* 
This file loops over the analyses for the project investigating the associations 
b/w weight loss behaviors and a PGS for BMI co-authored with Jason Nagata and Ben Domingue 
by a series of PGSs based on different p-value thresholds and LD clumping specifications

Last modified on: 3/8/2019
Last modified by: David Braudt 

Notes: 
	1) The LD clumping methods are: 
		- No LD clumping 
		- LD clumping based on R-square of 0.1 and a SNP window of 500 kb 
		- LD clumping based on R-square of 0.5 and a SNP window of 500 kb 
	2) The p-value thresholds are:
		- p < 0.001 
		- p < 0.01 
		- p < 0.1 
		- p < 1 

*/
clear all 

*** Directory paths 
local Clean_data = "/ifs/sec/cpc/addhealth/users/dbraudt/Keep/WeightLossBehaviors/Data/AH_WeightLossBehav_Clean.dta"
local Results = "/ifs/sec/cpc/addhealth/users/dbraudt/Keep/WeightLossBehaviors/Results/R3_SupplementalAnalyses"

*** List of PGS variable names for loops 
local PGS_list = "pgsbmi_noclump_std_0001 pgsbmi_noclump_std_001 pgsbmi_noclump_std_01 pgsbmi_noclump_std_1 pgsbmi_GC_01_500_std_0001 pgsbmi_GC_01_500_std_001 pgsbmi_GC_01_500_std_01 pgsbmi_GC_01_500_std_1 pgsbmi_GC_05_500_std_0001 pgsbmi_GC_05_500_std_001 pgsbmi_GC_05_500_std_01 pgsbmi_GC_05_500_std_1"

use `Clean_data'



***********************

*     Supp Table 2     *

***********************
foreach pgsbmi of local PGS_list {
	local name1 = subinstr("`pgsbmi'", "pgsbmi_","",.)

	log using "`Results'/AH_WeightLossBehav_sTable2_`name1'.txt", replace text
	
	logistic WeightlossgoalW3 `pgsbmi' PC1 PC2 PC3 PC4 PC5 PC6 PC7 PC8 PC9 PC10 if (ancestry==0 & male==1 & gsib==0) 
	logistic wtlossbehav3 `pgsbmi' PC1 PC2 PC3 PC4 PC5 PC6 PC7 PC8 PC9 PC10 if (ancestry==0 & male==1 & gsib==0) 
	
	logistic WeightlossgoalW3 `pgsbmi' PC1 PC2 PC3 PC4 PC5 PC6 PC7 PC8 PC9 PC10 if (ancestry==0 & male==0 & gsib==0) 
	logistic wtlossbehav3 `pgsbmi' PC1 PC2 PC3 PC4 PC5 PC6 PC7 PC8 PC9 PC10 if (ancestry==0 & male==0 & gsib==0) 
	
	*****Adjusted for BMI******
	
	logistic WeightlossgoalW3 `pgsbmi' bmi_bio_w3 PC1 PC2 PC3 PC4 PC5 PC6 PC7 PC8 PC9 PC10 if (ancestry==0 & male==1 & gsib==0) 
	logistic wtlossbehav3 `pgsbmi' bmi_bio_w3 PC1 PC2 PC3 PC4 PC5 PC6 PC7 PC8 PC9 PC10 if (ancestry==0 & male==1 & gsib==0) 
	
	logistic WeightlossgoalW3 `pgsbmi' bmi_bio_w3 PC1 PC2 PC3 PC4 PC5 PC6 PC7 PC8 PC9 PC10 if (ancestry==0 & male==0 & gsib==0) 
	logistic wtlossbehav3 `pgsbmi' bmi_bio_w3 PC1 PC2 PC3 PC4 PC5 PC6 PC7 PC8 PC9 PC10 if (ancestry==0 & male==0 & gsib==0) 
	log close 
}


***********************

*     Supp Table 3     *

***********************
foreach pgsbmi of local PGS_list {
	local name1 = subinstr("`pgsbmi'", "pgsbmi_","",.)

	log using "`Results'/AH_WeightLossBehav_sTable3_`name1'.txt", replace text
	
	logistic WeightgaingoalW3 `pgsbmi' PC1 PC2 PC3 PC4 PC5 PC6 PC7 PC8 PC9 PC10 if (ancestry==0 & male==1 & gsib==0) 
	logistic weightgainbehav3 `pgsbmi' PC1 PC2 PC3 PC4 PC5 PC6 PC7 PC8 PC9 PC10 if (ancestry==0 & male==1 & gsib==0) 
	
	logistic WeightgaingoalW3 `pgsbmi' PC1 PC2 PC3 PC4 PC5 PC6 PC7 PC8 PC9 PC10 if (ancestry==0 & male==0 & gsib==0) 
	logistic weightgainbehav3 `pgsbmi' PC1 PC2 PC3 PC4 PC5 PC6 PC7 PC8 PC9 PC10 if (ancestry==0 & male==0 & gsib==0) 
	
	*****Adjusted for BMI******
	
	logistic WeightgaingoalW3 `pgsbmi' bmi_bio_w3 PC1 PC2 PC3 PC4 PC5 PC6 PC7 PC8 PC9 PC10 if (ancestry==0 & male==1 & gsib==0) 
	logistic weightgainbehav3 `pgsbmi' bmi_bio_w3 PC1 PC2 PC3 PC4 PC5 PC6 PC7 PC8 PC9 PC10 if (ancestry==0 & male==1 & gsib==0) 
	
	logistic WeightgaingoalW3 `pgsbmi' bmi_bio_w3 PC1 PC2 PC3 PC4 PC5 PC6 PC7 PC8 PC9 PC10 if (ancestry==0 & male==0 & gsib==0) 
	logistic weightgainbehav3 `pgsbmi' bmi_bio_w3 PC1 PC2 PC3 PC4 PC5 PC6 PC7 PC8 PC9 PC10 if (ancestry==0 & male==0 & gsib==0) 
	log close 
}


***********************

*     Supp Table 4     *
*  Mediation analysis  *

***********************
foreach pgsbmi of local PGS_list {
	local name1 = subinstr("`pgsbmi'", "pgsbmi_","",.)

	log using "`Results'/AH_WeightLossBehav_sTable4_`name1'.txt", replace text

	bootstrap r(ind_eff) r(dir_eff), reps(1000): sgmediation wtlossbehav3 if (ancestry==0 & male==1 & gsib==0), mv(bmi_bio_w3) iv(`pgsbmi') cv(PC1 PC2 PC3 PC4 PC5 PC6 PC7 PC8 PC9 PC10) 
	bootstrap r(ind_eff) r(dir_eff), reps(1000): sgmediation wtlossbehav3 if (ancestry==0 & male==0 & gsib==0), mv(bmi_bio_w3) iv(`pgsbmi') cv(PC1 PC2 PC3 PC4 PC5 PC6 PC7 PC8 PC9 PC10) 
	
	bootstrap r(ind_eff) r(dir_eff), reps(1000): sgmediation weightgainbehav3 if (ancestry==0 & male==1 & gsib==0), mv(bmi_bio_w3) iv(`pgsbmi') cv(PC1 PC2 PC3 PC4 PC5 PC6 PC7 PC8 PC9 PC10) 
	bootstrap r(ind_eff) r(dir_eff), reps(1000): sgmediation weightgainbehav3 if (ancestry==0 & male==0 & gsib==0), mv(bmi_bio_w3) iv(`pgsbmi') cv(PC1 PC2 PC3 PC4 PC5 PC6 PC7 PC8 PC9 PC10) 
	log close
}
