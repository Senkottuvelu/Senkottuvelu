




USE hr;
SELECT * FROM countries;
SELECT * FROM departments;
SELECT * FROM employees;
SELECT * FROM job_history;
SELECT * FROM jobs;
SELECT * FROM locations;
SELECT * FROM regions;


select * from employees;


/*
--1. Write a query to display the names (first_name, last_name) using alias name “First Name", "Last 
Name" */

SELECT 
    first_name AS 'First Name', last_name AS 'Last Name'
FROM
    employees;

/* 2. Write a query to get unique department ID from employee table */

SELECT DISTINCT
    department_id
FROM
    employees;
    
/* 3. Write a query to get all employee details from the employee table order by first name, descending */

SELECT 
    *
FROM
    employees
ORDER BY first_name DESC;

/* 4. Write a query to get the names (first_name, last_name), salary, PF of all the employees (PF is 
calculated as 15% of salary)*/

SELECT 
    first_name,
    last_name,
    salary,
    ROUND(salary * 15 / 100, 2) AS PF
FROM
    employees;
    
/* 5. Write a query to get the employee ID, names (first_name, last_name), salary in ascending order of 
salary */

SELECT 
    employee_id, first_name, last_name, salary
FROM
    employees
ORDER BY salary ASC;

/* 6. Write a query to get the total salaries payable to employees */

SELECT 
    ROUND(SUM(salary), 2) AS Salaries_Payable
FROM
    employees;
    
/* 7. Write a query to get the maximum and minimum salary from employees table */

SELECT 
    MIN(salary) AS Minimum_salary, MAX(salary) AS Maximum_salary
FROM
    employees;

/* 8. Write a query to get the average salary and number of employees in the employees table */

SELECT 
    ROUND(AVG(salary), 2) AS Average_salary,
    COUNT(*) AS Num_of_Employees
FROM
    employees;
    
/* 9. Write a query to get the number of employees working with the company */

SELECT 
    COUNT(*) AS No_of_Emp
FROM
    employees;
    
/* 10. Write a query to get the number of jobs available in the employees table */

SELECT 
    COUNT(DISTINCT job_id) AS Num_Of_Jobs
FROM
    employees;
    
/* 11. Write a query get all first name from employees table in upper case */

SELECT 
    UPPER(first_name) AS First_name_Upper
FROM
    employees;
    
/* 12. Write a query to get the first 3 characters of first name from employees table */

SELECT 
    first_name, LEFT(first_name, 3)
FROM
    employees;
    
/* 13. Write a query to get first name from employees table after removing white spaces from both side */

SELECT 
    TRIM(first_name)
FROM
    employees;
    
/* 14. Write a query to get the length of the employee names (first_name, last_name) from employees table */

SELECT 
    first_name,
    last_name,
   CONCAT(last_name, ', ', first_name) AS full_name,
    LENGTH(CONCAT(last_name, ', ', first_name)) AS len_full_name
FROM
    employees;
    
/* 15. Write a query to check if the first_name fields of the employees table contains numbers */

SELECT 
    first_name
FROM
    employees
WHERE
    first_name REGEXP '0-9';
    
/* 16. Write a query to display the name (first_name, last_name) and salary for all employees whose salary is 
not in the range $10,000 through $15,000 */
 
SELECT 
    first_name, last_name, salary
FROM
    employees
WHERE
    salary NOT BETWEEN 10000 AND 15000;
    
/* 17. Write a query to display the name (first_name, last_name) and department ID of all employees in 
departments 30 or 100 in ascending order */

SELECT 
    first_name, last_name, department_id
FROM
    employees
WHERE
    department_id IN (30 , 100)      /* we can use 'OR' instead of 'IN' */
ORDER BY department_id DESC;

/* 18. Write a query to display the name (first_name, last_name) and salary for all employees whose salary is 
not in the range $10,000 through $15,000 and are in department 30 or 100 */

SELECT 
    first_name, last_name, salary, department_id
FROM
    employees
WHERE
    salary NOT BETWEEN 10000 AND 15000
        AND department_id IN (30 , 100);
        
/* 19. Write a query to display the name (first_name, last_name) and hire date for all employees who were 
hired in 1987 */

SELECT 
    first_name, last_name, hire_date
FROM
    employees
WHERE
    YEAR(hire_date) LIKE '1987';

/* 20. Write a query to display the first_name of all employees who have both "b" and "c" in their first name */

SELECT 
    first_name
FROM
    employees
WHERE
    (first_name LIKE '%b%'
        AND first_name LIKE '%c%');
        
/* 21. Write a query to display the last name, job, and salary for all employees whose job is that of a 
Programmer or a Shipping Clerk, and whose salary is not equal to $4,500, $10,000, or $15,000 */

SELECT 
    last_name, job_id, salary
FROM
    employees
WHERE
    job_id LIKE 'IT_PROG'
        OR job_id LIKE 'PU_CLERK'   /* instead of 'OR' we can use 'IN' command also */
        AND salary NOT IN (4500 , 10000, 15000);
        
/* 22. Write a query to display the last name of employees whose names have exactly 6 character */

SELECT 
    last_name
FROM
    employees
WHERE
    last_name LIKE '______';
    
/* 23. Write a query to display the last name of employees having 'e' as the third character */

SELECT 
    last_name
FROM
    employees
WHERE
    last_name LIKE '__e%';
    
    
/* 24. Write a query to get the job_id and related employee's id
Partial output of the query : 
job_id     Employees ID
AC_ACCOUNT   206
AC_MGR       205
AD_ASST      200
AD_PRES      100
AD_VP        101 ,102
FI_ACCOUNT   110 ,113 ,111 ,109 ,112 */

SELECT 
    job_id, GROUP_CONCAT(employee_id, ' ') AS Employees_ID
FROM
    employees
GROUP BY job_id;

/* 25. Write a query to update the portion of the phone_number in the employees table, within the phone 
number the substring '124' will be replaced by '999' */

UPDATE employees 
SET 
    phone_number = REPLACE(phone_number, '124', '999')
WHERE
    phone_number LIKE '%124%';
    
SELECT 
    phone_number
FROM
    employees;
    
    /* 26. Write a query to get the details of the employees where the length of the first name greater than or 
equal to 8 */

SELECT 
    first_name
FROM
    employees
WHERE
    LENGTH(first_name) >= 8;
    
/* 27. Write a query to append '@example.com' to email field */

UPDATE employees 
SET 
    email = CONCAT(email, '@example.com');
SELECT 
    email
FROM
    employees;

/* 28. Write a query to extract the last 4 character of phone numbers */

SELECT 
    RIGHT(phone_number, 4) AS Last_4_Digit
FROM
    employees;
    
/* 29. Write a query to get the last word of the street address */

SELECT location_id, street_address, 
SUBSTRING_INDEX(REPLACE(REPLACE(REPLACE(street_address,',',' '),')',' '),'(',' '),' ',-1) 'Last--word-of-street_address' 
FROM locations;

/* 30. Write a query to get the locations that have minimum street length */

SELECT * FROM locations
WHERE LENGTH(street_address) <= (SELECT  MIN(LENGTH(street_address)) 
FROM locations);


/* 31. Write a query to display the first word from those job titles which contains more than one words */

SELECT 
    job_title,
    SUBSTR(job_title,
        1,
        INSTR(job_title, ' ') - 1) AS First_word_from_job_title
FROM
    jobs;
    
    
/* 32. Write a query to display the length of first name for employees where last name contain character 'c' 
after 2nd position */

SELECT 
    first_name, last_name
FROM
    employees
WHERE
    INSTR(last_name, 'c') > 2;
    
/* 33. Write a query that displays the first name and the length of the first name for all employees whose 
name starts with the letters 'A', 'J' or 'M'. Give each column an appropriate label. Sort the results by the 
employees' first names */

SELECT 
    first_name, LENGTH(first_name) AS Length_of_FN
FROM
    employees
WHERE
    first_name LIKE 'A%'
        OR first_name LIKE 'J%'
        OR first_name LIKE 'M%'
ORDER BY first_name;

/* 34. Write a query to display the first name and salary for all employees. Format the salary to be 10 
characters long, left-padded with the $ symbol. Label the column SALARY
*/

SELECT first_name, salary,
LPAD(salary, 10, '$') as SALARY
FROM employees;

 /* 35. Write a query to display the first eight characters of the employees' first names and indicates the 
amounts of their salaries with '$' sign. Each '$' sign signifies a thousand dollars. Sort the data in 
descending order of salary */

SELECT 
    LEFT(first_name, 8),
    REPEAT('$', FLOOR(salary / 1000)) as SALARY_in_$,
    salary
FROM
    employees
ORDER BY salary DESC;


/* 36. Write a query to display the employees with their code, first name, last name and hire date who hired 
either on seventh day of any month or seventh month in any year  */

SELECT 
    employee_id, first_name, last_name, hire_date
FROM
    employees
WHERE
    POSITION('07' IN DATE_FORMAT(hire_date, '%d %m %y')) > 0;
    
    
    
    
    
    
    /* Northwind Database Excercise  */
    
    
    use northwind;
    
    select * from categories;
    select * from customers;
    select * from employees;
    select * from orderdetails;
    select * from orders;
    select * from products;
    select * from shippers;
    select * from suppliers;
    
    
    
   /*  1. Write a query to get Product name and quantity/unit */
   
SELECT 
    ProductName, QuantityPerUnit
FROM
    Products;
    
    /* 2. Write a query to get current Product list (Product ID and name) */
    
    SELECT 
    productID, productName
FROM
    products;
    
    /* 3. Write a query to get discontinued Product list (Product ID and name) */
 
 SELECT productID, productName
FROM products
WHERE Discontinued = 1; 
    
    /* 4. Write a query to get most expense and least expensive Product list (name and unit price) */
    
    SELECT 
    productName, unitprice
FROM
    products
ORDER BY unitprice DESC;
    
    /* 5. Write a query to get Product list (id, name, unit price) where current products cost less than $20 */
    
   SELECT 
    productID, productName, unitPrice
FROM
    products
WHERE
    (((unitPrice) < 20)
        AND ((Discontinued) = 0));
        
/* 6. Write a query to get Product list (id, name, unit price) where products cost between $15 and $25 */

SELECT 
    productID, productName, unitPrice
FROM
    products
WHERE
    unitPrice BETWEEN 15 AND 25;

/* 7. Write a query to get Product list (name, unit price) of above average price */

SELECT 
    productName, unitPrice
FROM
    products
WHERE
    unitPrice > (SELECT 
            AVG(unitPrice)
        FROM
            products)
order by unitPrice;


/* 8. Write a query to get Product list (name, unit price) of ten most expensive products */

SELECT DISTINCT
    ProductName AS Ten_Most_Expensive_Products, UnitPrice
FROM
    Products AS a
WHERE
    10 >= (SELECT 
            COUNT(DISTINCT UnitPrice)
        FROM
            Products AS b
        WHERE
            b.UnitPrice >= a.UnitPrice)
ORDER BY UnitPrice DESC;

/* 9. Write a query to count current and discontinued products */

SELECT 
    COUNT(ProductName)
FROM
    Products
GROUP BY Discontinued;

/*  10. Write a query to get Product list (name, units on order , units in stock) of stock is less than the quantity 
on order */

SELECT 
    ProductName, UnitsOnOrder, UnitsInStock
FROM
    Products
    
WHERE
    (UnitsInStock) < (UnitsOnOrder);
    