% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/TEllDistrEst.R
\name{TEllDistrEst}
\alias{TEllDistrEst}
\title{Estimation of trans-elliptical distributions}
\usage{
TEllDistrEst(
  X, estimatorCDF = function(x){
    force(x)
    return( function(y){(stats::ecdf(x)(y) - 1/(2*length(x))) }) },
  h, verbose = 1, grid, ...)
}
\arguments{
\item{X}{the matrix of observations of the variables}

\item{estimatorCDF}{the way of estimating the marginal cumulative distribution functions.
It should be either a function that takes in parameter a vector of observations
and returns an estimated cdf (i.e. a function) or a list of such functions
to be applied on the data.
In this case, it is required that the length of the list should be the same
as the number of columns of \code{X}.
It is required that the functions returned by \code{estimatorCDF}
should have values in the \emph{open} interval \eqn{(0,1)}.}

\item{h}{bandwidth for the non-parametric estimation of the density generator.}

\item{verbose}{if 1, prints the progress of the iterations.
If 2, prints the normalizations constants used at each iteration,
as computed by \code{\link{DensityGenerator.normalize}}.}

\item{grid}{grid of values on which to estimate the density generator}

\item{...}{other parameters to be passed to \code{\link{EllCopEst}}.}
}
\value{
This function returns a list with three components:
\itemize{
\item \code{listEstCDF}: a list of estimated marginal CDF given by \code{estimatorCDF};
\item \code{corMatrix}: the estimated correlation matrix:
\item \code{estEllCopGen}: the estimated generator of the meta-elliptical copula.
}
}
\description{
This function estimates the parameters of a trans-elliptical
distribution which is a distribution whose copula is
(meta-)elliptical, with arbitrary margins, using the procedure
proposed in (Derumigny & Fermanian, 2022).
}
\examples{
\donttest{
cor = matrix(c(1, 0.5, 0.2,
               0.5, 1, 0.8,
               0.2, 0.8, 1), byrow = TRUE, nrow = 3)

grid = seq(0,10,by = 0.01)
g_d = DensityGenerator.normalize(grid, grid_g = exp(-grid), d = 3)
n = 10
# To have a nice estimation, we suggest to use rather n=200
# (around 20s of computation time)
U = EllCopSim(n = n, d = 3, grid = grid, g_d = g_d, A = chol(cor))
X = matrix(nrow = n, ncol = 3)
X[,1] = stats::qnorm(U[,1], mean = 2)
X[,2] = stats::qt(U[,2], df = 5)
X[,3] = stats::qt(U[,3], df = 8)

result = TEllDistrEst(X, h = 0.1, grid = grid)
plot(grid, g_d, type = "l", xlim = c(0,2))
lines(grid, result$estiEllCop$g_d_norm, col = "red")
print(result$corMatrix)

# Adding missing observations
n_NA = 2
X_NA = X
for (i in 1:n_NA){
  X_NA[sample.int(n,1), sample.int(3,1)] = NA
}
resultNA = TEllDistrEst(X_NA, h = 0.1, grid = grid, verbose = 1)
lines(grid, resultNA$estiEllCopGen, col = "blue")
}

}
\references{
Derumigny, A., & Fermanian, J. D. (2022).
Identifiability and estimation of meta-elliptical copula generators.
Journal of Multivariate Analysis, article 104962.
\doi{10.1016/j.jmva.2022.104962}.
}
