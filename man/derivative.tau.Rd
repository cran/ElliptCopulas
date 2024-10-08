% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/zz_auxiliaryFunctions.R
\name{derivative.tau}
\alias{derivative.tau}
\alias{f3}
\alias{f4}
\title{Computing \eqn{\tau} and its \eqn{k}-th derivative}
\usage{
derivative.tau(x, a, d, k)

f3(x, d, k = 0)

f4(x, a, d, k = 0)
}
\arguments{
\item{x}{a numeric vector}

\item{a}{a parameter \eqn{a > 0} that reduces the bias of the estimator around zero}

\item{d}{the dimension of the data}

\item{k}{the order of derivatives for \code{f3} and \code{f4}}
}
\value{
A numeric vector \eqn{\tau^{(k)}(x_1), ..., \tau^{(k)}(x_N)}
where \code{N = length(x)}.

The functions \code{f3} and \code{f4} also return a numeric value
}
\description{
The function \eqn{\tau} is used to compute \eqn{\alpha_{i,k}},
which is required to compute the derivatives
of the generator of elliptical distribution.
The functions \code{f3} and \code{f4} are already implemented in \code{derivative.tau}.
These functions are needed for computing higher derivatives of \eqn{\tau}.
}
\section{Functions}{
\itemize{
\item \code{f3()}: \eqn{f_3(x) = x^{(d-2)/d}}

\item \code{f4()}: \eqn{f_4(x) = a^{d/2} + x^{d/2}}

}}
\note{
The function \eqn{\tau} is defined as follows:
\eqn{\tau(x) = x^{(d-2)/2}/\psi^{\prime}(x)}, where
\eqn{\psi^{\prime}(x) = x^{d/2 - 1}(a^{d/2} + x^{d/2})^{2/d - 1}}.
The definition of \eqn{\psi} is already described in \code{derivative.tau}.
Therefore, by the definition of \eqn{f_3} and \eqn{f_4},
the function \eqn{\tau} is actually \eqn{\tau(x) = (f_3 \circ f_4)(x)}.
}
\examples{

# Return the 5-th derivative of tau at x = 1
derivative.tau(x = 1, a = 1, d = 3, k = 5)

# Return the value of tau at x = 1.
derivative.tau(x = 1, a = 1, d = 3, k = 0)

# Vectorized version
derivative.tau(x = c(1,3), a = 1, d = 3, k = 5)

}
\references{
Ryan, V., & Derumigny, A. (2024).
On the choice of the two tuning parameters for nonparametric estimation of an
elliptical distribution generator
\href{https://arxiv.org/abs/2408.17087}{arxiv:2408.17087}.
}
\seealso{
\code{\link{derivative.psi}} and \code{\link{derivative.rho}}.
\code{\link{vectorized_Faa_di_Bruno}} which is used for the computation
of the derivatives.
}
\author{
Victor Ryan, Alexis Derumigny
}
\keyword{internal}
