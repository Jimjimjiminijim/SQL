/*---------------------------------------LESSON 1 - SELECT Queries 101

Select query for a specific columns
*/

SELECT column, another_column, …
FROM mytable;

/*Examples
Find the title of each film*/
SELECT title FROM movies;

/*Find the director of each film*/
SELECT director FROM movies;

/*Find the title and director of each film*/
SELECT title, director FROM movies;

/*Find the title and year of each film*/
SELECT title, year FROM movies;

/*Find all the information about each film*/
SELECT * FROM movies;


/*----------------------------------------LESSON 2 - Queries with constraints pt1

Select query with constraints
*/

SELECT column, another_column, …
FROM mytable
WHERE condition
    AND/OR another_condition
    AND/OR …;

/*Examples

Find the movie with a row id of 6*/
SELECT * FROM movies
WHERE ID = 6;

/*Find the movies released in the years between 2000 and 2010*/
SELECT * FROM movies
WHERE year BETWEEN 2000 AND 2010;

/*Find the movies not released in the years between 2000 and 2010*/
SELECT * FROM movies
WHERE year NOT BETWEEN 2000 AND 2010;

/*Find the first 5 Pixar movies and their release year*/
SELECT title, year FROM movies
WHERE id BETWEEN 1 AND 5;


/*----------------------------------------LESSON 3 - Queries with constraints pt2

Select strings query with constraints pt2: 
*/


SELECT column, another_column, …
FROM mytable
WHERE condition
    AND/OR another_condition
    AND/OR …;
	
/*Find all the Toy Story movies*/
SELECT * FROM movies
where title like "toy story%";

/*Find all the movies directed by John Lasseter*/
SELECT * FROM movies
where director like "john lasseter";

/*Find all the movies (and director) not directed by John Lasseter*/
SELECT * FROM movies
where director not like "john lasseter";

/*Find all the WALL-* movies*/
SELECT * FROM movies
where title like "wall%";


/*----------------------------------------LESSON 4 - Filtering and sorting query results

Select query with unique results*/
SELECT DISTINCT column, another_column, …
FROM mytable
WHERE condition(s);


/*Select query with ordered results*/
SELECT column, another_column, …
FROM mytable
WHERE condition(s)
ORDER BY column ASC/DESC;


/*Select query with limited rows*/
SELECT column, another_column, …
FROM mytable
WHERE condition(s)
ORDER BY column ASC/DESC
LIMIT num_limit OFFSET num_offset;


/*List all directors of Pixar movies (alphabetically), without duplicates*/
SELECT DISTINCT director FROM movies
ORDER BY director ASC;

/*List the last four Pixar movies released (ordered from most recent to least)*/
SELECT * FROM movies
ORDER BY year DESC
limit 4;

/*List the first five Pixar movies sorted alphabetically*/
SELECT * FROM movies
ORDER BY title asc
limit 5;

/*List the next five Pixar movies sorted alphabetically*/
SELECT * FROM movies
ORDER BY title asc
limit 5 OFFSET 5;


/*----------------------------------------LESSON 5 - Review: Simple SELECT queries


Solve actual problems using what we've learned so far*/

/*List all the Canadian cities and their populations*/
SELECT city, population FROM north_american_cities
where country like "canada";

/*Order all the cities in the United States by their latitude from north to south*/
SELECT city FROM north_american_cities
where country like "united states"
order by latitude desc;

/*List all the cities west of Chicago, ordered from west to east*/
SELECT city, longitude FROM north_american_cities
where longitude < -87.629798
order by longitude ASC;

/*List the two largest cities in Mexico (by population)*/
SELECT city FROM north_american_cities
where country like "mexico"
order by population desc 
limit 2;

/*List the third and fourth largest cities (by population) in the United States and their population*/
SELECT city, population FROM north_american_cities
where country like "united states"
order by population desc 
limit 2 offset 2;


/*----------------------------------------LESSON 6 - Multi-table queries with joins

Multiple table queries with joins

Database normalization:
Database normalization is useful because it minimizes duplicate data in any single table, 
and allows for data in the database to grow independently of each other (ie. Types of car 
engines can grow independent of each type of car). As a trade-off, queries get slightly 
more complex since they have to be able to find data from different parts of the database, 
and performance issues can arise when working with many large tables.

In order to answer questions about an entity that has data spanning multiple tables in a 
normalized database, we need to learn how to write a query that can combine all that data 
and pull out exactly the information we need.


Multi-table queries with JOINs:
Tables that share information about a single entity need to have a primary key that 
identifies that entity uniquely across the database. One common primary key type is an 
auto-incrementing integer (because they are space efficient), but it can also be a string, 
hashed value, so long as it is unique.




Select query with INNER JOIN on multiple tables*/

SELECT column, another_table_column, …
FROM mytable
INNER JOIN another_table 
    ON mytable.id = another_table.id
WHERE condition(s)
ORDER BY column, … ASC/DESC
LIMIT num_limit OFFSET num_offset;

/*Find the domestic and international sales for each movie*/
select title, domestic_sales, international_sales
from movies
	inner join boxoffice
		on movies.id = boxoffice.movie_id;


/*Show the sales numbers for each movie that did better internationally rather than domestically*/
SELECT title, domestic_sales, international_sales 
FROM movies
    inner join boxoffice
        on movies.id = boxoffice.movie_id
where international_sales > domestic_sales;

/*List all the movies by their ratings in descending order*/
SELECT title, rating 
FROM movies
    inner join boxoffice
        on movies.id = boxoffice.movie_id
order by rating desc;


/*----------------------------------------LESSON 7 - OUTER JOINs


Select query with LEFT/RIGHT/FULL JOINs on multiple tables */
SELECT column, another_column, …
FROM mytable
INNER/LEFT/RIGHT/FULL JOIN another_table 
    ON mytable.id = another_table.matching_id
WHERE condition(s)
ORDER BY column, … ASC/DESC
LIMIT num_limit OFFSET num_offset;


/*Find the list of all buildings that have employees*/
SELECT distinct building FROM employees;


/*Find the list of all buildings and their capacity*/
SELECT * FROM buildings;

/*List all buildings and the distinct employee roles in each building (including empty buildings)*/
SELECT DISTINCT building_name, role 
FROM buildings 
  LEFT JOIN employees
    ON building_name = building;

	
/*----------------------------------------LESSON 8 - A short note on NULLS
	

Select query with constraints on NULL values*/
SELECT column, another_column, …
FROM mytable
WHERE column IS/IS NOT NULL
AND/OR another_condition
AND/OR …;
	

/*Find the name and role of all employees who have not been assigned to a building*/
SELECT * FROM employees
where building is null;

/*Find the names of the buildings that hold no employees*/
SELECT DISTINCT building_name
FROM buildings 
  LEFT JOIN employees
    ON building_name = building
WHERE role IS NULL;


/*----------------------------------------LESSON 9 - Queries with expressions

Example query with expressions*/
SELECT particle_speed / 2.0 AS half_particle_speed
FROM physics_data
WHERE ABS(particle_position) * 10.0 > 500;

/*Select query with expression aliases*/
SELECT col_expression AS expr_description, …
FROM mytable;

/*Example query with both column and table name aliases*/
SELECT column AS better_column_name, …
FROM a_long_widgets_table_name AS mywidgets
INNER JOIN widget_sales
  ON mywidgets.id = widget_sales.widget_id
  
/*List all movies and their combined sales in millions of dollars*/  
SELECT title, (domestic_sales + international_sales)/1000000 as comb_sales
from movies
join boxoffice
    on movies.id = boxoffice.movie_id;  
  
/*List all movies and their ratings in percent*/ 
select title, rating * 10 as rating_percent
from movies
join boxoffice
    on movies.id = boxoffice.movie_id;

/*List all movies that were released on even number years*/	
select title, year
from movies
where year % 2 = 0;


/*----------------------------------------LESSON 10 - Queries with aggregates pt1

Select query with aggregate functions over all rows*/
SELECT AGG_FUNC(column_or_expression) AS aggregate_description, …
FROM mytable
WHERE constraint_expression;

COUNT(*), COUNT(column) 	/*A common function used to counts the number of rows in the group if no 
							column name is specified. Otherwise, count the number of rows in the group 
							with non-NULL values in the specified column.*/
MIN(column) 				/*Finds the smallest numerical value in the specified column for all rows in the group.*/
MAX(column) 				/*Finds the largest numerical value in the specified column for all rows in the group.*/
AVG(column) 				/*Finds the average numerical value in the specified column for all rows in the group.*/
SUM(column) 				/*Finds the sum of all numerical values in the specified column for the rows in the group.



Select query with aggregate functions over groups*/
SELECT AGG_FUNC(column_or_expression) AS aggregate_description, …
FROM mytable
WHERE constraint_expression
GROUP BY column;

/*Find the longest time that an employee has been at the studio*/
SELECT max(years_employed) FROM employees;

/*For each role, find the average number of years employed by employees in that role*/
SELECT role, AVG(years_employed) as Average_years_employed
FROM employees
GROUP BY role;

/*Find the total number of employee years worked in each building*/
SELECT building, sum(years_employed) as building_years
FROM employees
GROUP BY building;


/*----------------------------------------LESSON 11 - Queries with aggregates pt2

Select query with HAVING constraint*/
SELECT group_by_column, AGG_FUNC(column_expression) AS aggregate_result_alias, …
FROM mytable
WHERE condition
GROUP BY column
HAVING group_condition;

/*Find the number of Artists in the studio (without a HAVING clause)*/
SELECT role, COUNT(*) as Number_of_artists
FROM employees
WHERE role = "Artist";

/*Find the number of Employees of each role in the studio*/
SELECT role, COUNT(*) as Number_each_role
FROM employees
group by role;

/*Find the total number of years employed by all Engineers*/
SELECT sum(years_employed) as Engineers_Total_Years
FROM employees
where role like "engineer";
/*OR*/
SELECT role, SUM(years_employed)
FROM employees
GROUP BY role
HAVING role = "Engineer";


/*----------------------------------------LESSON 12 - Order of execution of a query


Complete SELECT query*/
SELECT DISTINCT column, AGG_FUNC(column_or_expression), …
FROM mytable
    JOIN another_table
      ON mytable.column = another_table.column
    WHERE constraint_expression
    GROUP BY column
    HAVING constraint_expression
    ORDER BY column ASC/DESC
    LIMIT count OFFSET COUNT;

/*Find the number of movies each director has directed*/
SELECT director, COUNT(id) as Num_movies_directed
FROM movies
GROUP BY director;

/*Find the total domestic and international sales that can be attributed to each director*/
SELECT director, sum(domestic_sales)+ sum(international_sales) as total_sales
FROM movies
	inner join boxoffice
    on movies.id = boxoffice.movie_id
GROUP BY director;


/*----------------------------------------LESSON 13 - Inserting rows
We've spent quite a few lessons on how to query for data in a database, 
so it's time to start learning a bit about SQL schemas and how to add new data.

What is a Schema?
We previously described a table in a database as a two-dimensional set of rows and 
columns, with the columns being the properties and the rows being instances of the 
entity in the table. In SQL, the database schema is what describes the structure of 
each table, and the datatypes that each column of the table can contain. 


You can insert multiple rows at a time by just listing them sequentially.*/
Insert statement with values for all columns
INSERT INTO mytable
VALUES (value_or_expr, another_value_or_expr, …),
       (value_or_expr_2, another_value_or_expr_2, …),
       …;

/*In some cases, if you have incomplete data and the table contains columns that 
support default values, you can insert rows with only the columns of data you 
have by specifying them explicitly.*/
Insert statement with specific columns
INSERT INTO mytable
(column, another_column, …)
VALUES (value_or_expr, another_value_or_expr, …),
      (value_or_expr_2, another_value_or_expr_2, …),
      …;
	   
/*In addition, you can use mathematical and string expressions with the values that you are inserting.
This can be useful to ensure that all data inserted is formatted a certain way.
Example Insert statement with expressions*/
INSERT INTO boxoffice
(movie_id, rating, sales_in_millions)
VALUES (1, 9.9, 283742034 / 1000000);
	   
/*Add the studio's new production, Toy Story 4 to the list of movies (you can use any director)*/
INSERT INTO Movies
(title, director, year, length_minutes)
VALUES ("Toy Story 4", "Jamie Ryan", 2017, 120);

/*Toy Story 4 has been released to critical acclaim! It had a rating of 8.7, and made 340 million 
domestically and 270 million internationally. Add the record to the BoxOffice table.*/
INSERT INTO Boxoffice VALUES (4, 8.7, 340000000, 270000000);	   


/*----------------------------------------LESSON 14 - Updating rows
In addition to adding new data, a common task is to update existing data, which can be done using 
an UPDATE statement. Similar to the INSERT statement, you have to specify exactly which table, 
columns, and rows to update. In addition, the data you are updating has to match the data type 
of the columns in the table schema.


Update statement with values*/
UPDATE mytable
SET column = value_or_expr, 
    other_column = another_value_or_expr, 
    …
WHERE condition;
/*The statement works by taking multiple column/value pairs, and applying those changes to each 
and every row that satisfies the constraint in the WHERE clause.

Taking care
Most people working with SQL will make mistakes updating data at one point or another. Whether it's 
updating the wrong set of rows in a production database, or accidentally leaving out the WHERE clause 
(which causes the update to apply to all rows), you need to be extra careful when constructing UPDATE 
statements.

One helpful tip is to always write the constraint first and test it in a SELECT query to make sure you 
are updating the right rows, and only then writing the column/value pairs to update.


The director for A Bug's Life is incorrect, it was actually directed by John Lasseter*/
UPDATE movies 
SET director = "John Lasseter"
WHERE title like "A bug's life";

/*The year that Toy Story 2 was released is incorrect, it was actually released in 1999*/
UPDATE movies
SET year = 1999
where id = 3;

/*Both the title and directory for Toy Story 8 is incorrect! The title should be "Toy Story 3" and it was directed by Lee Unkrich*/
UPDATE movies
SET title = "Toy Story 3", director = "Lee Unkrich"
WHERE id = 11;


/*----------------------------------------LESSON 15 - Deleting rows

Delete statement with condition*/
DELETE FROM mytable
WHERE condition;

/*Taking extra care

Like the UPDATE statement from last lesson, it's recommended that you run the constraint in a SELECT 
query first to ensure that you are removing the right rows. Without a proper backup or test database, 
it is downright easy to irrevocably remove data, so always read your DELETE statements twice and execute once.


This database is getting too big, lets remove all movies that were released before 2005.*/
DELETE FROM Movies
where year < 2005

/*Andrew Stanton has also left the studio, so please remove all movies directed by him.*/
DELETE FROM movies
where director like "andrew stanton";


/*----------------------------------------LESSON 16 - Creating TABLESPACE

Create table statement w/ optional table constraint and default value*/
CREATE TABLE IF NOT EXISTS mytable (
    column DataType TableConstraint DEFAULT default_value,
    another_column DataType TableConstraint DEFAULT default_value,
    …
);

/*The structure of the new table is defined by its table schema, which defines a series of columns. 
Each column has a name, the type of data allowed in that column, an optional table constraint on 
values being inserted, and an optional default value.

If there already exists a table with the same name, the SQL implmentation will usually throw an error, 
so to suppress the error and skip creating a table if one exists, you can use the IF NOT EXISTS clause.


Here's an example schema for the Movies table that we've been using in the lessons up to now.
Movies table schema*/
CREATE TABLE movies (
    id INTEGER PRIMARY KEY,
    title TEXT,
    director TEXT,
    year INTEGER, 
    length_minutes INTEGER
);
/*Create a new table named Database with the following columns:

– Name A string (text) describing the name of the database
– Version A number (floating point) of the latest version of this database
– Download_count An integer count of the number of times this database was downloaded
This table has no constraints. */

CREATE TABLE Database (
	Name text,
	Version float,
	Download_Count integer
	
);

/*----------------------------------------LESSON 17 - Altering TABLES
As your data changes over time, SQL provides a way for you to update your corresponding 
tables and database schemas by using the ALTER TABLE statement to add, remove, or modify 
columns and table constraints.

Adding columns:
The syntax for adding a new column is similar to the syntax when creating new rows in the 
CREATE TABLE statement. You need to specify the data type of the column along with any 
potential table constraints and default values to be applied to both existing and new rows. 
In some databases like MySQL, you can even specify where to insert the new column using the 
FIRST or AFTER clauses, though this is not a standard feature.

Altering table to add new column(s):*/
ALTER TABLE mytable
ADD column DataType OptionalTableConstraint 
    DEFAULT default_value;


/*Removing columns:
Dropping columns is as easy as specifying the column to drop, however, many databases (including Postgres, 
and SQLite) don't support this feature. Instead you may have to create a new table and migrate the data over.
Altering table to remove column(s)*/
ALTER TABLE mytable
DROP column_to_be_deleted;

/*Renaming the table:
If you need to rename the table itself, you can also do that using the RENAME TO clause of the statement.*/
Altering table name
ALTER TABLE mytable
RENAME TO new_table_name;

/*Other changes
Each database implementation supports different methods of altering their tables, so it's always best to 
consult your database docs before proceeding: MySQL, Postgres, SQLite, Microsoft SQL Server.


Add a column named Aspect_ratio with a FLOAT data type to store the aspect-ratio each movie was released in.*/
ALTER TABLE Movies
ADD Aspect_Ratio float after Length_minutes;

/*Add another column named Language with a TEXT data type to store the language that the movie was released 
in. Ensure that the default for this language is English.*/
ALTER TABLE Movies
ADD Language TEXT
	DEFAULT English;
	
/*----------------------------------------LESSON 17 - Altering TABLES	
In some rare cases, you may want to remove an entire table including all of its data and metadata, and to do 
so, you can use the DROP TABLE statement, which differs from the DELETE statement in that it also removes the 
table schema from the database entirely.

Drop table statement*/
DROP TABLE IF EXISTS mytable;

/*Like the CREATE TABLE statement, the database may throw an error if the specified table does not exist, and 
to suppress that error, you can use the IF EXISTS clause.

In addition, if you have another table that is dependent on columns in table you are removing (for example, 
with a FOREIGN KEY dependency) then you will have to either update all dependent tables first to remove the 
dependent rows or to remove those tables entirely.


We've sadly reached the end of our lessons, lets clean up by removing the Movies table*/
DROP TABLE IF EXISTS Movies;

/*And drop the BoxOffice table as well*/
DROP TABLE IF EXISTS Boxoffice;
	
/*---------------------------------------end of tutorial
	
	
	
-----------------------------------------INTERMEDIATE TOPICS
You might have noticed that even with a complete query, there are many questions that we can't answer about 
our data without additional post, or pre, processing. In these cases, you can either make multiple queries 
and process the data yourself, or you can build a more complex query using SQL subqueries.	

-----------------------------------------------------------GENERAL SUBQUERY

Lets say your company has a list of all Sales Associates, with data on the revenue that each Associate brings 
in, and their individual salary. Times are tight, and you now want to find out which of your Associates are 
costing the company more than the average revenue brought per Associate.

First, you would need to calculate the average revenue all the Associates are generating:*/	
SELECT AVG(revenue_generated)
FROM sales_associates;

/*And then using that result, we can then compare the costs of each of the Associates against that value. 
To use it as a subquery, we can just write it straight into the WHERE clause of the query:*/
SELECT *
FROM sales_associates
WHERE salary > 
   (SELECT AVG(revenue_generated)
    FROM sales_associates);
/*As the constraint is executed, each Associate's salary will be tested against the value queried from the inner subquery. 
	
A subquery can be referenced anywhere a normal table can be referenced. Inside a FROM clause, you can JOIN subqueries 
with other tables, inside a WHERE or HAVING constraint, you can test expressions against the results of the subquery, 
and even in expressions in the SELECT clause, which allow you to return data directly from the subquery. They are generally 
executed in the same logical order as the part of the query that they appear in, as described in the last lesson.

Because subqueries can be nested, each subquery must be fully enclosed in parentheses in order to establish proper hierarchy. 
Subqueries can otherwise reference any tables in the database, and make use of the constructs of a normal query (though some 
implementations don't allow subqueries to use LIMIT or OFFSET).

----------------------------------------------------------CORRELATED SUBQUERIES

A more powerful type of subquery is the correlated subquery in which the inner query references, and is dependent on, a column 
or alias from the outer query. Unlike the subqueries above, each of these inner queries need to be run for each of the rows in 
the outer query, since the inner query is dependent on the current outer query row.
Example: Correlated subquery

Instead of the list of just Sales Associates above, imagine if you have a general list of Employees, their departments (engineering, 
sales, etc.), revenue, and salary. This time, you are now looking across the company to find the employees who perform worse than 
average in their department.

For each employee, you would need to calculate their cost relative to the average revenue generated by all people in their department. 
To take the average for the department, the subquery will need to know what department each employee is in:*/

SELECT *
FROM employees
WHERE salary > 
   (SELECT AVG(revenue_generated)
    FROM employees AS dept_employees
    WHERE dept_employees.department = employees.department);

/*These kinds of complex queries can be powerful, but also difficult to read and understand, so you should take care using them. If 
possible, try and give meaningful aliases to the temporary values and tables. In addition, correlated subqueries can be difficult to 
optimize, so performance characteristics may vary across different databases.


--------------------------------------------------------------EXISTENCE TESTS

When we introduced WHERE constraints in Lesson 2: Queries with constraints, the IN operator was used to test whether the column value 
in the current row existed in a fixed list of values. In complex queries, this can be extended using subqueries to test whether a column 
value exists in a dynamic list of values.
Select query with subquery constraint*/
SELECT *, …
FROM mytable
WHERE column
    IN/NOT IN (SELECT another_column
               FROM another_table);

/*When doing this, notice that the inner subquery must select for a column value or expression to produce a list that the outer column value 
can be tested against. This type of constraint is powerful when the constraints are based on current data.
	
	
	
-------------------------------------------------------------Unions, Intersections & Exceptions

When working with multiple tables, the UNION and UNION ALL operator allows you to append the results of one query to another assuming that 
they have the same column count, order and data type. If you use the UNION without the ALL, duplicate rows between the tables will be 
removed from the result.
Select query with set operators*/
SELECT column, another_column
   FROM mytable
UNION / UNION ALL / INTERSECT / EXCEPT
SELECT other_column, yet_another_column
   FROM another_table
ORDER BY column DESC
LIMIT n;

/*In the order of operations as defined in Lesson 12: Order of execution, the UNION happens before the ORDER BY and LIMIT. It's not common 
to use UNIONs, but if you have data in different tables that can't be joined and processed, it can be an alternative to making multiple 
queries on the database.

Similar to the UNION, the INTERSECT operator will ensure that only rows that are identical in both result sets are returned, and the EXCEPT 
operator will ensure that only rows in the first result set that aren't in the second are returned. This means that the EXCEPT operator is 
query order-sensitive, like the LEFT JOIN and RIGHT JOIN.

Both INTERSECT and EXCEPT also discard duplicate rows after their respective operations, though some databases also support INTERSECT ALL and 
EXCEPT ALL to allow duplicates to be retained and returned.*/









/*------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------MY OWN SNIPPETS--------------------------------------------




filled av_wind_dir column in dialtest:*/
update public.tbl_locations 
set av_wind_dir = 80.47

/*added av_wind_speed column in dialtest:*/
ALTER TABLE public.tbl_locations
ADD av_wind_speed NUMERIC 
	DEFAULT 30.0;	




	