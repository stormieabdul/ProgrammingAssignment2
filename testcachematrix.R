## This as caller function implemented
## to test the performance of the cache matrix

## Write a short comment describing this function
cacheMatrixTester <- function() {
  x1<-getRandomMatrix(1000,1000)

  expectedX1<-solve(x1)
  message("Expected Results")
  print(expectedX1)
  
  x1cached <- makeCacheMatrix(x1)
  actualX1 <- cacheSolve(x1cached)
  message("Actual Results")
  print(actualX1)
  
  cacheSolve(x1cached)
  
}

getRandomMatrix <- function(nrow, ncol) {
  matrix(floor(runif(ncol*nrow, min=0, max=101)),nrow = nrow, ncol = ncol)
}