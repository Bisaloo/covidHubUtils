% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/load_forecasts_zoltar.R
\name{load_forecasts_zoltar}
\alias{load_forecasts_zoltar}
\title{Load all available forecasts submitted on forecast_dates from Zoltar.}
\usage{
load_forecasts_zoltar(
  models = NULL,
  forecast_dates = NULL,
  locations = NULL,
  types = NULL,
  targets = NULL,
  as_of = NULL,
  hub = c("US", "ECDC"),
  verbose = TRUE
)
}
\arguments{
\item{models}{Character vector of model abbreviations.
Default all models that submitted forecasts meeting the other criteria.}

\item{forecast_dates}{The forecast date of forecasts to retrieve.
Default to all valid forecast dates in Zoltar.
The function will throw an error if all dates in this parameter are invalid forecast dates in Zoltar.}

\item{locations}{list of fips. Default to all locations with available forecasts in Zoltar.}

\item{types}{Character vector specifying type of forecasts to load: “quantile”
or “point”. Default to all valid forecast types in Zoltar.}

\item{targets}{character vector of targets to retrieve, for example
c('1 wk ahead cum death', '2 wk ahead cum death').
Default to all valid targets in Zoltar.}

\item{as_of}{character for date time to load forecasts submitted as of this time.
It could use the format of one of the three examples:
"2021-01-01", "2020-01-01 01:01:01" and "2020-01-01 01:01:01 UTC".
If you would like to set a timezone, it has to be UTC now.
If not, helper function will append the default timezone to your input based on hub parameter.
Default to NULL to load the latest version.}

\item{hub}{character vector, where the first element indicates the hub
from which to load forecasts. Possible options are "US" and "ECDC"}

\item{verbose}{a boolean for printing messages on zoltar job status. Default to TRUE.}
}
\value{
data frame with columns model, forecast_date, location, horizon,
temporal_resolution, target_variable, target_end_date, type, quantile, value,
location_name, population, geo_type, geo_value, abbreviation
}
\description{
The function will throw a warning and return an empty data frame when
no forecasts are submitted on any dates in forecast_dates for selected models,
locations, types and target.
}
