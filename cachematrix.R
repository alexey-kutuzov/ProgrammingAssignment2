## makeCacheMatrix() creates a list object representing 
## a matrix and interface functions to it.

## For data consistency there is not interface function
## to set inverse matrix from the outside

## create an object for given matrix 'x'
makeCacheMatrix <- function(x = matrix()) {
  inv <- NULL

  ##set new matrix to object
  set <- function(y){
    x <<- y
    inv <<- NULL
  }
  
  ##get matrix
  get <- function() x
  
  ##get inverse matrix
  get_inv <- function(){
    if(is.null(inv)){
      inv <<- solve(x)
    }
    return(inv)
  }
  
  list(set=set, get=get, get_inv=get_inv)
}


cacheSolve <- function(O, ...) {
        ## return a matrix that is the inverse of 'O'
  O$get_inv()
}
