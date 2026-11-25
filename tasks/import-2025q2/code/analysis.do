
clear all
set more off

use "../output/processed-data.dta", clear

putexcel set "../output/counts.xlsx", replace
putexcel A1=("Measure") B1=("Unique Count")

local row = 2

foreach v in providerfacilitynpinumber healthplanissuername disputenumber dlinumber {

    if "`v'" == "healthplanissuername" {
        egen tag_`v' = tag(`v') if trim(`v') != "" & lower(trim(`v')) != "unreported"
        local label "Health plans/issuers"
    }

    else {
        egen tag_`v' = tag(`v') if !missing(`v')

        if "`v'" == "providerfacilitynpinumber" {
            local label "Providers (unique NPIs)"
        }

        if "`v'" == "disputenumber" {
            local label "Disputes"
        }

        if "`v'" == "dlinumber" {
            local label "Dispute line items"
        }
    }

    count if tag_`v' == 1
    local n = r(N)

    putexcel A`row'=("`label'") B`row'=(`n')

    local row = `row' + 1
}



















