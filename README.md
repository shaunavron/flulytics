<!-- README.md is generated from README.Rmd. Please edit that file -->

# Flulytics

Load and visualize data of reported influenza cases, and influenza
immunizations in Canada.

<!-- badges: start -->
<!-- https://www.codefactor.io/repository/github/shaunamia/flulytics/issues -->

[![CodeFactor](https://www.codefactor.io/repository/github/shaunamia/flulytics/badge)](https://www.codefactor.io/repository/github/shaunamia/flulytics)
[![GitHub
issues](https://img.shields.io/github/issues/shaunamia/flulytics)](https://github.com/shaunamia/flulytics/issues)
[![License](https://img.shields.io/badge/license-MIT-green)](./LICENSE)
![GitHub language
count](https://img.shields.io/github/languages/count/shaunamia/flulytics)
![GitHub commit activity
(branch)](https://img.shields.io/github/commit-activity/y/shaunamia/flulytics/master)
<!-- https://shields.io/category/license --> <!-- badges: end -->

## Description

Flulytics is an R package that allows you to load and visualize data of
reported influenza cases, and influenza immunizations in Canada. This
package contains functions that allows you to view the raw data,
generate customizable bar plots, and search ncbi databases for the id’s
of records for each influenza strain in the data.

## Installation

To install the latest version of the package:

``` r
require("devtools")
install_github("shaunamia/flulytics", build_vignettes = TRUE)
library("Flulytics")
```

## Overview

`Flulytics` contains 4 functions.

For viewing the raw data provided in this package:
***view_data_table***.

For carrying out a NCBI search for record id’s based on user-set
parameters: ***ncbi_search***.

The shiny implementation of *ncbi_search*: ***runFlulytics***.

For generating plots of provided data with user-set parameters:
***plot_data***.

<div style="text-align:center">

<img src="inst/extdata/inf_imm_can.png" 
alt="ImmPlot" width="750" height="550"/>

Figure: Example output from ***plot_data***, showing Immunization data
for Canada in 2020.

<div style="text-align:center">

<img src="inst/extdata/inf_cases_year.png" 
alt="InfCasesYear" width="750" height="550"/>

Figure: Example output from ***plot_data***, showing confirmed influenza
cases by strain in Canada 2022.

<div style="text-align:center">

<img src="inst/extdata/infl_comp_week.png" 
alt="InfCasesWeek" width="750" height="550"/>

Figure: Example output from ***plot_data***, showing confirmed influenza
cases by strain, and comparing the case counts for a given week in 2021
vs. 2022.

<div style="text-align:center">

<img src="inst/extdata/inf_activity_week.png" 
alt="InfActWeek" width="750" height="550"/>

Figure: Example output from ***plot_data***, showing influenza activity
by strain for a given week.

<div style="text-align:center">

<img src="inst/extdata/inf_activity_region.png" 
alt="InfActRegion" width="750" height="550"/>

Figure: Example output from ***plot_data***, showing influenza activity
by strain for a given region over all weeks.

<div style="text-align:left">
<div style="text-align:left">

To list all functions available in the package:

``` r
ls("package:Flulytics")
```

To run the Shiny app:

``` r
flulytics::runFlulytics()
```

<div style="text-align:center">

<img src="inst/extdata/ShinyApp.png" 
alt="ShinyApp" width="750" height="550"/>

Figure: Shiny app for Flulytics package allowing users to easily search
NCBI databases for record ids for the strains in the data made available
in this package and sample output in console.

<div style="text-align:left">
<div style="text-align:left">


## Details

<div style="text-align:left">

<img src="inst/extdata/MixtureGaussian.png" alt="MixtureGaussian" width="500" height="900"/>

<div style="text-align:left">
<div style="text-align:left">

For more details, see vignette.

## `Flulytics` Specifics

…

## Tutorials

For tutorials and plot interpretation, refer to the vignette:

``` r
browseVignettes("Flulytics")
```

## Citation for Package

``` r
citation("Flulytics")
```

## References for Package

\*Public Health Agency of Canada. Influenza activity for Canada 2022
(<https://ftp.maps.canada.ca/pub/phac_aspc/Influenza_Grippe/Influenza_Download_files/FGP_Influenza_activity_map.xlsx>)

- FluNet. Influenza data for Canada 2021-2022.
  (<https://www.who.int/tools/flunet>)

- Statistics Canada. Table 13-10-0096-25 Influenza immunization in the
  past 12 months, by age group DOI:
  <https://doi.org/10.25318/1310009601-eng>

- 

## Maintainer

- Shauna Vronces (<shauna.vronces@mail.utoronto.ca>).

## Contributions

`Flulytics` welcomes issues, enhancement requests, and other
contributions. To submit an issue, use the [GitHub
issues](https://github.com/shaunamia/flulytics/issues).
=======
# flulytics
Flulytics is an R package that allows you to load and visualize data of reported influenza cases, and influenza immunizations in Canada. This package contains functions that allows you to view the raw data, generate customizable bar plots, and search ncbi databases for the id's of records for each influenza strain in the data.
>>>>>>> bf2b56ced938f38d3a1f2865de17e945244d497d
