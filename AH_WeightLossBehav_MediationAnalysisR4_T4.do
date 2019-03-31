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

log using `Results'/AH_WeightLossBehav_R4_Mediation_T4.txt, replace text
*****             Mediation analysis  - wt loss - Table 4            ****

********   R2=0.1, window of 250 kb, 10 PCs, p<1.0   **********
bootstrap r(ind_eff) r(dir_eff), reps(1000): sgmediation wtlossbehav3 if (ancestry==0 & male==1 & gsib==0), mv(bmi_bio_w3) iv(pgsbmi) cv(PC1 PC2 PC3 PC4 PC5 PC6 PC7 PC8 PC9 PC10) 
bootstrap r(ind_eff) r(dir_eff), reps(1000): sgmediation wtlossbehav3 if (ancestry==0 & male==0 & gsib==0), mv(bmi_bio_w3) iv(pgsbmi) cv(PC1 PC2 PC3 PC4 PC5 PC6 PC7 PC8 PC9 PC10) 


******* Sensitivity Analyses ************

*** model 1: clumping at r2 cutoff 0.1, 250 kb window, 10 PCs, p<0.1 ****
bootstrap r(ind_eff) r(dir_eff), reps(1000): sgmediation wtlossbehav3 if (ancestry==0 & male==1 & gsib==0), mv(bmi_bio_w3) iv(pgsbmi_std_01) cv(PC1 PC2 PC3 PC4 PC5 PC6 PC7 PC8 PC9 PC10) 
bootstrap r(ind_eff) r(dir_eff), reps(1000): sgmediation wtlossbehav3 if (ancestry==0 & male==0 & gsib==0), mv(bmi_bio_w3) iv(pgsbmi_std_01) cv(PC1 PC2 PC3 PC4 PC5 PC6 PC7 PC8 PC9 PC10) 


*** model 2: clumping at r2 cutoff 0.1, 250 kb window, 10 PCs, p<0.01 *****
bootstrap r(ind_eff) r(dir_eff), reps(1000): sgmediation wtlossbehav3 if (ancestry==0 & male==1 & gsib==0), mv(bmi_bio_w3) iv(pgsbmi_std_001) cv(PC1 PC2 PC3 PC4 PC5 PC6 PC7 PC8 PC9 PC10) 
bootstrap r(ind_eff) r(dir_eff), reps(1000): sgmediation wtlossbehav3 if (ancestry==0 & male==0 & gsib==0), mv(bmi_bio_w3) iv(pgsbmi_std_001) cv(PC1 PC2 PC3 PC4 PC5 PC6 PC7 PC8 PC9 PC10) 


*** model 3: clumping at r2 cutoff 0.1, 250 kb window, 10 PCs, p<0.001 *****
bootstrap r(ind_eff) r(dir_eff), reps(1000): sgmediation wtlossbehav3 if (ancestry==0 & male==1 & gsib==0), mv(bmi_bio_w3) iv(pgsbmi_std_0001) cv(PC1 PC2 PC3 PC4 PC5 PC6 PC7 PC8 PC9 PC10) 
bootstrap r(ind_eff) r(dir_eff), reps(1000): sgmediation wtlossbehav3 if (ancestry==0 & male==0 & gsib==0), mv(bmi_bio_w3) iv(pgsbmi_std_0001) cv(PC1 PC2 PC3 PC4 PC5 PC6 PC7 PC8 PC9 PC10) 


*** model 4: clumping at r2 cutoff 0.1, 250 kb window, 10 PCs, p<0.1 excluding participants with eating disorders ****
bootstrap r(ind_eff) r(dir_eff), reps(1000): sgmediation wtlossbehav3 if (ancestry==0 & male==1 & gsib==0 & EDDx==0), mv(bmi_bio_w3) iv(pgsbmi_std_01) cv(PC1 PC2 PC3 PC4 PC5 PC6 PC7 PC8 PC9 PC10) 
bootstrap r(ind_eff) r(dir_eff), reps(1000): sgmediation wtlossbehav3 if (ancestry==0 & male==0 & gsib==0 & EDDx==0), mv(bmi_bio_w3) iv(pgsbmi_std_01) cv(PC1 PC2 PC3 PC4 PC5 PC6 PC7 PC8 PC9 PC10) 


*** model 5: clumping at r2 cutoff 0.1, 250 kb window, 10 PCs, p<1.0 with BMI Wave 1 as mediator ****
bootstrap r(ind_eff) r(dir_eff), reps(1000): sgmediation wtlossbehav3 if (ancestry==0 & male==1 & gsib==0), mv(bmi_w1) iv(pgsbmi) cv(PC1 PC2 PC3 PC4 PC5 PC6 PC7 PC8 PC9 PC10) 
bootstrap r(ind_eff) r(dir_eff), reps(1000): sgmediation wtlossbehav3 if (ancestry==0 & male==0 & gsib==0), mv(bmi_w1) iv(pgsbmi) cv(PC1 PC2 PC3 PC4 PC5 PC6 PC7 PC8 PC9 PC10) 


*** model 6: clumping at r2 cutoff 0.1, 250 kb window, 10 PCs, p<1.0 with BMI change as mediator
bootstrap r(ind_eff) r(dir_eff), reps(1000): sgmediation wtlossbehav3 if (ancestry==0 & male==1 & gsib==0), mv(bmichange_w1w3) iv(pgsbmi) cv(PC1 PC2 PC3 PC4 PC5 PC6 PC7 PC8 PC9 PC10) 
bootstrap r(ind_eff) r(dir_eff), reps(1000): sgmediation wtlossbehav3 if (ancestry==0 & male==0 & gsib==0), mv(bmichange_w1w3) iv(pgsbmi) cv(PC1 PC2 PC3 PC4 PC5 PC6 PC7 PC8 PC9 PC10) 


*** model 7: clumping at r2 cutoff 0.1, 250 kb window, 5 PCs, p<1.0
bootstrap r(ind_eff) r(dir_eff), reps(1000): sgmediation wtlossbehav3 if (ancestry==0 & male==1 & gsib==0), mv(bmi_bio_w3) iv(pgsbmi) cv(PC1 PC2 PC3 PC4 PC5) 
bootstrap r(ind_eff) r(dir_eff), reps(1000): sgmediation wtlossbehav3 if (ancestry==0 & male==0 & gsib==0), mv(bmi_bio_w3) iv(pgsbmi) cv(PC1 PC2 PC3 PC4 PC5) 


*** model 8: clumping at r2 cutoff 0.1, 250 kb window, 15 PCs, p<1.0 
bootstrap r(ind_eff) r(dir_eff), reps(1000): sgmediation wtlossbehav3 if (ancestry==0 & male==1 & gsib==0), mv(bmi_bio_w3) iv(pgsbmi) cv(PC1 PC2 PC3 PC4 PC5 PC6 PC7 PC8 PC9 PC10 PC11 PC12 PC13 PC14 PC15) 
bootstrap r(ind_eff) r(dir_eff), reps(1000): sgmediation wtlossbehav3 if (ancestry==0 & male==0 & gsib==0), mv(bmi_bio_w3) iv(pgsbmi) cv(PC1 PC2 PC3 PC4 PC5 PC6 PC7 PC8 PC9 PC10 PC11 PC12 PC13 PC14 PC15) 


*** model 9: clumping at r2 cutoff 0.1, 250 kb window, 20 PCs, p<1.0
bootstrap r(ind_eff) r(dir_eff), reps(1000): sgmediation wtlossbehav3 if (ancestry==0 & male==1 & gsib==0), mv(bmi_bio_w3) iv(pgsbmi) cv(PC1 PC2 PC3 PC4 PC5 PC6 PC7 PC8 PC9 PC10 PC11 PC12 PC13 PC14 PC15 PC16 PC17 PC18 PC19 PC20) 
bootstrap r(ind_eff) r(dir_eff), reps(1000): sgmediation wtlossbehav3 if (ancestry==0 & male==0 & gsib==0), mv(bmi_bio_w3) iv(pgsbmi) cv(PC1 PC2 PC3 PC4 PC5 PC6 PC7 PC8 PC9 PC10 PC11 PC12 PC13 PC14 PC15 PC16 PC17 PC18 PC19 PC20) 


*** model 10: clumping at r2 cutoff 0.1, 250 kb window, 10 PCs, p<1.0 with school clustering
bootstrap r(ind_eff) r(dir_eff), reps(1000): sgmediation wtlossbehav3 if (ancestry==0 & male==1 & gsib==0), mv(bmi_bio_w3) iv(pgsbmi) cv(PC1 PC2 PC3 PC4 PC5 PC6 PC7 PC8 PC9 PC10 psuscid) 
bootstrap r(ind_eff) r(dir_eff), reps(1000): sgmediation wtlossbehav3 if (ancestry==0 & male==0 & gsib==0), mv(bmi_bio_w3) iv(pgsbmi) cv(PC1 PC2 PC3 PC4 PC5 PC6 PC7 PC8 PC9 PC10 psuscid) 
log close 
