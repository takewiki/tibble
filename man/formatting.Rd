% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/utils-format.r
\name{formatting}
\alias{formatting}
\alias{print.tbl}
\alias{format.tbl}
\alias{trunc_mat}
\title{Printing tibbles}
\usage{
\method{print}{tbl}(x, ..., n = NULL, width = NULL, n_extra = NULL)

\method{format}{tbl}(x, ..., n = NULL, width = NULL, n_extra = NULL)

trunc_mat(x, n = NULL, width = NULL, n_extra = NULL)
}
\arguments{
\item{x}{Object to format or print.}

\item{...}{Other arguments passed on to individual methods.}

\item{n}{Number of rows to show. If \code{NULL}, the default, will print all rows
if less than option \code{tibble.print_max}. Otherwise, will print
\code{tibble.print_min} rows.}

\item{width}{Width of text output to generate. This defaults to \code{NULL}, which
means use \code{getOption("tibble.width")} or (if also \code{NULL})
\code{getOption("width")}; the latter displays only the columns that fit on one
screen. You can also set \code{options(tibble.width = Inf)} to override this
default and always print all columns.}

\item{n_extra}{Number of extra columns to print abbreviated information for,
if the width is too small for the entire tibble. If \code{NULL}, the default,
will print information about at most \code{tibble.max_extra_cols} extra columns.}
}
\description{
\Sexpr[results=rd, stage=render]{tibble:::lifecycle("maturing")}

One of the main features of the \code{tbl_df} class is the printing:
\itemize{
\item Tibbles only print as many rows and columns as fit on one screen,
supplemented by a summary of the remaining rows and columns.
\item Tibble reveals the type of each column, which keeps the user informed about
whether a variable is, e.g., \code{<chr>} or \code{<fct>} (character versus factor).
}

Printing can be tweaked for a one-off call by calling \code{print()} explicitly
and setting arguments like \code{n} and \code{width}. More persistent control is
available by setting the options described below.
}
\section{Package options}{


Options used by the tibble and pillar packages to format and print \code{tbl_df}
objects. Used by the formatting workhorse \code{trunc_mat()} and, therefore,
indirectly, by \code{print.tbl()}.
\itemize{
\item \code{tibble.print_max}: Row number threshold: Maximum number of rows printed.
Set to \code{Inf} to always print all rows.  Default: 20.
\item \code{tibble.print_min}: Number of rows printed if row number threshold is
exceeded. Default: 10.
\item \code{tibble.width}: Output width. Default: \code{NULL} (use \code{width} option).
\item \code{tibble.max_extra_cols}: Number of extra columns printed in reduced form.
Default: 100.
}



\itemize{
\item \code{pillar.bold}: Use bold font, e.g. for column headers? This currently
defaults to \code{FALSE}, because many terminal fonts have poor support for
bold fonts.
\item \code{pillar.subtle}: Use subtle style, e.g. for row numbers and data types?
Default: \code{TRUE}.
\item \code{pillar.subtle_num}: Use subtle style for insignificant digits? Default:
\code{FALSE}, is also affected by the \code{pillar.subtle} option.
\item \code{pillar.neg}: Highlight negative numbers? Default: \code{TRUE}.
\item \code{pillar.sigfig}: The number of significant digits that will be printed and
highlighted, default: \code{3}. Set the \code{pillar.subtle} option to \code{FALSE} to
turn off highlighting of significant digits.
\item \code{pillar.min_title_chars}: The minimum number of characters for the column
title, default: \code{15}.  Column titles may be truncated up to that width to
save horizontal space. Set to \code{Inf} to turn off truncation of column
titles.
}

}

\examples{
print(as_tibble(mtcars))
print(as_tibble(mtcars), n = 1)
print(as_tibble(mtcars), n = 3)

print(as_tibble(iris), n = 100)

print(mtcars, width = 10)

mtcars2 <- as_tibble(cbind(mtcars, mtcars), .name_repair = "unique")
print(mtcars2, n = 25, n_extra = 3)

trunc_mat(mtcars)

if (requireNamespace("nycflights13", quietly = TRUE)) {
  print(nycflights13::flights, n_extra = 2)
  print(nycflights13::flights, width = Inf)
}
}
