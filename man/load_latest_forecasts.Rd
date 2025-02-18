% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/load_latest_forecasts.R
\name{load_latest_forecasts}
\alias{load_latest_forecasts}
\title{Load covid forecasts from local hub repo or Zoltar.
Return the most recent forecast from each model within
forecast_date_window_size days of the last_forecast_date}
\usage{
load_latest_forecasts(
  models = NULL,
  last_forecast_date,
  forecast_date_window_size = 0,
  locations = NULL,
  types = NULL,
  targets = NULL,
  source = "local_hub_repo",
  hub_repo_path,
  data_processed_subpath = "data-processed/",
  as_of = NULL,
  hub = c("US", "ECDC"),
  verbose = TRUE
)
}
\arguments{
\item{models}{Character vector of model abbreviations.
If missing, forecasts for all models that submitted forecasts
meeting the other criteria are returned.}

\item{last_forecast_date}{The forecast date of forecasts to retrieve
in 'yyyy-mm-dd' format.}

\item{forecast_date_window_size}{The number of days across which to
look for recent forecasts. Default to 0, which means to only look
at the last_forecast_date only.}

\item{locations}{list of fips. Defaults to all locations with available forecasts.}

\item{types}{Character vector specifying type of forecasts to load: “quantile”
or “point”. Defaults to all types  with available forecasts}

\item{targets}{character vector of targets to retrieve, for example
c('1 wk ahead cum death', '2 wk ahead cum death'). Defaults to all targets.}

\item{source}{string specifying where forecasts will be loaded from: either
"local_hub_repo" or "zoltar"}

\item{hub_repo_path}{path to local clone of the reichlab/covid19-forecast-hub
repository}

\item{data_processed_subpath}{folder within the hub_repo_path that contains
forecast submission files.  Defaults to "data-processed/", which is
appropriate for the covid19-forecast-hub repository.}

\item{as_of}{character for date time to load forecasts submitted as of this time from Zoltar.
Ignored if \code{source} is \code{"local_hub_repo"}.
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

\dontrun{


forecasts <- load_latest_forecasts(models = "COVIDhub-ensemble",
 last_forecast_date = "2020-12-07",
 forecast_date_window_size = 6, 
 locations = "US",
 types = c("point","quantile"),
 targets = paste(1:4, "wk ahead inc case"),
 source = "zoltar",
 verbose = FALSE,
 as_of=NULL,
 hub = c("US"))
 
forecasts_ECDC <- load_latest_forecasts(models=c("ILM-EKF"),
 hub = c("ECDC","US"), 
 last_forecast_date = "2021-03-08",
 forecast_date_window_size = 0,
 locations = c("GB"),
 targets = paste(1:4, "wk ahead inc death"),
 source = "zoltar")
 
load_latest_forecasts(models = "Columbia_UNC-SurvCon", 
 last_forecast_date = "2021-01-03", 
 source = 'zoltar',
 as_of = "2021-01-04",
 verbose = FALSE,
 location = 'US')
 
}
}
\description{
Load covid forecasts from local hub repo or Zoltar.
Return the most recent forecast from each model within
forecast_date_window_size days of the last_forecast_date
}
