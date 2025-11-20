clear all

global proj "C:\document\SMU PhD\Class\labor\labor market analysis\00_project_template"

cd "$proj"

* 设定子目录
global code      "$proj/code"
global data_r  "$proj/data/raw"
global data_c  "$proj/data/clean"
global data_t  "$proj/data/temp"
global out     "$proj/output"

*---------------------------------------------------------------*

use "$data_r/cps_00002.dta"

***subsample
keep if age>=16 & age <=64 

*Backery retail occupation
tab occ if ind ==1190, sort
*Backery no retail occupation
tab occly if indly ==1270, sort

*keep only baker in backery
keep if (ind ==1190 & occ ==7800)|(ind==1270 & occ == 7800)

save "$data_c/march_baker in backery.dta", replace