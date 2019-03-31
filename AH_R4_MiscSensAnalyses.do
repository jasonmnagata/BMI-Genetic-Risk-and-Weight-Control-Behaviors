clear all 

local Clean_data = "/ifs/sec/cpc/addhealth/users/dbraudt/Keep/WeightLossBehaviors/Data/AH_WeightLossBehav_Clean.dta"
local Results = "/ifs/sec/cpc/addhealth/users/dbraudt/Keep/WeightLossBehaviors/Results/R4"


use `Clean_data'
* Keeping only European Ancestry and genetically unrealted individuals in the sample 
preserve 
keep if (ancestry==0 & gsib==0)


************************************************************************
*
*						Creating quantile variables 
*
************************************************************************
local plotvars = "bmi_bio_w3 WeightlossgoalW3 wtlossbehav3 WeightgaingoalW3 wtgainbehav3"


*** Residualize the PGS on the covarites 
regress pgsbmi age_w3 male PC1 PC2 PC3 PC4 PC5 PC6 PC7 PC8 PC9 PC10   
predict rpgsbmi, residuals

*** Distribute the samnple in to quantiles of the PGS and creating dummy variables for each quantile 
xtile rpgs_q10 = rpgsbmi, nquantiles(10)
tab rpgs_q10, gen(rpgs_q10_)



************************************************************************
*
*							Quantile Plots 
*
************************************************************************
*** Quantile plots for 10 quantiles 
foreach var of local plotvars {
	reg `var' ib5.rpgs_q10
	margins, over(rpgs_q10)	
	marginsplot , title("`var'") xtitle("Quantiles for Polygenic Score") 
	graph export `Results'/rpgs_q10_`var'.png, replace 
}

restore

*******

log using `Results'/AH_WeightLossBehav_R4_Sup_T1.txt, replace text

regress pgsbmi i.male PC1 PC2 PC3 PC4 PC5 PC6 PC7 PC8 PC9 PC10 if (ancestry==0 & gsib==0)

regress bmi_w1 pgsbmi PC1 PC2 PC3 PC4 PC5 PC6 PC7 PC8 PC9 PC10 if (ancestry==0 & male==1 & gsib==0)
regress bmi_w1 pgsbmi PC1 PC2 PC3 PC4 PC5 PC6 PC7 PC8 PC9 PC10 if (ancestry==0 & male==0 & gsib==0)


regress bmi_bio_w3 pgsbmi PC1 PC2 PC3 PC4 PC5 PC6 PC7 PC8 PC9 PC10 if (ancestry==0 & male==1 & gsib==0)
regress bmi_bio_w3 pgsbmi PC1 PC2 PC3 PC4 PC5 PC6 PC7 PC8 PC9 PC10 if (ancestry==0 & male==0 & gsib==0)

log close 
