use "C:\Users\hp\Documents\thesis\Ghana_2019_MIS_analysis_project\data\women_malaria.dta"

log using "01_w_mal.log",append

//Date: 5th May, 2021 last log "01_w_mal.log"

//check v220 ever married
//gen wgt=v005/100000
//Survey set
svyset v021 [pw=wgt],strata(v023)

//has living children
//gen Living_Children=(v219 != 0)
//label define bi 0 "No" 1 "Yes"
//label values Living_Children bi

//label variable wgt  "Weight"

//women 15-49 heard or seen mal messages s501 over region v024
svy:mean s501, over(v024)

//create new variable allow_mal_vaccine by recode s512 with removing don't know level

drop allow_mal_vaccine
recode s512 (0 8 =0 "No") (1=1 "Yes"), gen (Allow_mal_vaccine)
log close