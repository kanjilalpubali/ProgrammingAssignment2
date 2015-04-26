## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

## MY COMMENTS: The function "makeCacheMatrix" creates a special 
## matrix which contains a function to:
## 1. Set the value of the matrix (set function)
## 2. Get the value of the matrix (get function)
## 3. Set the value of the inverse (setinv function)
## 4. Get the value of the inverse (getinv function)

makeCacheMatrix <- function(x = matrix()) {
  m <- NULL
  set <- function(y){
          x <<- y
          m <- NULL
  }
get <- function() x
setinv <- function(inv) m <<- inv
getinv <- function() m
list(set = set, get = get,
     setinv = setinv,
     getinv = getinv)
}


## Write a short comment describing this function

## MY COMMENTS: The function "cacheSolve" calculates the Inverse of the special matrix
## created in the above function.
## 1. It first checks if the Inverse has already been calculated. 
## 2. If the Inverse is found in the Cache, it skips the computation
## and returns the stored Inverse. 
## 3. Else, it computes the Inverse of the matrix and sets the Value of the
## Inverse in the Cache by the setinv function.

cacheSolve <- function(x, ...) {
  m <- x$getinv()
  if(!is.null(m)) {
    message("getting cached data")
    return(m)
  }
  data <- x$get()
  m <- solve(data, ...)
  x$setinv(m)
  m
        ## Return a matrix that is the inverse of 'x'
}
