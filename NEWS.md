
# ElliptCopulas 0.1.3

* New dependence `wdm` instead of `pcaPP` for fast computation of Kendall's tau.


# ElliptCopulas 0.1.2

* Fixed a bug in `EllDistrEst` when `mu` is not zero. (#1, thanks to Rutger van der Spek)

* `EllDistrEst` gains two new arguments: `mpfr` and `precBits`,
that allows to use the package `Rmpfr` for multiple floating point precision
(needed for dimensions larger than 250).
(#2, thanks to Rutger van der Spek)

* New function `KTMatrixEst` for fast estimation of Kendall's tau matrix,
potentially under structural assumptions.
(#2, thanks to Rutger van der Spek)

* New dependencies: Import: `Rmpfr`, `pbapply`. Suggest: `mvtnorm`.



# ElliptCopulas 0.1.1

* Completed the documentation about returned values of the exported functions.



# ElliptCopulas 0.1.0

* Initial release
