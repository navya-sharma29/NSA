
clear all
set more off

tempfile emergency_ids ambulance_ids

* Part 1: Import Emergency and Non-Emergency data

import delimited "data/Federal IDR PUF for 2025 Q2 - OON Emergency & Non-Emergency (As of January 21, 2026).csv", clear varnames(1)

count if missing(providerfacilityname)
count if lower(trim(providerfacilityname)) == "unreported"
count if missing(providerfacilitynpinumber)
count if missing(healthplanissuername)
count if lower(trim(healthplanissuername)) == "unreported"

keep providerfacilitynpinumber providerfacilityname healthplanissuername disputenumber dlinumber

gen str2045 plan_name = healthplanissuername
drop healthplanissuername
rename plan_name healthplanissuername

save `emergency_ids'

* Part 2: Import Air Ambulance data

clear
import delimited "data/Federal IDR PUF for 2025 Q2 - OON Air Ambulance (As of January 21, 2026).csv", clear varnames(1)

count if missing(providerfacilityname)
count if lower(trim(providerfacilityname)) == "unreported"
count if missing(providerfacilitynpinumber)
count if missing(healthplanissuername)
count if lower(trim(healthplanissuername)) == "unreported"

keep providerfacilitynpinumber providerfacilityname healthplanissuername disputenumber dlinumber

gen str2045 plan_name = healthplanissuername
drop healthplanissuername
rename plan_name healthplanissuername

save `ambulance_ids'

* Part 3: Combine both OON datasets

use `emergency_ids', clear
append using `ambulance_ids'

count

* Part 4: Count unique providers

sort providerfacilitynpinumber
by providerfacilitynpinumber: gen provider_tag = (_n == 1) if !missing(providerfacilitynpinumber)
count if provider_tag == 1

* Part 5: Count unique health plans

sort healthplanissuername
by healthplanissuername: gen plan_tag = (_n == 1) if trim(healthplanissuername) != "" & lower(trim(healthplanissuername)) != "unreported"
count if plan_tag == 1

* Part 6: Count unique disputes

sort disputenumber
by disputenumber: gen dispute_tag = (_n == 1) if !missing(disputenumber)
count if dispute_tag == 1

* Part 7: Count unique dispute line items

sort dlinumber
by dlinumber: gen item_tag = (_n == 1) if !missing(dlinumber)
count if item_tag == 1




















