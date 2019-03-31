/*
This file performs the analyses for the project investigating the associations 
b/w weight loss behaviors and a PGS for BMI co-authored with Jason Nagata 
and Ben Domingue 

Last modified on: 3/25/19
Last modified by: David B. Braudt 

Notes: 

*/
clear all 

local Clean_data = "/ifs/sec/cpc/addhealth/users/dbraudt/Keep/WeightLossBehaviors/Data/AH_WeightLossBehav_Clean.dta"
local Results = "/ifs/sec/cpc/addhealth/users/dbraudt/Keep/WeightLossBehaviors/Results/R4"

use `Clean_data'




log using `Results'/AH_WeightLossBehav_R4_Main_T2.txt, replace text
*****             Main analysis  - Table 2            ****
/* 
All PGSs in this section are based on a window of250 kb and an r2 of 0.1 for 
LD climping. The names of the PGSs are as follows: 

The PGSs are as follows 
aid pgsbmi_std_0001 pgsbmi_std_001 pgsbmi_std_01 pgsbmi_std_1

*/


********   R2=0.1, window of 250 kb, 10 PCs, p<1.0   **********

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



******* Sensitivity Analyses ************

*** model 1: clumping at r2 cutoff 0.1, 250 kb window, 10 PCs, p<0.1 ****

logistic WeightlossgoalW3 pgsbmi_std_01 PC1 PC2 PC3 PC4 PC5 PC6 PC7 PC8 PC9 PC10 if (ancestry==0 & male==1 & gsib==0) 
logistic wtlossbehav3 pgsbmi_std_01 PC1 PC2 PC3 PC4 PC5 PC6 PC7 PC8 PC9 PC10 if (ancestry==0 & male==1 & gsib==0) 

logistic WeightlossgoalW3 pgsbmi_std_01 PC1 PC2 PC3 PC4 PC5 PC6 PC7 PC8 PC9 PC10 if (ancestry==0 & male==0 & gsib==0) 
logistic wtlossbehav3 pgsbmi_std_01 PC1 PC2 PC3 PC4 PC5 PC6 PC7 PC8 PC9 PC10 if (ancestry==0 & male==0 & gsib==0) 

*****Adjusted for BMI******

logistic WeightlossgoalW3 pgsbmi_std_01 bmi_bio_w3 PC1 PC2 PC3 PC4 PC5 PC6 PC7 PC8 PC9 PC10 if (ancestry==0 & male==1 & gsib==0) 
logistic wtlossbehav3 pgsbmi_std_01 bmi_bio_w3 PC1 PC2 PC3 PC4 PC5 PC6 PC7 PC8 PC9 PC10 if (ancestry==0 & male==1 & gsib==0) 

logistic WeightlossgoalW3 pgsbmi_std_01 bmi_bio_w3 PC1 PC2 PC3 PC4 PC5 PC6 PC7 PC8 PC9 PC10 if (ancestry==0 & male==0 & gsib==0) 
logistic wtlossbehav3 pgsbmi_std_01 bmi_bio_w3 PC1 PC2 PC3 PC4 PC5 PC6 PC7 PC8 PC9 PC10 if (ancestry==0 & male==0 & gsib==0) 

*** model 2: clumping at r2 cutoff 0.1, 250 kb window, 10 PCs, p<0.01 *****

logistic WeightlossgoalW3 pgsbmi_std_001 PC1 PC2 PC3 PC4 PC5 PC6 PC7 PC8 PC9 PC10 if (ancestry==0 & male==1 & gsib==0) 
logistic wtlossbehav3 pgsbmi_std_001 PC1 PC2 PC3 PC4 PC5 PC6 PC7 PC8 PC9 PC10 if (ancestry==0 & male==1 & gsib==0) 

logistic WeightlossgoalW3 pgsbmi_std_001 PC1 PC2 PC3 PC4 PC5 PC6 PC7 PC8 PC9 PC10 if (ancestry==0 & male==0 & gsib==0) 
logistic wtlossbehav3 pgsbmi_std_001 PC1 PC2 PC3 PC4 PC5 PC6 PC7 PC8 PC9 PC10 if (ancestry==0 & male==0 & gsib==0) 

*****Adjusted for BMI******

logistic WeightlossgoalW3 pgsbmi_std_001 bmi_bio_w3 PC1 PC2 PC3 PC4 PC5 PC6 PC7 PC8 PC9 PC10 if (ancestry==0 & male==1 & gsib==0) 
logistic wtlossbehav3 pgsbmi_std_001 bmi_bio_w3 PC1 PC2 PC3 PC4 PC5 PC6 PC7 PC8 PC9 PC10 if (ancestry==0 & male==1 & gsib==0) 

logistic WeightlossgoalW3 pgsbmi_std_001 bmi_bio_w3 PC1 PC2 PC3 PC4 PC5 PC6 PC7 PC8 PC9 PC10 if (ancestry==0 & male==0 & gsib==0) 
logistic wtlossbehav3 pgsbmi_std_001 bmi_bio_w3 PC1 PC2 PC3 PC4 PC5 PC6 PC7 PC8 PC9 PC10 if (ancestry==0 & male==0 & gsib==0) 

*** model 3: clumping at r2 cutoff 0.1, 250 kb window, 10 PCs, p<0.001 *****

logistic WeightlossgoalW3 pgsbmi_std_0001 PC1 PC2 PC3 PC4 PC5 PC6 PC7 PC8 PC9 PC10 if (ancestry==0 & male==1 & gsib==0) 
logistic wtlossbehav3 pgsbmi_std_0001 PC1 PC2 PC3 PC4 PC5 PC6 PC7 PC8 PC9 PC10 if (ancestry==0 & male==1 & gsib==0) 

logistic WeightlossgoalW3 pgsbmi_std_0001 PC1 PC2 PC3 PC4 PC5 PC6 PC7 PC8 PC9 PC10 if (ancestry==0 & male==0 & gsib==0) 
logistic wtlossbehav3 pgsbmi_std_0001 PC1 PC2 PC3 PC4 PC5 PC6 PC7 PC8 PC9 PC10 if (ancestry==0 & male==0 & gsib==0) 

*****Adjusted for BMI******

logistic WeightlossgoalW3 pgsbmi_std_0001 bmi_bio_w3 PC1 PC2 PC3 PC4 PC5 PC6 PC7 PC8 PC9 PC10 if (ancestry==0 & male==1 & gsib==0) 
logistic wtlossbehav3 pgsbmi_std_0001 bmi_bio_w3 PC1 PC2 PC3 PC4 PC5 PC6 PC7 PC8 PC9 PC10 if (ancestry==0 & male==1 & gsib==0) 

logistic WeightlossgoalW3 pgsbmi_std_0001 bmi_bio_w3 PC1 PC2 PC3 PC4 PC5 PC6 PC7 PC8 PC9 PC10 if (ancestry==0 & male==0 & gsib==0) 
logistic wtlossbehav3 pgsbmi_std_0001 bmi_bio_w3 PC1 PC2 PC3 PC4 PC5 PC6 PC7 PC8 PC9 PC10 if (ancestry==0 & male==0 & gsib==0) 

*** model 4: clumping at r2 cutoff 0.1, 250 kb window, 10 PCs, p<0.1 excluding participants with eating disorders ****

logistic WeightlossgoalW3 pgsbmi_std_01 PC1 PC2 PC3 PC4 PC5 PC6 PC7 PC8 PC9 PC10 if (ancestry==0 & male==1 & gsib==0 & EDDx==0) 
logistic wtlossbehav3 pgsbmi_std_01 PC1 PC2 PC3 PC4 PC5 PC6 PC7 PC8 PC9 PC10 if (ancestry==0 & male==1 & gsib==0 & EDDx==0) 

logistic WeightlossgoalW3 pgsbmi_std_01 PC1 PC2 PC3 PC4 PC5 PC6 PC7 PC8 PC9 PC10 if (ancestry==0 & male==0 & gsib==0 & EDDx==0) 
logistic wtlossbehav3 pgsbmi_std_01 PC1 PC2 PC3 PC4 PC5 PC6 PC7 PC8 PC9 PC10 if (ancestry==0 & male==0 & gsib==0 & EDDx==0) 

*****Adjusted for BMI******
logistic WeightlossgoalW3 pgsbmi_std_01 bmi_bio_w3 PC1 PC2 PC3 PC4 PC5 PC6 PC7 PC8 PC9 PC10 if (ancestry==0 & male==1 & gsib==0 & EDDx==0) 
logistic wtlossbehav3 pgsbmi_std_01 bmi_bio_w3 PC1 PC2 PC3 PC4 PC5 PC6 PC7 PC8 PC9 PC10 if (ancestry==0 & male==1 & gsib==0 & EDDx==0) 

logistic WeightlossgoalW3 pgsbmi_std_01 bmi_bio_w3 PC1 PC2 PC3 PC4 PC5 PC6 PC7 PC8 PC9 PC10 if (ancestry==0 & male==0 & gsib==0 & EDDx==0) 
logistic wtlossbehav3 pgsbmi_std_01 bmi_bio_w3 PC1 PC2 PC3 PC4 PC5 PC6 PC7 PC8 PC9 PC10 if (ancestry==0 & male==0 & gsib==0 & EDDx==0) 


*** model 5: clumping at r2 cutoff 0.1, 250 kb window, 10 PCs, p<1.0 with BMI Wave 1 as mediator ****

logistic WeightlossgoalW3 pgsbmi PC1 PC2 PC3 PC4 PC5 PC6 PC7 PC8 PC9 PC10 if (ancestry==0 & male==1 & gsib==0) 
logistic wtlossbehav3 pgsbmi PC1 PC2 PC3 PC4 PC5 PC6 PC7 PC8 PC9 PC10 if (ancestry==0 & male==1 & gsib==0) 

logistic WeightlossgoalW3 pgsbmi PC1 PC2 PC3 PC4 PC5 PC6 PC7 PC8 PC9 PC10 if (ancestry==0 & male==0 & gsib==0) 
logistic wtlossbehav3 pgsbmi PC1 PC2 PC3 PC4 PC5 PC6 PC7 PC8 PC9 PC10 if (ancestry==0 & male==0 & gsib==0) 

*****Adjusted for BMI******

logistic WeightlossgoalW3 pgsbmi bmi_w1 PC1 PC2 PC3 PC4 PC5 PC6 PC7 PC8 PC9 PC10 if (ancestry==0 & male==1 & gsib==0) 
logistic wtlossbehav3 pgsbmi bmi_w1 PC1 PC2 PC3 PC4 PC5 PC6 PC7 PC8 PC9 PC10 if (ancestry==0 & male==1 & gsib==0) 

logistic WeightlossgoalW3 pgsbmi bmi_w1 PC1 PC2 PC3 PC4 PC5 PC6 PC7 PC8 PC9 PC10 if (ancestry==0 & male==0 & gsib==0) 
logistic wtlossbehav3 pgsbmi bmi_w1 PC1 PC2 PC3 PC4 PC5 PC6 PC7 PC8 PC9 PC10 if (ancestry==0 & male==0 & gsib==0) 


*** model 6: clumping at r2 cutoff 0.1, 250 kb window, 10 PCs, p<1.0 with BMI change as mediator


logistic WeightlossgoalW3 pgsbmi PC1 PC2 PC3 PC4 PC5 PC6 PC7 PC8 PC9 PC10 if (ancestry==0 & male==1 & gsib==0) 
logistic wtlossbehav3 pgsbmi PC1 PC2 PC3 PC4 PC5 PC6 PC7 PC8 PC9 PC10 if (ancestry==0 & male==1 & gsib==0) 

logistic WeightlossgoalW3 pgsbmi PC1 PC2 PC3 PC4 PC5 PC6 PC7 PC8 PC9 PC10 if (ancestry==0 & male==0 & gsib==0) 
logistic wtlossbehav3 pgsbmi PC1 PC2 PC3 PC4 PC5 PC6 PC7 PC8 PC9 PC10 if (ancestry==0 & male==0 & gsib==0) 

*****Adjusted for BMI******

logistic WeightlossgoalW3 pgsbmi bmichange_w1w3 PC1 PC2 PC3 PC4 PC5 PC6 PC7 PC8 PC9 PC10 if (ancestry==0 & male==1 & gsib==0) 
logistic wtlossbehav3 pgsbmi bmichange_w1w3 PC1 PC2 PC3 PC4 PC5 PC6 PC7 PC8 PC9 PC10 if (ancestry==0 & male==1 & gsib==0) 

logistic WeightlossgoalW3 pgsbmi bmichange_w1w3 PC1 PC2 PC3 PC4 PC5 PC6 PC7 PC8 PC9 PC10 if (ancestry==0 & male==0 & gsib==0) 
logistic wtlossbehav3 pgsbmi bmichange_w1w3 PC1 PC2 PC3 PC4 PC5 PC6 PC7 PC8 PC9 PC10 if (ancestry==0 & male==0 & gsib==0) 

*** model 7: clumping at r2 cutoff 0.1, 250 kb window, 5 PCs, p<1.0

logistic WeightlossgoalW3 pgsbmi PC1 PC2 PC3 PC4 PC5 if (ancestry==0 & male==1 & gsib==0) 
logistic wtlossbehav3 pgsbmi PC1 PC2 PC3 PC4 PC5 if (ancestry==0 & male==1 & gsib==0) 

logistic WeightlossgoalW3 pgsbmi PC1 PC2 PC3 PC4 PC5 if (ancestry==0 & male==0 & gsib==0) 
logistic wtlossbehav3 pgsbmi PC1 PC2 PC3 PC4 PC5 if (ancestry==0 & male==0 & gsib==0) 

*****Adjusted for BMI******

logistic WeightlossgoalW3 pgsbmi bmi_bio_w3 PC1 PC2 PC3 PC4 PC5 if (ancestry==0 & male==1 & gsib==0) 
logistic wtlossbehav3 pgsbmi bmi_bio_w3 PC1 PC2 PC3 PC4 PC5 if (ancestry==0 & male==1 & gsib==0) 

logistic WeightlossgoalW3 pgsbmi bmi_bio_w3 PC1 PC2 PC3 PC4 PC5 if (ancestry==0 & male==0 & gsib==0) 
logistic wtlossbehav3 pgsbmi bmi_bio_w3 PC1 PC2 PC3 PC4 PC5 if (ancestry==0 & male==0 & gsib==0) 

*** model 8: clumping at r2 cutoff 0.1, 250 kb window, 15 PCs, p<1.0 

logistic WeightlossgoalW3 pgsbmi PC1 PC2 PC3 PC4 PC5 PC6 PC7 PC8 PC9 PC10 PC11 PC12 PC13 PC14 PC15 if (ancestry==0 & male==1 & gsib==0) 
logistic wtlossbehav3 pgsbmi PC1 PC2 PC3 PC4 PC5 PC6 PC7 PC8 PC9 PC10 PC11 PC12 PC13 PC14 PC15  if (ancestry==0 & male==1 & gsib==0) 

logistic WeightlossgoalW3 pgsbmi PC1 PC2 PC3 PC4 PC5 PC6 PC7 PC8 PC9 PC10 PC11 PC12 PC13 PC14 PC15  if (ancestry==0 & male==0 & gsib==0) 
logistic wtlossbehav3 pgsbmi PC1 PC2 PC3 PC4 PC5 PC6 PC7 PC8 PC9 PC10 PC11 PC12 PC13 PC14 PC15  if (ancestry==0 & male==0 & gsib==0) 

*****Adjusted for BMI******

logistic WeightlossgoalW3 pgsbmi bmi_bio_w3 PC1 PC2 PC3 PC4 PC5 PC6 PC7 PC8 PC9 PC10 PC11 PC12 PC13 PC14 PC15  if (ancestry==0 & male==1 & gsib==0) 
logistic wtlossbehav3 pgsbmi bmi_bio_w3 PC1 PC2 PC3 PC4 PC5 PC6 PC7 PC8 PC9 PC10 PC11 PC12 PC13 PC14 PC15  if (ancestry==0 & male==1 & gsib==0) 

logistic WeightlossgoalW3 pgsbmi bmi_bio_w3 PC1 PC2 PC3 PC4 PC5 PC6 PC7 PC8 PC9 PC10 PC11 PC12 PC13 PC14 PC15  if (ancestry==0 & male==0 & gsib==0) 
logistic wtlossbehav3 pgsbmi bmi_bio_w3 PC1 PC2 PC3 PC4 PC5 PC6 PC7 PC8 PC9 PC10 PC11 PC12 PC13 PC14 PC15  if (ancestry==0 & male==0 & gsib==0) 

*** model 9: clumping at r2 cutoff 0.1, 250 kb window, 20 PCs, p<1.0

logistic WeightlossgoalW3 pgsbmi PC1 PC2 PC3 PC4 PC5 PC6 PC7 PC8 PC9 PC10 PC11 PC12 PC13 PC14 PC15 PC16 PC17 PC18 PC19 PC20 if (ancestry==0 & male==1 & gsib==0) 
logistic wtlossbehav3 pgsbmi PC1 PC2 PC3 PC4 PC5 PC6 PC7 PC8 PC9 PC10 PC11 PC12 PC13 PC14 PC15 PC16 PC17 PC18 PC19 PC20 if (ancestry==0 & male==1 & gsib==0) 

logistic WeightlossgoalW3 pgsbmi PC1 PC2 PC3 PC4 PC5 PC6 PC7 PC8 PC9 PC10 PC11 PC12 PC13 PC14 PC15 PC16 PC17 PC18 PC19 PC20 if (ancestry==0 & male==0 & gsib==0) 
logistic wtlossbehav3 pgsbmi PC1 PC2 PC3 PC4 PC5 PC6 PC7 PC8 PC9 PC10 PC11 PC12 PC13 PC14 PC15 PC16 PC17 PC18 PC19 PC20 if (ancestry==0 & male==0 & gsib==0) 

*****Adjusted for BMI******

logistic WeightlossgoalW3 pgsbmi bmi_bio_w3 PC1 PC2 PC3 PC4 PC5 PC6 PC7 PC8 PC9 PC10 PC11 PC12 PC13 PC14 PC15 PC16 PC17 PC18 PC19 PC20 if (ancestry==0 & male==1 & gsib==0) 
logistic wtlossbehav3 pgsbmi bmi_bio_w3 PC1 PC2 PC3 PC4 PC5 PC6 PC7 PC8 PC9 PC10 PC11 PC12 PC13 PC14 PC15 PC16 PC17 PC18 PC19 PC20 if (ancestry==0 & male==1 & gsib==0) 

logistic WeightlossgoalW3 pgsbmi bmi_bio_w3 PC1 PC2 PC3 PC4 PC5 PC6 PC7 PC8 PC9 PC10 PC11 PC12 PC13 PC14 PC15 PC16 PC17 PC18 PC19 PC20 if (ancestry==0 & male==0 & gsib==0) 
logistic wtlossbehav3 pgsbmi bmi_bio_w3 PC1 PC2 PC3 PC4 PC5 PC6 PC7 PC8 PC9 PC10 PC11 PC12 PC13 PC14 PC15 PC16 PC17 PC18 PC19 PC20 if (ancestry==0 & male==0 & gsib==0) 


*** model 10: clumping at r2 cutoff 0.1, 250 kb window, 10 PCs, p<1.0 with school clustering

logistic WeightlossgoalW3 pgsbmi PC1 PC2 PC3 PC4 PC5 PC6 PC7 PC8 PC9 PC10 psuscid if (ancestry==0 & male==1 & gsib==0) 
logistic wtlossbehav3 pgsbmi PC1 PC2 PC3 PC4 PC5 PC6 PC7 PC8 PC9 PC10 psuscid if (ancestry==0 & male==1 & gsib==0) 

logistic WeightlossgoalW3 pgsbmi PC1 PC2 PC3 PC4 PC5 PC6 PC7 PC8 PC9 PC10 psuscid if (ancestry==0 & male==0 & gsib==0) 
logistic wtlossbehav3 pgsbmi PC1 PC2 PC3 PC4 PC5 PC6 PC7 PC8 PC9 PC10 psuscid if (ancestry==0 & male==0 & gsib==0) 

*****Adjusted for BMI******
logistic WeightlossgoalW3 pgsbmi bmi_bio_w3 PC1 PC2 PC3 PC4 PC5 PC6 PC7 PC8 PC9 PC10 psuscid if (ancestry==0 & male==1 & gsib==0) 
logistic wtlossbehav3 pgsbmi bmi_bio_w3 PC1 PC2 PC3 PC4 PC5 PC6 PC7 PC8 PC9 PC10 psuscid if (ancestry==0 & male==1 & gsib==0) 

logistic WeightlossgoalW3 pgsbmi bmi_bio_w3 PC1 PC2 PC3 PC4 PC5 PC6 PC7 PC8 PC9 PC10 psuscid if (ancestry==0 & male==0 & gsib==0) 
logistic wtlossbehav3 pgsbmi bmi_bio_w3 PC1 PC2 PC3 PC4 PC5 PC6 PC7 PC8 PC9 PC10 psuscid if (ancestry==0 & male==0 & gsib==0) 

*** model 11: clumping at r2 cutoff 0.1, 250 kb window, 10 PCs, p<1.0 negative binomial

nbreg wtgainbehav3cont pgsbmi PC1 PC2 PC3 PC4 PC5 PC6 PC7 PC8 PC9 PC10 if (ancestry==0 & male==1 & gsib==0) 
nbreg wtgainbehav3cont pgsbmi PC1 PC2 PC3 PC4 PC5 PC6 PC7 PC8 PC9 PC10 if (ancestry==0 & male==0 & gsib==0) 

*****Adjusted for BMI******
nbreg wtgainbehav3cont pgsbmi bmi_bio_w3 PC1 PC2 PC3 PC4 PC5 PC6 PC7 PC8 PC9 PC10 if (ancestry==0 & male==1 & gsib==0)  
nbreg wtgainbehav3cont pgsbmi bmi_bio_w3 PC1 PC2 PC3 PC4 PC5 PC6 PC7 PC8 PC9 PC10 if (ancestry==0 & male==0 & gsib==0) 
log close 
