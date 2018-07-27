## This function creates a special "matrix" object that can cache its inverse
## Below are a pair of functions that are used to create a special object that stores a matrix and caches its inverse

makeCacheMatrix <- function(x = matrix()) {
        inv <- NULL
        set <- function(y) {
        x <<- y
        inv <<- NULL
}
get <- function() x
setinv <- function(inverse) inv <<- inverse
getinv <- function() inv
list(set = set, 
     get = get,
     setinv = setinv,
     getinv = getinv)
}


## This function computes the inverse of the special "matrix" returned by makeCacheMatrix above.

cacheSolve <- function(x, ...) {
        inv <- x$getinv()
        if(!is.null(inv)) {
        return(inv)
 }
data <- x$get()
inv <- solve(data, ...)
x$setinv(inv)
inv
        ## Return a matrix that is the inverse of 'x'
}
