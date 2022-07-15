## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {
#create an object in which the inverse will be cached
        i <- matrix()
        #create a function to set new matrix vales
        set <- function(y){
                x <<- y
                i <<- matrix()
        }
#create a function that gets back the stored value of x
        get <- function() x
        #A variable in the list to store the "set" inverse values 
        setinverse <- function(j) i <<- j
        #A variable in the list to get the inverse set earlier
        getinverse <- function() i
        #create a named list for use
        list(set = set, get = get, setinverse= setinverse, 
             getinverse = getinverse)
        }


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        
        ## Return a matrix that is the inverse of 'x'
}
