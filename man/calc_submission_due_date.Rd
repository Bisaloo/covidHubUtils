% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/date_management.R
\name{calc_submission_due_date}
\alias{calc_submission_due_date}
\title{Calculate the submission date that corresponds to a given forecast date}
\usage{
calc_submission_due_date(forecast_date, submission_day = "Monday")
}
\arguments{
\item{forecast_date}{character vector of dates in 'yyyy-mm-dd' format}

\item{submision_day}{day when forecasts have to be submitted. Default is
Monday.}
}
\value{
return character vecor with corresponding submission date
}
\description{
Assuming that submissions are made on Mondays, this helper function
finds the nearest Monday for which a submission could have been made
}
\examples{
calc_submission_due_date(Sys.Date() + 0:7) 
}
