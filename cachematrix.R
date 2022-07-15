## makecachematrix creates a cache for matrix
## so when the inverse is required calculation is faster if it is on a cached
##matrix
## The following function creates a cache list of matrix.

makeCacheMatrix <- function(x = matrix()) {
#create an object in which the inverse will be cached
        i <- NULL
        #create a function to set new matrix vales
        set <- function(y){
                x <<- y
                i <<- NULL
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


## The function returns the inverse of matrix made using makecache matrix. 
#It is faster as it keeps cached values

cacheSolve <- function(x, ...) {
        #Assign the inverse matrix stored to i
        i <- x$getinverse()
        #if result is null then calculate the inverse ealse return cached value
        if(!is.null(i)){
                message("getting cached data")
                return(i)
        }
        data <- x$get()
        i <- solve(data,...)
        x$setinverse(i)
        i
        ## Return a matrix that is the inverse of 'x'
}
#Example: run the example without the # symbol to see the code in action
#mymatrix <- makeCacheMatrix(matrix(c(1,2,3,4), nrow = 2, ncol = 2, byrow = TRUE))
#cacheSolve(mymatrix)
#should return the result
#[,1] [,2]
#[1,] -2.0  1.0
#[2,]  1.5 -0.5
#if you run the function again i.e.
# cacheSolve(mymatrix)
#should return the result
#getting cached data
#[,1] [,2]
#[1,] -2.0  1.0
#[2,]  1.5 -0.5