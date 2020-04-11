# Lecture 16 Demo 1
# Connect the database
PSTAT10db <- dbConnect(RSQLite::SQLite(), "PSTAT10-db.sqlite")

# Last time...

EMPLOYEE <- read.csv("~/Documents/PSTAT 10/EMPLOYEE.txt")
DEPARTMENT <- read.csv("~/Documents/PSTAT 10/DEPARTMENT.txt")
CUSTOMER <- read.csv("~/Documents/PSTAT 10/CUSTOMER.txt")

dbWriteTable(PSTAT10db, "EMPLOYEE", EMPLOYEE, overwrite =TRUE)
dbWriteTable(PSTAT10db, "DEPARTMENT", DEPARTMENT, overwrite =TRUE)
dbWriteTable(PSTAT10db, "CUSTOMER", CUSTOMER, overwrite =TRUE)

# Preperation for lecture

EMPLOYEE_PHONE <- read.csv("~/Documents/PSTAT 10/EMPLOYEE_PHONE.txt")
SALES_ORDER_LINE <- read.csv("~/Documents/PSTAT 10/SALES_ORDER_LINE.txt")
INVOICES <- read.csv("~/Documents/PSTAT 10/INVOICES.txt")
PRODUCT <- read.csv("~/Documents/PSTAT 10/PRODUCT.txt")
STOCK_TOTAL <- read.csv("~/Documents/PSTAT 10/STOCK_TOTAL.txt")
SALES_ORDER <- read.csv("~/Documents/PSTAT 10/SALES_ORDER.txt")

dbWriteTable(PSTAT10db, "EMPLOYEE_PHONE", EMPLOYEE_PHONE, overwrite=TRUE)
dbWriteTable(PSTAT10db, "SALES_ORDER_LINE", SALES_ORDER_LINE, overwrite=TRUE)
dbWriteTable(PSTAT10db, "INVOICES", INVOICES, overwrite=TRUE)
dbWriteTable(PSTAT10db, "PRODUCT", PRODUCT, overwrite=TRUE)
dbWriteTable(PSTAT10db, "STOCK_TOTAL", STOCK_TOTAL, overwrite=TRUE)
dbWriteTable(PSTAT10db, "SALES_ORDER", SALES_ORDER, overwrite=TRUE)

dbListTables(PSTAT10db)

# Lecture 16 Demo 2
# Retrieve the details of all employees whose name begins with 'B'
dbGetQuery(PSTAT10db, 'SELECT * FROM EMPLOYEE WHERE NAME LIKE "B%"')
dbGetQuery(PSTAT10db, 'SELECT NAME FROM EMPLOYEE WHERE NAME LIKE "B%"')

# Retrieve the names and ages of all employees ehose name includes 'R'
dbGetQuery(PSTAT10db, 'SELECT NAME, AGE FROM EMPLOYEE WHERE NAME LIKE "%R%"')

# Some more examples
dbGetQuery(PSTAT10db, 'SELECT NAME, AGE FROM EMPLOYEE WHERE NAME LIKE "%N"')
dbGetQuery(PSTAT10db, 'SELECT NAME, AGE FROM EMPLOYEE WHERE NAME LIKE "_R_E%"')

# Lecture 16 Demo 3
# A supervisor knows only that an employee is over 60 years of age.
# and that his name begins with 'B'
# we are asked to find the employee's details
# we will use the logical operator 'LIKE'

dbGetQuery(PSTAT10db, 'SELECT NAME, AGE FROM EMPLOYEE WHERE NAME
           LIKE "B%" AND AGE>60')

# LECTURE 16 DEMO 4 USING ARTIHMETIC AND COMPARISON OPERATORS
# A supervisor asks us to find tge employee number of the accounts department manager.
#DEPARTMENT
# DEPT_NO is the departmnet number, NAMae is the department name
# and MANAGER gives the manger ID. We want NAme and MANAGER ID
# WHERE NAME is accounts

dbGetQuery(PSTAT10db, 'SELECT MANAGER, NAME FROM DEPARTMENT
           WHERE NAME == "Accounts"')

# we have use the == operator

# Lecture 16 Demo 5
# EVALUATING CONDITION EXPRESSIONS
# which product are availiable in blue?
dbGetQuery(PSTAT10db, 'SELECT * FROM PRODUCT WHERE color == "BLUE"')

# which products are not avaliable in blue?
dbGetQuery(PSTAT10db, 'SELECT * FROM PRODUCT WHERE NOT(color == "BLUE")')

# do we sell blue socks?
dbGetQuery(PSTAT10db, 'SELECT * FROM PRODUCT WHERE color == "BLUE"
           AND NAME == "SOCKS"')
# there are any rows with that condition so there is no rows of blue socks.

# what color socks do we sell?
dbGetQuery(PSTAT10db, 'SELECT NAME, COLOR FROM PRODUCT WHERE NAME == "SOCKS"')

# look at product
dbGetQuery(PSTAT10db, ' SELECT * FROM PRODUCT')

# what is the result of the query?
dbGetQuery(PSTAT10db, 'SELECT * FROM PRODUCT
           WHERE NOT (color == "GREEN") AND (NAME == "SOCKS")')

# what is the result of the query?
dbGetQuery(PSTAT10db, 'SELECT * FROM PRODUCT
           WHERE NOT (color == "BLUE")
           AND (NAME == "SOCKS" OR NAME == "PANTS")')

# Lecture 16 Demo 6 Range checks using logical opertors

# RETRIEVE THE DETAILS OF EMPLOYEES WHOSE AGE IS BETWEEN 21 AND 31
dbGetQuery(PSTAT10db, 'SELECT * FROM EMPLOYEE
           WHERE AGE BETWEEN 21 AND 31')

# Membership of a set of values
dbGetQuery(PSTAT10db, 'SELECT * FROM SALES_ORDER_LINE
           WHERE PROD_NO IN ("p1", "p2","p3")')

# Lecture 16 Demo 7
# does tiny clothes have any orders afor products p1, p2 , p3
# SELECT ORDER_NO, PROD_NO, AND QUANTITY
# FROM SALES_ORDER_LINE
#WHERE PROD_NO p1, p2, or p3

dbGetQuery(PSTAT10db, )
