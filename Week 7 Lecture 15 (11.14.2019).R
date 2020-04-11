options(prompt = "R>")
dbconnect()
mydb <- dbConnect(RSQLite::SQLite(), "my-db.sqlite")
# Lecture 15 Demo 1
# create a new database PSTAT10db

PSTAT10db <- dbConnect(RSQLite::SQLite(), "PSTAT10-db.sqlite")

EMPLOYEE <- read.csv("~/Documents/PSTAT 10/EMPLOYEE.txt")
DEPARTMENT <- read.csv("~/Documents/PSTAT 10/DEPARTMENT.txt")
CUSTOMER <- read.csv("~/Documents/PSTAT 10/CUSTOMER.txt")

dbWriteTable(PSTAT10db, "EMPLOYEE", EMPLOYEE, overwrite= TRUE)
dbWriteTable(PSTAT10db, "DEPARTMENT", DEPARTMENT, overwrite= TRUE)
dbWriteTable(PSTAT10db, "CUSTOMER", CUSTOMER, overwrite= TRUE)

dbListTables(PSTAT10db)

dbRemoveTable(PSTAT10db, "DEPARTMENT")
dbRemoveTable(PSTAT10db, "mtcars")
dbRemoveTable(PSTAT10db, "EMPLOYEE")
dbRemoveTable(PSTAT10db, "CUSTOMER")

# LECTURE 15 DEMO  2
# select all from employee
dbGetQuery(PSTAT10db, 'SELECT * FROM EMPLOYEE')
dbGetQuery(PSTAT10db, 'SELECT * FROM DEPARTMENT')
dbGetQuery(PSTAT10db, 'SELECT * FROM CUSTOMER')
CUSTOMER
EMPLOYEE

# The result of the query is given as a data frame.
is.data.frame(DEPARTMENT)

# we can also add data frames to the database directory.
dbWriteTable(PSTAT10db, "mtcars",mtcars)
dbWriteTable(PSTAT10db, "iris",iris)
dbWriteTable(PSTAT10db)

# Lecture 15 Demo 3 mtcars
# mcars is a dataframe with 32 observations
# use of an arithmetic operator
# select all from mtcars but only return first 5 tuples
dbGetQuery(PSTAT10db, 'SELECT * FROM mtcars LIMIT 5')

#Use of an arithmetic operator. Select Wt with where condition that mpg > 30
dbGetQuery(PSTAT10db, 'SELECT wt FROM mtcars WHERE mpg > 30')

# SELECT WT AND MPG FOR CARS WITH MPG > 30
dbGetQuery(PSTAT10db, 'SELECT wt, mpg FROM mtcars WHERE mpg > 30')

# Lecture 15 Demo 4 Using mtcars
# mtcars is a data frame with 32 observations
# cyl refers to the number of cylinders
dbGetQuery(PSTAT10db, 'SELECT cyl FROM mtcars')

# Find the number of cylinder cars in the survey have.
# do not return duplicates
dbGetQuery(PSTAT10db, 'SELECT DISTINCT cyl FROM mtcars')

# Find the number of gears and corresponding number of cylinders.

dbGetQuery(PSTAT10db, 'SELECT DISTINCT gear, cyl FROM mtcars')


# Lecture 15 Demo 5
dbGetQuery(PSTAT10db, 'SELECT * FROM EMPLOYEE')
dbGetQuery(PSTAT10db, 'SELECT DISTINCT NAME FROM EMPLOYEE')
dbGetQuery(PSTAT10db, 'SELECT DISTINCT NAME, AGE, DEPT_NO FROM EMPLOYEE')
dbGetQuery(PSTAT10db, 'SELECT DISTINCT NAME, DEPT_NO FROM EMPLOYEE')

# Lecture 15 Demo 6
# a supervisor knows that an employee is over 60 years of age