## The following functions would help speed up some computational operations,
## in this case calculating the inverse of a matrix. Instead of computing it
## repeatedly, we would catch the inverse of the matrix if we need it latter on.
## The functions that would create a special object that would store the matrix 
## and catches it inverse.

## This first function would create a special matrix object, this special matrix would 
## catch its inverse.  

makeCacheMatrix <- function(x = matrix()) {
    i <- NULL
    set <- function(y){
      x <<- y
      i <<- NULL
    }
    get <- function() x
    
    setInverse <- function(inverse) i <<- inverse
    getInverse <- function() i
    list(set=set,
         get=get,
         setInverse=setInverse,
         getInverse=getInverse)
  
}

## The second function search in the cache if the matrix inverse has been
## calculated and if it does, it prints the result, other wise it proceeds to
## calculate it.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
    i <- x$getInverse()
    if (!is.null(i)) {
      message("Getting cached data")
      return(i)
    
  }
    MA <- x$get()
    i <- solve(MA,...) # Solve function finds the inverse of a matrix
   x$setInverse(i)
   i
}
