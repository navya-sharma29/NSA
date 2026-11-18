
clear all
set more off

tempfile combined
local first = 1

foreach dataset in emergency ambulance {

    if "`dataset'" == "emergency" {
        import delimited "data/Federal IDR PUF for 2025 Q2 - OON Emergency & Non-Emergency (As of January 21, 2026).csv", clear varnames(1)
    }

    else {
        import delimited "data/Federal IDR PUF for 2025 Q2 - OON Air Ambulance (As of January 21, 2026).csv", clear varnames(1)
    }

    count if missing(providerfacilityname)
    count if lower(trim(providerfacilityname)) == "unreported"
    count if missing(providerfacilitynpinumber)
    count if missing(healthplanissuername)
    count if lower(trim(healthplanissuername)) == "unreported"

    keep providerfacilitynpinumber providerfacilityname healthplanissuername disputenumber dlinumber

    gen str2045 plan_name = healthplanissuername
    drop healthplanissuername
    rename plan_name healthplanissuername

    if `first' == 1 {
        save `combined', replace
        local first = 0
    }

    else {
        append using `combined'
        save `combined', replace
    }
}

use `combined', clear

save "tasks/import-2025q2/output/processed-data.dta", replace
