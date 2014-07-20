## I am writing comments, yay!


## Really all these two short functions do is generate a "special matrix" (the matrix must be invertible)
## and check to to see if the inverse was previously calculated.  If not cachesolve generates the inverse of the
## invertible matrix.  The inverse is then cached.  The matrix_inv parameter in makeCacheMatrix is now no longer NULL 
## thanks a lot R scoping rules.  
## The next time cachesolve is run the if statement returns the inverse matrix.

## see above

makeCacheMatrix <- function(x = matrix()) {
  
  matrix_inv <- NULL
  
  set <- function(y) {
    x <<- y
    matrix_inv <<- NULL
  }
  
  get <- function() x
  setinv <- function(solve) matrix_inv <<- solve
  getinv <- function() matrix_inv
  list(set = set, get = get,
       setinv = setinv,
       getinv = getinv)
  

}


## see above

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  
  ## Return a matrix that is the inverse of 'x'
  
  matrix_inv <- x$getinv()
  if(!is.null(matrix_inv)) {
    message("getting inverse matrix")
    return(matrix_inv)
  }
  data <- x$get()
  matrix_inv <- solve(data, ...)
  x$setinv(matrix_inv)
  
  matrix_inv
  
  
}

# this is the test case
# b=as.matrix(rbind(c(4,3),c(3,2)))
# test=makeCacheMatrix(b)
# cacheSolve(test)

