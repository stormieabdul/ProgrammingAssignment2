## Creates an cacheable R matrix object
## Author : Abdul Khan



## This method creates a matrix that can cache solve result
## Essentially it creates a special object that is list of function
## {set, get, setsolve, getsolve}
## These functions are used by subsequent helper method. 
makeCacheMatrix <- function(x = matrix()) {
  s <- NULL
  set <- function(y) {
    x <<- y
    s <<- NULL
  }
  get <- function() x
  setsolve <- function(solve) s <<- solve
  getsolve <- function() s
  list(set = set, get = get,
       setsolve = setsolve,
       getsolve = getsolve)
}


## This method uses the object created by makeCacheMatrix
## It just reads precomputed results using list's getsolve function
## If the results are cached then it reads those otherwise it solves
## and caches the results.

cacheSolve <- function(x, ...) {
  ## Return a matrix that is the inverse of 'x'
  s <- x$getsolve()
  if(!is.null(s)) {
    message("getting cached data")
    return(s)
  }
  data <- x$get()
  s <- solve(data, ...)
  x$setsolve(s)
  s  
}
