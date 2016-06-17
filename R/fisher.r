fisher <- function(p, adjust = "none", pca.method = NULL, R = NULL, ...) {
   if(adjust == "none") {
      k <- length(p)
      pooled.p <- pchisq(-2*sum(log(p)), df=2*k, lower.tail=FALSE)
   } else if(adjust == "m.eff") {
      k <- length(p)
      eff <- meff(R = R, method = pca.method)
      pooled.p <- pchisq(-2 * sum(log(p))/ eff, df = 2 * eff, lower.tail = FALSE)
   } else if (adjust == "brown") {
      pooled.p <- brown(p, R)
   }
   
   res <- list(p = pooled.p, adjust = paste0(adjust, " ", pca.method))
   return(res)
}