## Put comments here that give an overall description of what your
## functions do

## This function creates a special "matrix" object that can cache its inverse

makeCacheMatrix <- function(x = matrix()) {
  
  # set the value of the matrix
  
  inverseMatrix <- NULL
  
  set <- function(y) {
    x <<- y
    inverseMatrix <<- NULL
  }
  
  
  
  
  get <- function() x                                         # get the value of the matrix
  
  setinvmtx <- function(solve) inverseMatrix <<- solve        # set the inverse of the matrix
  
  getinvmtx <- fucntion() inverseMatrix                       # get the inverse matrix
  
  list(set = set, get = get,                                  # cache
       setinvmtx = setinvmtx,
       getinvmtx = getinvmtx)
  
}


## This function computes the inverse of the special "matrix" returned by makeCacheMatrix above. 
## If the inverse has already been calculated (and the matrix has not changed), then the cachesolve should retrieve the inverse from the cache

cacheSolve <- function(x, ...) {
  
  # Check to see if the inverse has already been calculated
  # If so, get the inverse from the cache and skip the computation
  # Otherwise, calculate the mean of the data and set the value of the inverse in the cache via the setinvmtx function
  
  inverseMatrix <- x$getinvmtx()
  
  if(!is.null(inverseMatrix)) {
    message("getting chached data")
    return(inverseMatrix)
  }
  
  
  data <- x$get()
  
  inverseMatrix <- solve(data, ...)
  
  x$setinvmtx(inverseMatrix)
  
  inverseMatrix
  
}
