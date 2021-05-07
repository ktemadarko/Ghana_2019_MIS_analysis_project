use "C:\Users\hp\Documents\r_and_git\spatial_anaemia\stata\d6.dta"  

log using "01_child_mal.log",append

//Survey set
svyset v021, strata(v023) weight(wgt)

recode hw57(3 4=0 "No anaemia/ Mild")(1 2  =1 "Moderate/ Severe Anaemia"),gen(anaStatus)

//create new variable anSta recode with moderate-to-severe anaemia (haemoglobin < 8.0 g/dl)
gen anStat=hw56
recode anStat(min/79.99=0 ) (80/max=1)
label define ana_val 0 "Anaemia" 1 " No Anaemia"
label values anStat ana_val