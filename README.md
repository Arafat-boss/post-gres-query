1. What is PostgreSQL?
PostgreSQL is an open-source, powerful, and advanced object-relational database management system (ORDBMS). It supports both SQL (relational) and JSON (non-relational) querying.
Key features include:
ACID compliance (Atomicity, Consistency, Isolation, Durability)
Extensibility (you can define your own data types, functions, etc.)
Support for advanced data types like arrays, store, JSONB, and XML
Concurrency without read locks via MVCC (Multifermion Concurrency Control)
Strong community and cross-platform support


2. What is the purpose of a database schema in PostgreSQL?
A schema in PostgreSQL is a namespace that holds named database objects like tables, views, indexes, functions, etc.
Purpose of a schema:
Organizes objects logically (like folders)
Allows multiple users/applications to use the same database without name conflicts
Supports security by controlling access to groups of objects
Enables versioning or separation of environments (e.g., public, test, dev, prod)


3. Explain the Primary Key and Foreign Key concepts in PostgreSQL.
Primary Key:
A column or group of columns that uniquely identifies each row in a table.
Must be unique and not null.
A table can have only one primary key.


4. The UPDATE statement in PostgreSQL is used to modify existing records in a table. It allows you to change the values of one or more columns for specific rows, based on a condition.


5. Explain the purpose of the WHERE clause in a SELECT statement.
The WHERE clause filters rows in a query based on specific conditions. It is used to retrieve only the rows that meet the criteria.
