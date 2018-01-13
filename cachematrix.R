## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function
## This function builds four functions and returns a new object: a list  
## containing these functions so that they can be called using the $ command

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


## Write a short comment describing this function
## The cacheSolve function gets the matrix from the input object,
## calculates an inverse matrix and uses the setsolve() function
## on the input object to set the value in the input object before 
## returning the value to the parent environment by printing the object.

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
