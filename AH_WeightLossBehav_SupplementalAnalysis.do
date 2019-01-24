/*
This file performs the analyses for the project investigating the associations 
b/w weight loss behaviors and a PGS for BMI co-authored with Jason Nagata 
and Ben Domingue 

Last modified on: 01/11/2019
Last modified by: David Braudt

Notes: 

*/

************************************************************************
*
*							Table 1
*
************************************************************************

****Weight loss behaviors
tab DietedW3lose male if(ancestry==0 & gsib==0 & (pgsbmi<4 | pgsbmi>-4)), col chi
tab FastW3lose male if(ancestry==0 & gsib==0 & (pgsbmi<4 | pgsbmi>-4)), col chi
tab vomitw3lose male if(ancestry==0 & gsib==0 & (pgsbmi<4 | pgsbmi>-4)), col chi
tab PillsW3lose male if(ancestry==0 & gsib==0 & (pgsbmi<4 | pgsbmi>-4)), col chi
tab laxativew3lose male if(ancestry==0 & gsib==0 & (pgsbmi<4 | pgsbmi>-4)), col chi
tab diureticsw3lose male if(ancestry==0 & gsib==0 & (pgsbmi<4 | pgsbmi>-4)), col chi

*****Weight gain behaviors
tab BulkAteMore male if(ancestry==0 & gsib==0 & (pgsbmi<4 | pgsbmi>-4)), col chi
tab BulkFoods male if(ancestry==0 & gsib==0 & (pgsbmi<4 | pgsbmi>-4)), col chi
tab BulkSupplements male if(ancestry==0 & gsib==0 & (pgsbmi<4 | pgsbmi>-4)), col chi
log close 

log using `Results'/AH_WeightLossBehav_Supplemental_ResultsText.txt, replace text
*****Results Text
****BMI PGS and W1 BMI
regress bmi_w1 pgsbmi PC1 PC2 PC3 PC4 PC5 PC6 PC7 PC8 PC9 PC10 if (ancestry==0 & male==1 & gsib==0) 
regress bmi_w1 pgsbmi PC1 PC2 PC3 PC4 PC5 PC6 PC7 PC8 PC9 PC10 if (ancestry==0 & male==0 & gsib==0) 

log close 



************************************************************************
*
*							Tables 2 and 3 Sensitivity analyses / Supplemental files
*
************************************************************************
log using `Results'/AH_WeightLossBehav_Supplemental_T2.txt, replace text
***Different number of PC's*****

****5 PC's******
****Table 2.1*****
logistic WeightlossgoalW3 pgsbmi PC1 PC2 PC3 PC4 PC5 if (ancestry==0 & male==1 & gsib==0) 
logistic wtlossbehav3 pgsbmi PC1 PC2 PC3 PC4 PC5 if (ancestry==0 & male==1 & gsib==0) 

logistic WeightlossgoalW3 pgsbmi PC1 PC2 PC3 PC4 PC5 if (ancestry==0 & male==0 & gsib==0) 
logistic wtlossbehav3 pgsbmi PC1 PC2 PC3 PC4 PC5 if (ancestry==0 & male==0 & gsib==0) 

*****Adjusted for BMI******
logistic WeightlossgoalW3 pgsbmi bmi_bio_w3 PC1 PC2 PC3 PC4 PC5 if (ancestry==0 & male==1 & gsib==0) 
logistic wtlossbehav3 pgsbmi bmi_bio_w3 PC1 PC2 PC3 PC4 PC5 if (ancestry==0 & male==1 & gsib==0) 

logistic WeightlossgoalW3 pgsbmi bmi_bio_w3 PC1 PC2 PC3 PC4 PC5 if (ancestry==0 & male==0 & gsib==0) 
logistic wtlossbehav3 pgsbmi bmi_bio_w3 PC1 PC2 PC3 PC4 PC5 if (ancestry==0 & male==0 & gsib==0) 


******15 PC's******
*** Table 2.2 **** need to confirm pc, ancestry, remove siblings
logistic WeightlossgoalW3 pgsbmi PC1 PC2 PC3 PC4 PC5 PC6 PC7 PC8 PC9 PC10 PC11 PC12 PC13 PC14 PC15 if (ancestry==0 & male==1 & gsib==0) 
logistic wtlossbehav3 pgsbmi PC1 PC2 PC3 PC4 PC5 PC6 PC7 PC8 PC9 PC10 PC11 PC12 PC13 PC14 PC15 if (ancestry==0 & male==1 & gsib==0) 

logistic WeightlossgoalW3 pgsbmi PC1 PC2 PC3 PC4 PC5 PC6 PC7 PC8 PC9 PC10 PC11 PC12 PC13 PC14 PC15 if (ancestry==0 & male==0 & gsib==0) 
logistic wtlossbehav3 pgsbmi PC1 PC2 PC3 PC4 PC5 PC6 PC7 PC8 PC9 PC10 PC11 PC12 PC13 PC14 PC15 if (ancestry==0 & male==0 & gsib==0) 

*****Adjusted for BMI******
logistic WeightlossgoalW3 pgsbmi bmi_bio_w3 PC1 PC2 PC3 PC4 PC5 PC6 PC7 PC8 PC9 PC10 PC11 PC12 PC13 PC14 PC15 if (ancestry==0 & male==1 & gsib==0) 
logistic wtlossbehav3 pgsbmi bmi_bio_w3 PC1 PC2 PC3 PC4 PC5 PC6 PC7 PC8 PC9 PC10 PC11 PC12 PC13 PC14 PC15 if (ancestry==0 & male==1 & gsib==0) 

logistic WeightlossgoalW3 pgsbmi bmi_bio_w3 PC1 PC2 PC3 PC4 PC5 PC6 PC7 PC8 PC9 PC10 PC11 PC12 PC13 PC14 PC15 if (ancestry==0 & male==0 & gsib==0) 
logistic wtlossbehav3 pgsbmi bmi_bio_w3 PC1 PC2 PC3 PC4 PC5 PC6 PC7 PC8 PC9 PC10 PC11 PC12 PC13 PC14 PC15 if (ancestry==0 & male==0 & gsib==0) 


******20 PC's******
*** Table 2.3 **** need to confirm pc, ancestry, remove siblings
logistic WeightlossgoalW3 pgsbmi PC1 PC2 PC3 PC4 PC5 PC6 PC7 PC8 PC9 PC10 PC11 PC12 PC13 PC14 PC15 PC16 PC17 PC18 PC19 PC20 if (ancestry==0 & male==1 & gsib==0) 
logistic wtlossbehav3 pgsbmi PC1 PC2 PC3 PC4 PC5 PC6 PC7 PC8 PC9 PC10 PC11 PC12 PC13 PC14 PC15 PC16 PC17 PC18 PC19 PC20 if (ancestry==0 & male==1 & gsib==0) 

logistic WeightlossgoalW3 pgsbmi PC1 PC2 PC3 PC4 PC5 PC6 PC7 PC8 PC9 PC10 PC11 PC12 PC13 PC14 PC15 PC16 PC17 PC18 PC19 PC20 if (ancestry==0 & male==0 & gsib==0) 
logistic wtlossbehav3 pgsbmi PC1 PC2 PC3 PC4 PC5 PC6 PC7 PC8 PC9 PC10 PC11 PC12 PC13 PC14 PC15 PC16 PC17 PC18 PC19 PC20 if (ancestry==0 & male==0 & gsib==0) 

*****Adjusted for BMI******
logistic WeightlossgoalW3 pgsbmi bmi_bio_w3 PC1 PC2 PC3 PC4 PC5 PC6 PC7 PC8 PC9 PC10 PC11 PC12 PC13 PC14 PC15 PC16 PC17 PC18 PC19 PC20 if (ancestry==0 & male==1 & gsib==0) 
logistic wtlossbehav3 pgsbmi bmi_bio_w3 PC1 PC2 PC3 PC4 PC5 PC6 PC7 PC8 PC9 PC10 PC11 PC12 PC13 PC14 PC15 PC16 PC17 PC18 PC19 PC20 if (ancestry==0 & male==1 & gsib==0) 

logistic WeightlossgoalW3 pgsbmi bmi_bio_w3 PC1 PC2 PC3 PC4 PC5 PC6 PC7 PC8 PC9 PC10 PC11 PC12 PC13 PC14 PC15 PC16 PC17 PC18 PC19 PC20 if (ancestry==0 & male==0 & gsib==0) 
logistic wtlossbehav3 pgsbmi bmi_bio_w3 PC1 PC2 PC3 PC4 PC5 PC6 PC7 PC8 PC9 PC10 PC11 PC12 PC13 PC14 PC15 PC16 PC17 PC18 PC19 PC20 if (ancestry==0 & male==0 & gsib==0) 


*****Exclude Participants with ED Diagnosis
**** Table 2.4 **** need to confirm pc, ancestry, remove siblings
logistic WeightlossgoalW3 pgsbmi PC1 PC2 PC3 PC4 PC5 PC6 PC7 PC8 PC9 PC10 if (ancestry==0 & male==1 & gsib==0 & EDDx==0) 
logistic wtlossbehav3 pgsbmi PC1 PC2 PC3 PC4 PC5 PC6 PC7 PC8 PC9 PC10 if (ancestry==0 & male==1 & gsib==0 & EDDx==0) 

logistic WeightlossgoalW3 pgsbmi PC1 PC2 PC3 PC4 PC5 PC6 PC7 PC8 PC9 PC10 if (ancestry==0 & male==0 & gsib==0 & EDDx==0) 
logistic wtlossbehav3 pgsbmi PC1 PC2 PC3 PC4 PC5 PC6 PC7 PC8 PC9 PC10 if (ancestry==0 & male==0 & gsib==0 & EDDx==0) 

*****Adjusted for BMI******
logistic WeightlossgoalW3 pgsbmi bmi_bio_w3 PC1 PC2 PC3 PC4 PC5 PC6 PC7 PC8 PC9 PC10 if (ancestry==0 & male==1 & gsib==0 & EDDx==0) 
logistic wtlossbehav3 pgsbmi bmi_bio_w3 PC1 PC2 PC3 PC4 PC5 PC6 PC7 PC8 PC9 PC10 if (ancestry==0 & male==1 & gsib==0 & EDDx==0) 

logistic WeightlossgoalW3 pgsbmi bmi_bio_w3 PC1 PC2 PC3 PC4 PC5 PC6 PC7 PC8 PC9 PC10 if (ancestry==0 & male==0 & gsib==0 & EDDx==0) 
logistic wtlossbehav3 pgsbmi bmi_bio_w3 PC1 PC2 PC3 PC4 PC5 PC6 PC7 PC8 PC9 PC10 if (ancestry==0 & male==0 & gsib==0 & EDDx==0) 


****Adjust for School
*****Need psuscid from weighting data***

**** Table 2.5 **** need to confirm pc, ancestry, remove siblings
logistic WeightlossgoalW3 pgsbmi PC1 PC2 PC3 PC4 PC5 PC6 PC7 PC8 PC9 PC10 psuscid if (ancestry==0 & male==1 & gsib==0) 
logistic wtlossbehav3 pgsbmi PC1 PC2 PC3 PC4 PC5 PC6 PC7 PC8 PC9 PC10 psuscid if (ancestry==0 & male==1 & gsib==0) 

logistic WeightlossgoalW3 pgsbmi PC1 PC2 PC3 PC4 PC5 PC6 PC7 PC8 PC9 PC10 psuscid if (ancestry==0 & male==0 & gsib==0) 
logistic wtlossbehav3 pgsbmi PC1 PC2 PC3 PC4 PC5 PC6 PC7 PC8 PC9 PC10 psuscid if (ancestry==0 & male==0 & gsib==0) 

*****Adjusted for BMI******
logistic WeightlossgoalW3 pgsbmi bmi_bio_w3 PC1 PC2 PC3 PC4 PC5 PC6 PC7 PC8 PC9 PC10 psuscid if (ancestry==0 & male==1 & gsib==0) 
logistic wtlossbehav3 pgsbmi bmi_bio_w3 PC1 PC2 PC3 PC4 PC5 PC6 PC7 PC8 PC9 PC10 psuscid if (ancestry==0 & male==1 & gsib==0) 

logistic WeightlossgoalW3 pgsbmi bmi_bio_w3 PC1 PC2 PC3 PC4 PC5 PC6 PC7 PC8 PC9 PC10 psuscid if (ancestry==0 & male==0 & gsib==0) 
logistic wtlossbehav3 pgsbmi bmi_bio_w3 PC1 PC2 PC3 PC4 PC5 PC6 PC7 PC8 PC9 PC10 psuscid if (ancestry==0 & male==0 & gsib==0) 



************************************************************************
*
*							Negative Binomial Regression 
*
************************************************************************

**** Table 2.6 **** need to confirm pc, ancestry, remove siblings
nbreg wtlossbehav3cont pgsbmi PC1 PC2 PC3 PC4 PC5 PC6 PC7 PC8 PC9 PC10 if (ancestry==0 & male==1 & gsib==0) 
nbreg wtlossbehav3cont pgsbmi PC1 PC2 PC3 PC4 PC5 PC6 PC7 PC8 PC9 PC10 if (ancestry==0 & male==0 & gsib==0) 
 
*****Adjusted for BMI******
nbreg wtlossbehav3cont pgsbmi bmi_bio_w3 PC1 PC2 PC3 PC4 PC5 PC6 PC7 PC8 PC9 PC10 if (ancestry==0 & male==1 & gsib==0) 
nbreg wtlossbehav3cont pgsbmi bmi_bio_w3 PC1 PC2 PC3 PC4 PC5 PC6 PC7 PC8 PC9 PC10 if (ancestry==0 & male==0 & gsib==0) 


log close 



log using `Results'/AH_WeightLossBehav_Supplemental_T3.txt, replace text
****5 PC's******
*****Table 3.1******
logistic WeightgaingoalW3 pgsbmi PC1 PC2 PC3 PC4 PC5 if (ancestry==0 & male==1 & gsib==0) 
logistic weightgainbehav3 pgsbmi PC1 PC2 PC3 PC4 PC5 if (ancestry==0 & male==1 & gsib==0) 

logistic WeightgaingoalW3 pgsbmi PC1 PC2 PC3 PC4 PC5 if (ancestry==0 & male==0 & gsib==0) 
logistic weightgainbehav3 pgsbmi PC1 PC2 PC3 PC4 PC5 if (ancestry==0 & male==0 & gsib==0) 

*****Adjusted for BMI******
logistic WeightgaingoalW3 pgsbmi bmi_bio_w3 PC1 PC2 PC3 PC4 PC5 if (ancestry==0 & male==1 & gsib==0) 
logistic weightgainbehav3 pgsbmi bmi_bio_w3 PC1 PC2 PC3 PC4 PC5 if (ancestry==0 & male==1 & gsib==0) 

logistic WeightgaingoalW3 pgsbmi bmi_bio_w3 PC1 PC2 PC3 PC4 PC5 if (ancestry==0 & male==0 & gsib==0) 
logistic weightgainbehav3 pgsbmi bmi_bio_w3 PC1 PC2 PC3 PC4 PC5 if (ancestry==0 & male==0 & gsib==0) 


******15 PC's******
*****Table 3.2******
logistic WeightgaingoalW3 pgsbmi PC1 PC2 PC3 PC4 PC5 PC6 PC7 PC8 PC9 PC10 PC11 PC12 PC13 PC14 PC15 if (ancestry==0 & male==1 & gsib==0) 
logistic weightgainbehav3 pgsbmi PC1 PC2 PC3 PC4 PC5 PC6 PC7 PC8 PC9 PC10 PC11 PC12 PC13 PC14 PC15 if (ancestry==0 & male==1 & gsib==0) 

logistic WeightgaingoalW3 pgsbmi PC1 PC2 PC3 PC4 PC5 PC6 PC7 PC8 PC9 PC10 PC11 PC12 PC13 PC14 PC15 if (ancestry==0 & male==0 & gsib==0) 
logistic weightgainbehav3 pgsbmi PC1 PC2 PC3 PC4 PC5 PC6 PC7 PC8 PC9 PC10 PC11 PC12 PC13 PC14 PC15 if (ancestry==0 & male==0 & gsib==0) 

*****Adjusted for BMI******
logistic WeightgaingoalW3 pgsbmi bmi_bio_w3 PC1 PC2 PC3 PC4 PC5 PC6 PC7 PC8 PC9 PC10 PC11 PC12 PC13 PC14 PC15 if (ancestry==0 & male==1 & gsib==0) 
logistic weightgainbehav3 pgsbmi bmi_bio_w3 PC1 PC2 PC3 PC4 PC5 PC6 PC7 PC8 PC9 PC10 PC11 PC12 PC13 PC14 PC15 if (ancestry==0 & male==1 & gsib==0) 

logistic WeightgaingoalW3 pgsbmi bmi_bio_w3 PC1 PC2 PC3 PC4 PC5 PC6 PC7 PC8 PC9 PC10 PC11 PC12 PC13 PC14 PC15 if (ancestry==0 & male==0 & gsib==0) 
logistic weightgainbehav3 pgsbmi bmi_bio_w3 PC1 PC2 PC3 PC4 PC5 PC6 PC7 PC8 PC9 PC10 PC11 PC12 PC13 PC14 PC15 if (ancestry==0 & male==0 & gsib==0) 


******20 PC's******
*****Table 3.3******
logistic WeightgaingoalW3 pgsbmi PC1 PC2 PC3 PC4 PC5 PC6 PC7 PC8 PC9 PC10 PC11 PC12 PC13 PC14 PC15 PC16 PC17 PC18 PC19 PC20 if (ancestry==0 & male==1 & gsib==0) 
logistic weightgainbehav3 pgsbmi PC1 PC2 PC3 PC4 PC5 PC6 PC7 PC8 PC9 PC10 PC11 PC12 PC13 PC14 PC15 PC16 PC17 PC18 PC19 PC20 if (ancestry==0 & male==1 & gsib==0) 

logistic WeightgaingoalW3 pgsbmi PC1 PC2 PC3 PC4 PC5 PC6 PC7 PC8 PC9 PC10 PC11 PC12 PC13 PC14 PC15 PC16 PC17 PC18 PC19 PC20 if (ancestry==0 & male==0 & gsib==0) 
logistic weightgainbehav3 pgsbmi PC1 PC2 PC3 PC4 PC5 PC6 PC7 PC8 PC9 PC10 PC11 PC12 PC13 PC14 PC15 PC16 PC17 PC18 PC19 PC20 if (ancestry==0 & male==0 & gsib==0) 

*****Adjusted for BMI******
logistic WeightgaingoalW3 pgsbmi bmi_bio_w3 PC1 PC2 PC3 PC4 PC5 PC6 PC7 PC8 PC9 PC10 PC11 PC12 PC13 PC14 PC15 PC16 PC17 PC18 PC19 PC20 if (ancestry==0 & male==1 & gsib==0) 
logistic weightgainbehav3 pgsbmi bmi_bio_w3 PC1 PC2 PC3 PC4 PC5 PC6 PC7 PC8 PC9 PC10 PC11 PC12 PC13 PC14 PC15 PC16 PC17 PC18 PC19 PC20 if (ancestry==0 & male==1 & gsib==0) 

logistic WeightgaingoalW3 pgsbmi bmi_bio_w3 PC1 PC2 PC3 PC4 PC5 PC6 PC7 PC8 PC9 PC10 PC11 PC12 PC13 PC14 PC15 PC16 PC17 PC18 PC19 PC20 if (ancestry==0 & male==0 & gsib==0) 
logistic weightgainbehav3 pgsbmi bmi_bio_w3 PC1 PC2 PC3 PC4 PC5 PC6 PC7 PC8 PC9 PC10 PC11 PC12 PC13 PC14 PC15 PC16 PC17 PC18 PC19 PC20 if (ancestry==0 & male==0 & gsib==0) 


*****Exclude Participants with ED Diagnosis
*****Table 3.4*****
logistic WeightgaingoalW3 pgsbmi PC1 PC2 PC3 PC4 PC5 PC6 PC7 PC8 PC9 PC10 if (ancestry==0 & male==1 & gsib==0 & EDDx==0) 
logistic weightgainbehav3 pgsbmi PC1 PC2 PC3 PC4 PC5 PC6 PC7 PC8 PC9 PC10 if (ancestry==0 & male==1 & gsib==0 & EDDx==0) 

logistic WeightgaingoalW3 pgsbmi PC1 PC2 PC3 PC4 PC5 PC6 PC7 PC8 PC9 PC10 if (ancestry==0 & male==0 & gsib==0 & EDDx==0) 
logistic weightgainbehav3 pgsbmi PC1 PC2 PC3 PC4 PC5 PC6 PC7 PC8 PC9 PC10 if (ancestry==0 & male==0 & gsib==0 & EDDx==0) 

*****Adjusted for BMI******
logistic WeightgaingoalW3 pgsbmi bmi_bio_w3 PC1 PC2 PC3 PC4 PC5 PC6 PC7 PC8 PC9 PC10 if (ancestry==0 & male==1 & gsib==0 & EDDx==0) 
logistic weightgainbehav3 pgsbmi bmi_bio_w3 PC1 PC2 PC3 PC4 PC5 PC6 PC7 PC8 PC9 PC10 if (ancestry==0 & male==1 & gsib==0 & EDDx==0) 

logistic WeightgaingoalW3 pgsbmi bmi_bio_w3 PC1 PC2 PC3 PC4 PC5 PC6 PC7 PC8 PC9 PC10 if (ancestry==0 & male==0 & gsib==0 & EDDx==0) 
logistic weightgainbehav3 pgsbmi bmi_bio_w3 PC1 PC2 PC3 PC4 PC5 PC6 PC7 PC8 PC9 PC10 if (ancestry==0 & male==0 & gsib==0 & EDDx==0) 


****Adjust for School
*****Need psuscid from weighting data***

*****Table 3.5******
logistic WeightgaingoalW3 pgsbmi PC1 PC2 PC3 PC4 PC5 PC6 PC7 PC8 PC9 PC10 psuscid if (ancestry==0 & male==1 & gsib==0) 
logistic weightgainbehav3 pgsbmi PC1 PC2 PC3 PC4 PC5 PC6 PC7 PC8 PC9 PC10 psuscid if (ancestry==0 & male==1 & gsib==0) 

logistic WeightgaingoalW3 pgsbmi PC1 PC2 PC3 PC4 PC5 PC6 PC7 PC8 PC9 PC10 psuscid if (ancestry==0 & male==0 & gsib==0) 
logistic weightgainbehav3 pgsbmi PC1 PC2 PC3 PC4 PC5 PC6 PC7 PC8 PC9 PC10 psuscid if (ancestry==0 & male==0 & gsib==0) 

*****Adjusted for BMI******
logistic WeightgaingoalW3 pgsbmi bmi_bio_w3 PC1 PC2 PC3 PC4 PC5 PC6 PC7 PC8 PC9 PC10 psuscid if (ancestry==0 & male==1 & gsib==0) 
logistic weightgainbehav3 pgsbmi bmi_bio_w3 PC1 PC2 PC3 PC4 PC5 PC6 PC7 PC8 PC9 PC10 psuscid if (ancestry==0 & male==1 & gsib==0) 

logistic WeightgaingoalW3 pgsbmi bmi_bio_w3 PC1 PC2 PC3 PC4 PC5 PC6 PC7 PC8 PC9 PC10 psuscid if (ancestry==0 & male==0 & gsib==0) 
logistic weightgainbehav3 pgsbmi bmi_bio_w3 PC1 PC2 PC3 PC4 PC5 PC6 PC7 PC8 PC9 PC10 psuscid if (ancestry==0 & male==0 & gsib==0) 




log using `Results'/AH_WeightLossBehav_Supplemental_T4.txt, replace text
************************************************************************
*
*							Mediation analyses / Supplemental files
*
************************************************************************


*******Different number of PC's***
***5 PC's ****
***Table 4.1
sgmediation wtlossbehav3 if (ancestry==0 & male==1 & gsib==0), mv(bmi_bio_w3) iv(pgsbmi) cv(PC1 PC2 PC3 PC4 PC5)  
sgmediation wtlossbehav3 if (ancestry==0 & male==0 & gsib==0), mv(bmi_bio_w3) iv(pgsbmi) cv(PC1 PC2 PC3 PC4 PC5)  

sgmediation weightgainbehav3 if (ancestry==0 & male==1 & gsib==0), mv(bmi_bio_w3) iv(pgsbmi) cv(PC1 PC2 PC3 PC4 PC5)  
sgmediation weightgainbehav3 if (ancestry==0 & male==0 & gsib==0), mv(bmi_bio_w3) iv(pgsbmi) cv(PC1 PC2 PC3 PC4 PC5)  

bootstrap r(ind_eff) r(dir_eff), reps(1000): sgmediation wtlossbehav3 if (ancestry==0 & male==1 & gsib==0), mv(bmi_bio_w3) iv(pgsbmi) cv(PC1 PC2 PC3 PC4 PC5) 
bootstrap r(ind_eff) r(dir_eff), reps(1000): sgmediation wtlossbehav3 if (ancestry==0 & male==0 & gsib==0), mv(bmi_bio_w3) iv(pgsbmi) cv(PC1 PC2 PC3 PC4 PC5) 

bootstrap r(ind_eff) r(dir_eff), reps(1000): sgmediation weightgainbehav3 if (ancestry==0 & male==1 & gsib==0), mv(bmi_bio_w3) iv(pgsbmi) cv(PC1 PC2 PC3 PC4 PC5) 
bootstrap r(ind_eff) r(dir_eff), reps(1000): sgmediation weightgainbehav3 if (ancestry==0 & male==0 & gsib==0), mv(bmi_bio_w3) iv(pgsbmi) cv(PC1 PC2 PC3 PC4 PC5) 

***15 PC's****
****Table 4.2
sgmediation wtlossbehav3 if (ancestry==0 & male==1 & gsib==0), mv(bmi_bio_w3) iv(pgsbmi) cv(PC1 PC2 PC3 PC4 PC5 PC6 PC7 PC8 PC9 PC10 PC11 PC12 PC13 PC14 PC15 )  
sgmediation wtlossbehav3 if (ancestry==0 & male==0 & gsib==0), mv(bmi_bio_w3) iv(pgsbmi) cv(PC1 PC2 PC3 PC4 PC5 PC6 PC7 PC8 PC9 PC10 PC11 PC12 PC13 PC14 PC15)  

sgmediation weightgainbehav3 if (ancestry==0 & male==1 & gsib==0), mv(bmi_bio_w3) iv(pgsbmi) cv(PC1 PC2 PC3 PC4 PC5 PC6 PC7 PC8 PC9 PC10 PC11 PC12 PC13 PC14 PC15)  
sgmediation weightgainbehav3 if (ancestry==0 & male==0 & gsib==0), mv(bmi_bio_w3) iv(pgsbmi) cv(PC1 PC2 PC3 PC4 PC5 PC6 PC7 PC8 PC9 PC10 PC11 PC12 PC13 PC14 PC15)  

bootstrap r(ind_eff) r(dir_eff), reps(1000): sgmediation wtlossbehav3 if (ancestry==0 & male==1 & gsib==0), mv(bmi_bio_w3) iv(pgsbmi) cv(PC1 PC2 PC3 PC4 PC5 PC6 PC7 PC8 PC9 PC10 PC11 PC12 PC13 PC14 PC15) 
bootstrap r(ind_eff) r(dir_eff), reps(1000): sgmediation wtlossbehav3 if (ancestry==0 & male==0 & gsib==0), mv(bmi_bio_w3) iv(pgsbmi) cv(PC1 PC2 PC3 PC4 PC5 PC6 PC7 PC8 PC9 PC10 PC11 PC12 PC13 PC14 PC15) 

bootstrap r(ind_eff) r(dir_eff), reps(1000): sgmediation weightgainbehav3 if (ancestry==0 & male==1 & gsib==0), mv(bmi_bio_w3) iv(pgsbmi) cv(PC1 PC2 PC3 PC4 PC5 PC6 PC7 PC8 PC9 PC10 PC11 PC12 PC13 PC14 PC15) 
bootstrap r(ind_eff) r(dir_eff), reps(1000): sgmediation weightgainbehav3 if (ancestry==0 & male==0 & gsib==0), mv(bmi_bio_w3) iv(pgsbmi) cv(PC1 PC2 PC3 PC4 PC5 PC6 PC7 PC8 PC9 PC10 PC11 PC12 PC13 PC14 PC15) 

***20 PC's****
***Table 4.3
sgmediation wtlossbehav3 if (ancestry==0 & male==1 & gsib==0), mv(bmi_bio_w3) iv(pgsbmi) cv(PC1 PC2 PC3 PC4 PC5 PC6 PC7 PC8 PC9 PC10 PC11 PC12 PC13 PC14 PC15 PC16 PC17 PC18 PC19 PC20)  
sgmediation wtlossbehav3 if (ancestry==0 & male==0 & gsib==0), mv(bmi_bio_w3) iv(pgsbmi) cv(PC1 PC2 PC3 PC4 PC5 PC6 PC7 PC8 PC9 PC10 PC11 PC12 PC13 PC14 PC15 PC16 PC17 PC18 PC19 PC20)  

sgmediation weightgainbehav3 if (ancestry==0 & male==1 & gsib==0), mv(bmi_bio_w3) iv(pgsbmi) cv(PC1 PC2 PC3 PC4 PC5 PC6 PC7 PC8 PC9 PC10 PC11 PC12 PC13 PC14 PC15 PC16 PC17 PC18 PC19 PC20)  
sgmediation weightgainbehav3 if (ancestry==0 & male==0 & gsib==0), mv(bmi_bio_w3) iv(pgsbmi) cv(PC1 PC2 PC3 PC4 PC5 PC6 PC7 PC8 PC9 PC10 PC11 PC12 PC13 PC14 PC15 PC16 PC17 PC18 PC19 PC20)  

bootstrap r(ind_eff) r(dir_eff), reps(1000): sgmediation wtlossbehav3 if (ancestry==0 & male==1 & gsib==0), mv(bmi_bio_w3) iv(pgsbmi) cv(PC1 PC2 PC3 PC4 PC5 PC6 PC7 PC8 PC9 PC10 PC11 PC12 PC13 PC14 PC15 PC16 PC17 PC18 PC19 PC20) 
bootstrap r(ind_eff) r(dir_eff), reps(1000): sgmediation wtlossbehav3 if (ancestry==0 & male==0 & gsib==0), mv(bmi_bio_w3) iv(pgsbmi) cv(PC1 PC2 PC3 PC4 PC5 PC6 PC7 PC8 PC9 PC10 PC11 PC12 PC13 PC14 PC15 PC16 PC17 PC18 PC19 PC20) 

bootstrap r(ind_eff) r(dir_eff), reps(1000): sgmediation weightgainbehav3 if (ancestry==0 & male==1 & gsib==0), mv(bmi_bio_w3) iv(pgsbmi) cv(PC1 PC2 PC3 PC4 PC5 PC6 PC7 PC8 PC9 PC10 PC11 PC12 PC13 PC14 PC15 PC16 PC17 PC18 PC19 PC20) 
bootstrap r(ind_eff) r(dir_eff), reps(1000): sgmediation weightgainbehav3 if (ancestry==0 & male==0 & gsib==0), mv(bmi_bio_w3) iv(pgsbmi) cv(PC1 PC2 PC3 PC4 PC5 PC6 PC7 PC8 PC9 PC10 PC11 PC12 PC13 PC14 PC15 PC16 PC17 PC18 PC19 PC20) 

****Exclude Participants with ED diagnosis****
***Table 4.4****
sgmediation wtlossbehav3 if (ancestry==0 & male==1 & gsib==0 & EDDx==0), mv(bmi_bio_w3) iv(pgsbmi) cv(PC1 PC2 PC3 PC4 PC5 PC6 PC7 PC8 PC9 PC10)  
sgmediation wtlossbehav3 if (ancestry==0 & male==0 & gsib==0 & EDDx==0), mv(bmi_bio_w3) iv(pgsbmi) cv(PC1 PC2 PC3 PC4 PC5 PC6 PC7 PC8 PC9 PC10)  

sgmediation weightgainbehav3 if (ancestry==0 & male==1 & gsib==0 & EDDx==0), mv(bmi_bio_w3) iv(pgsbmi) cv(PC1 PC2 PC3 PC4 PC5 PC6 PC7 PC8 PC9 PC10)  
sgmediation weightgainbehav3 if (ancestry==0 & male==0 & gsib==0 & EDDx==0), mv(bmi_bio_w3) iv(pgsbmi) cv(PC1 PC2 PC3 PC4 PC5 PC6 PC7 PC8 PC9 PC10)  

bootstrap r(ind_eff) r(dir_eff), reps(1000): sgmediation wtlossbehav3 if (ancestry==0 & male==1 & gsib==0 & EDDx==0), mv(bmi_bio_w3) iv(pgsbmi) cv(PC1 PC2 PC3 PC4 PC5 PC6 PC7 PC8 PC9 PC10) 
bootstrap r(ind_eff) r(dir_eff), reps(1000): sgmediation wtlossbehav3 if (ancestry==0 & male==0 & gsib==0 & EDDx==0), mv(bmi_bio_w3) iv(pgsbmi) cv(PC1 PC2 PC3 PC4 PC5 PC6 PC7 PC8 PC9 PC10) 

bootstrap r(ind_eff) r(dir_eff), reps(1000): sgmediation weightgainbehav3 if (ancestry==0 & male==1 & gsib==0 & EDDx==0), mv(bmi_bio_w3) iv(pgsbmi) cv(PC1 PC2 PC3 PC4 PC5 PC6 PC7 PC8 PC9 PC10) 
bootstrap r(ind_eff) r(dir_eff), reps(1000): sgmediation weightgainbehav3 if (ancestry==0 & male==0 & gsib==0 & EDDx==0), mv(bmi_bio_w3) iv(pgsbmi) cv(PC1 PC2 PC3 PC4 PC5 PC6 PC7 PC8 PC9 PC10) 


****Adjust for School
*****Need psuscid from weighting data***
****Table 4.5
sgmediation wtlossbehav3 if (ancestry==0 & male==1 & gsib==0), mv(bmi_bio_w3) iv(pgsbmi) cv(PC1 PC2 PC3 PC4 PC5 PC6 PC7 PC8 PC9 PC10 psuscid)  
sgmediation wtlossbehav3 if (ancestry==0 & male==0 & gsib==0), mv(bmi_bio_w3) iv(pgsbmi) cv(PC1 PC2 PC3 PC4 PC5 PC6 PC7 PC8 PC9 PC10 psuscid)  

sgmediation weightgainbehav3 if (ancestry==0 & male==1 & gsib==0), mv(bmi_bio_w3) iv(pgsbmi) cv(PC1 PC2 PC3 PC4 PC5 PC6 PC7 PC8 PC9 PC10 psuscid)  
sgmediation weightgainbehav3 if (ancestry==0 & male==0 & gsib==0), mv(bmi_bio_w3) iv(pgsbmi) cv(PC1 PC2 PC3 PC4 PC5 PC6 PC7 PC8 PC9 PC10 psuscid)  

bootstrap r(ind_eff) r(dir_eff), reps(1000): sgmediation wtlossbehav3 if (ancestry==0 & male==1 & gsib==0), mv(bmi_bio_w3) iv(pgsbmi) cv(PC1 PC2 PC3 PC4 PC5 PC6 PC7 PC8 PC9 PC10 psuscid) 
bootstrap r(ind_eff) r(dir_eff), reps(1000): sgmediation wtlossbehav3 if (ancestry==0 & male==0 & gsib==0), mv(bmi_bio_w3) iv(pgsbmi) cv(PC1 PC2 PC3 PC4 PC5 PC6 PC7 PC8 PC9 PC10 psuscid) 

bootstrap r(ind_eff) r(dir_eff), reps(1000): sgmediation weightgainbehav3 if (ancestry==0 & male==1 & gsib==0), mv(bmi_bio_w3) iv(pgsbmi) cv(PC1 PC2 PC3 PC4 PC5 PC6 PC7 PC8 PC9 PC10 psuscid) 
bootstrap r(ind_eff) r(dir_eff), reps(1000): sgmediation weightgainbehav3 if (ancestry==0 & male==0 & gsib==0), mv(bmi_bio_w3) iv(pgsbmi) cv(PC1 PC2 PC3 PC4 PC5 PC6 PC7 PC8 PC9 PC10 psuscid) 
 
 ******BMI change from W1 to W3 as mediator**********

* New variable BMI change from W1 to W3 *
gen bmichange_w1w3 = bmi_bio_w3-bmi_w1 

****Table 4.6*****
sgmediation wtlossbehav3 if (ancestry==0 & male==1 & gsib==0), mv(bmichange_w1w3) iv(pgsbmi) cv(PC1 PC2 PC3 PC4 PC5 PC6 PC7 PC8 PC9 PC10)  
sgmediation wtlossbehav3 if (ancestry==0 & male==0 & gsib==0), mv(bmichange_w1w3) iv(pgsbmi) cv(PC1 PC2 PC3 PC4 PC5 PC6 PC7 PC8 PC9 PC10)  

sgmediation weightgainbehav3 if (ancestry==0 & male==1 & gsib==0), mv(bmichange_w1w3) iv(pgsbmi) cv(PC1 PC2 PC3 PC4 PC5 PC6 PC7 PC8 PC9 PC10)  
sgmediation weightgainbehav3 if (ancestry==0 & male==0 & gsib==0), mv(bmichange_w1w3) iv(pgsbmi) cv(PC1 PC2 PC3 PC4 PC5 PC6 PC7 PC8 PC9 PC10)  

bootstrap r(ind_eff) r(dir_eff), reps(1000): sgmediation wtlossbehav3 if (ancestry==0 & male==1 & gsib==0), mv(bmichange_w1w3) iv(pgsbmi) cv(PC1 PC2 PC3 PC4 PC5 PC6 PC7 PC8 PC9 PC10) 
bootstrap r(ind_eff) r(dir_eff), reps(1000): sgmediation wtlossbehav3 if (ancestry==0 & male==0 & gsib==0), mv(bmichange_w1w3) iv(pgsbmi) cv(PC1 PC2 PC3 PC4 PC5 PC6 PC7 PC8 PC9 PC10) 

bootstrap r(ind_eff) r(dir_eff), reps(1000): sgmediation weightgainbehav3 if (ancestry==0 & male==1 & gsib==0), mv(bmichange_w1w3) iv(pgsbmi) cv(PC1 PC2 PC3 PC4 PC5 PC6 PC7 PC8 PC9 PC10) 
bootstrap r(ind_eff) r(dir_eff), reps(1000): sgmediation weightgainbehav3 if (ancestry==0 & male==0 & gsib==0), mv(bmichange_w1w3) iv(pgsbmi) cv(PC1 PC2 PC3 PC4 PC5 PC6 PC7 PC8 PC9 PC10) 
log close 



log using `Results'/AH_WeightLossBehav_Supplemental_Reviewer3.txt, replace text
************************************************************************
*                      **1/7/19**
*		Miscellaneous Sensitivity analyses  
*
************************************************************************



***Reviewer 3, Comment #15: Association between BMI PGS and BMI at ages 11-18****
regress bmi_w1 pgsbmi if (ancestry==0 & male==1 & gsib==0)
regress bmi_w1 pgsbmi if (ancestry==0 & male==0 & gsib==0)

regress bmi_w1 pgsbmi PC1 PC2 PC3 PC4 PC5 PC6 PC7 PC8 PC9 PC10 if (ancestry==0 & male==1 & gsib==0)
regress bmi_w1 pgsbmi PC1 PC2 PC3 PC4 PC5 PC6 PC7 PC8 PC9 PC10 if (ancestry==0 & male==0 & gsib==0)

****Reviewer 3, Comment #16: Compare BMI PGS by sex, adjusting for PCs********
regress pgsbmi i.male PC1 PC2 PC3 PC4 PC5 PC6 PC7 PC8 PC9 PC10 if (ancestry==0 & gsib==0)

log close


log using `Results'/AH_WeightLossBehav_Supplemental_011019.txt, replace text
************************************************************************
*                      **1/10/19**
*		Miscellaneous Sensitivity analyses  
*    Mediation with BMI Wave 1 as mediator
************************************************************************

sgmediation wtlossbehav3 if (ancestry==0 & male==1 & gsib==0), mv(bmi_w1) iv(pgsbmi) cv(PC1 PC2 PC3 PC4 PC5 PC6 PC7 PC8 PC9 PC10)  
sgmediation wtlossbehav3 if (ancestry==0 & male==0 & gsib==0), mv(bmi_w1) iv(pgsbmi) cv(PC1 PC2 PC3 PC4 PC5 PC6 PC7 PC8 PC9 PC10)  

sgmediation weightgainbehav3 if (ancestry==0 & male==1 & gsib==0), mv(bmi_w1) iv(pgsbmi) cv(PC1 PC2 PC3 PC4 PC5 PC6 PC7 PC8 PC9 PC10)  
sgmediation weightgainbehav3 if (ancestry==0 & male==0 & gsib==0), mv(bmi_w1) iv(pgsbmi) cv(PC1 PC2 PC3 PC4 PC5 PC6 PC7 PC8 PC9 PC10)  

bootstrap r(ind_eff) r(dir_eff), reps(1000): sgmediation wtlossbehav3 if (ancestry==0 & male==1 & gsib==0), mv(bmi_w1) iv(pgsbmi) cv(PC1 PC2 PC3 PC4 PC5 PC6 PC7 PC8 PC9 PC10) 
bootstrap r(ind_eff) r(dir_eff), reps(1000): sgmediation wtlossbehav3 if (ancestry==0 & male==0 & gsib==0), mv(bmi_w1) iv(pgsbmi) cv(PC1 PC2 PC3 PC4 PC5 PC6 PC7 PC8 PC9 PC10) 

bootstrap r(ind_eff) r(dir_eff), reps(1000): sgmediation weightgainbehav3 if (ancestry==0 & male==1 & gsib==0), mv(bmi_w1) iv(pgsbmi) cv(PC1 PC2 PC3 PC4 PC5 PC6 PC7 PC8 PC9 PC10) 
bootstrap r(ind_eff) r(dir_eff), reps(1000): sgmediation weightgainbehav3 if (ancestry==0 & male==0 & gsib==0), mv(bmi_w1) iv(pgsbmi) cv(PC1 PC2 PC3 PC4 PC5 PC6 PC7 PC8 PC9 PC10) 
log close 



************************************************************************
*           		           **1/23/19**
*			Binomial distributions of gaining and loss behaviors  
*
************************************************************************
*****Binomial distribution

histogram weightgainbehav3cont if (ancestry==0 & gsib==0 & male==0)
graph export `Results'/Binomial_weightgainbehav3cont_female.png, replace 
histogram weightgainbehav3cont if (ancestry==0 & gsib==0 & male==1)
graph export `Results'/Binomial_weightgainbehav3cont_male.png, replace 

histogram wtlossbehav3cont if (ancestry==0 & gsib==0 & male==0)
graph export `Results'/Binomial_wtlossbehav3cont_female.png, replace 
histogram wtlossbehav3cont if (ancestry==0 & gsib==0 & male==1)
graph export `Results'/Binomial_wtlossbehav3cont_male.png, replace 


log using `Results'/AH_WeightLossBehav_Supplemental_012319.txt, replace text
************************************************************************
*           		           **1/23/19**
*			Association between BMI PGS and BMI at Wave 3 
*
************************************************************************

***Association between BMI PGS and BMI at Wave 3****
regress bmi_bio_w3 pgsbmi if (ancestry==0 & male==1 & gsib==0)
regress bmi_bio_w3 pgsbmi if (ancestry==0 & male==0 & gsib==0)

regress bmi_bio_w3 pgsbmi PC1 PC2 PC3 PC4 PC5 PC6 PC7 PC8 PC9 PC10 if (ancestry==0 & male==1 & gsib==0)
regress bmi_bio_w3 pgsbmi PC1 PC2 PC3 PC4 PC5 PC6 PC7 PC8 PC9 PC10 if (ancestry==0 & male==0 & gsib==0)
log close 
