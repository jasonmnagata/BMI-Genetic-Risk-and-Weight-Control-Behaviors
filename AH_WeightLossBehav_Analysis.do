/*
This file performs the analyses for the project investigating the associations 
b/w weight loss behaviors and a PGS for BMI co-authored with Jason Nagata 
and Ben Domingue 

Last modified on: 12/23/2018
Last modified by: David B. Braudt 

Notes: 

*/


************************************************************************
*
*							Table 1
*
************************************************************************
******Table 1***** agew3, bmi_bio_w3
ttest  pgsbmi if(ancestry==0 & gsib==0 & (pgsbmi<4 | pgsbmi>-4)), by(male)

ttest age_w3 if(ancestry==0 & gsib==0 & (pgsbmi<4 | pgsbmi>-4)), by(male)
ttest bmi_bio_w3 if(ancestry==0 & gsib==0 & (pgsbmi<4 | pgsbmi>-4)), by(male)

tab W3BMIclass male if(ancestry==0 & gsib==0 & (pgsbmi<4 | pgsbmi>-4)), col chi

tab WeightlossgoalW3 male if(ancestry==0 & gsib==0 & (pgsbmi<4 | pgsbmi>-4)), col chi
tab WeightgaingoalW3 male if(ancestry==0 & gsib==0 & (pgsbmi<4 | pgsbmi>-4)), col chi

tab wtlossbehav3 male if(ancestry==0 & gsib==0 & (pgsbmi<4 | pgsbmi>-4)), col chi
tab weightgainbehav3 male if(ancestry==0 & gsib==0 & (pgsbmi<4 | pgsbmi>-4)), col chi

tab EDDx male if(ancestry==0 & gsib==0 & (pgsbmi<4 | pgsbmi>-4)), col chi



**** Table 2 **** need to confirm pc, ancestry, remove siblings
logistic WeightlossgoalW3 pgsbmi PC1 PC2 PC3 PC4 PC5 PC6 PC7 PC8 PC9 PC10 if (ancestry==0 & male==1 & gsib==0) 
logistic wtlossbehav3 pgsbmi PC1 PC2 PC3 PC4 PC5 PC6 PC7 PC8 PC9 PC10 if (ancestry==0 & male==1 & gsib==0) 

logistic WeightlossgoalW3 pgsbmi PC1 PC2 PC3 PC4 PC5 PC6 PC7 PC8 PC9 PC10 if (ancestry==0 & male==0 & gsib==0) 
logistic wtlossbehav3 pgsbmi PC1 PC2 PC3 PC4 PC5 PC6 PC7 PC8 PC9 PC10 if (ancestry==0 & male==0 & gsib==0) 

*****Adjusted for BMI******

logistic WeightlossgoalW3 pgsbmi bmi_bio_w3 PC1 PC2 PC3 PC4 PC5 PC6 PC7 PC8 PC9 PC10 if (ancestry==0 & male==1 & gsib==0) 
logistic wtlossbehav3 pgsbmi bmi_bio_w3 PC1 PC2 PC3 PC4 PC5 PC6 PC7 PC8 PC9 PC10 if (ancestry==0 & male==1 & gsib==0) 

logistic WeightlossgoalW3 pgsbmi bmi_bio_w3 PC1 PC2 PC3 PC4 PC5 PC6 PC7 PC8 PC9 PC10 if (ancestry==0 & male==0 & gsib==0) 
logistic wtlossbehav3 pgsbmi bmi_bio_w3 PC1 PC2 PC3 PC4 PC5 PC6 PC7 PC8 PC9 PC10 if (ancestry==0 & male==0 & gsib==0) 


*****Table 3******
logistic WeightgaingoalW3 pgsbmi PC1 PC2 PC3 PC4 PC5 PC6 PC7 PC8 PC9 PC10 if (ancestry==0 & male==1 & gsib==0) 
logistic weightgainbehav3 pgsbmi PC1 PC2 PC3 PC4 PC5 PC6 PC7 PC8 PC9 PC10 if (ancestry==0 & male==1 & gsib==0) 

logistic WeightgaingoalW3 pgsbmi PC1 PC2 PC3 PC4 PC5 PC6 PC7 PC8 PC9 PC10 if (ancestry==0 & male==0 & gsib==0) 
logistic weightgainbehav3 pgsbmi PC1 PC2 PC3 PC4 PC5 PC6 PC7 PC8 PC9 PC10 if (ancestry==0 & male==0 & gsib==0) 

*****Adjusted for BMI******

logistic WeightgaingoalW3 pgsbmi bmi_bio_w3 PC1 PC2 PC3 PC4 PC5 PC6 PC7 PC8 PC9 PC10 if (ancestry==0 & male==1 & gsib==0) 
logistic weightgainbehav3 pgsbmi bmi_bio_w3 PC1 PC2 PC3 PC4 PC5 PC6 PC7 PC8 PC9 PC10 if (ancestry==0 & male==1 & gsib==0) 

logistic WeightgaingoalW3 pgsbmi bmi_bio_w3 PC1 PC2 PC3 PC4 PC5 PC6 PC7 PC8 PC9 PC10 if (ancestry==0 & male==0 & gsib==0) 
logistic weightgainbehav3 pgsbmi bmi_bio_w3 PC1 PC2 PC3 PC4 PC5 PC6 PC7 PC8 PC9 PC10 if (ancestry==0 & male==0 & gsib==0) 


****Mediation analysis********
log using `Results'/AH_WeightLossBehav_Mediation.txt, replace text
sgmediation wtlossbehav3 if (ancestry==0 & male==1 & gsib==0), mv(bmi_bio_w3) iv(pgsbmi) cv(PC1 PC2 PC3 PC4 PC5 PC6 PC7 PC8 PC9 PC10)  
sgmediation wtlossbehav3 if (ancestry==0 & male==0 & gsib==0), mv(bmi_bio_w3) iv(pgsbmi) cv(PC1 PC2 PC3 PC4 PC5 PC6 PC7 PC8 PC9 PC10)  


sgmediation weightgainbehav3 if (ancestry==0 & male==1 & gsib==0), mv(bmi_bio_w3) iv(pgsbmi) cv(PC1 PC2 PC3 PC4 PC5 PC6 PC7 PC8 PC9 PC10)  
sgmediation weightgainbehav3 if (ancestry==0 & male==0 & gsib==0), mv(bmi_bio_w3) iv(pgsbmi) cv(PC1 PC2 PC3 PC4 PC5 PC6 PC7 PC8 PC9 PC10)  



bootstrap r(ind_eff) r(dir_eff), reps(1000): sgmediation wtlossbehav3 if (ancestry==0 & male==1 & gsib==0), mv(bmi_bio_w3) iv(pgsbmi) cv(PC1 PC2 PC3 PC4 PC5 PC6 PC7 PC8 PC9 PC10) 
bootstrap r(ind_eff) r(dir_eff), reps(1000): sgmediation wtlossbehav3 if (ancestry==0 & male==0 & gsib==0), mv(bmi_bio_w3) iv(pgsbmi) cv(PC1 PC2 PC3 PC4 PC5 PC6 PC7 PC8 PC9 PC10) 

bootstrap r(ind_eff) r(dir_eff), reps(1000): sgmediation weightgainbehav3 if (ancestry==0 & male==1 & gsib==0), mv(bmi_bio_w3) iv(pgsbmi) cv(PC1 PC2 PC3 PC4 PC5 PC6 PC7 PC8 PC9 PC10) 
bootstrap r(ind_eff) r(dir_eff), reps(1000): sgmediation weightgainbehav3 if (ancestry==0 & male==0 & gsib==0), mv(bmi_bio_w3) iv(pgsbmi) cv(PC1 PC2 PC3 PC4 PC5 PC6 PC7 PC8 PC9 PC10) 
log close 
