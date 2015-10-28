# Challenge 8.5: More Schemas
#### By Jeff George, 10/28/15<br>for Dev Bootcamp Phase 0

## Release 2: Create a One-to-one Schema
![One-to-One Schema](./imgs/one-to-one_schema.png)

## Release 3: Many to Many Relationships
![Many-to-Many Schema](./imgs/many-to-many_schema.png)

## Release 4: Refactor
![Grocery List Schema](./imgs/grocery_schema.png)

## Release 6: Reflect

#### What is a one-to-one database?

A one-to-one relationship between tables in a database exists when each record in each table is related to one and only one record in the other table. They are connected by a foreign key in the child table, which points to the primary key in the parent table.


#### When would you use a one-to-one database? (Think generally, not in terms of the example you created).

A one-to-one relationship would be appropriate when it would be possible to combine the tables into a single table, but doing so is not desireable. This occurs when the values which belong to the values of the parent table are related closely to one another, but are not _required_ by the child table. Essentially, the parent table holds keys and values that are optional or extra to the child table. For example, if the child table holds "states", the parent table might hold "international_airports". For states that have an international airport, the value the field "intl_airport_id" would point to the primary key (the id) of the record for that state's international airport in the international_airports table, which might hold integer values for the number of flights per day to and from all major foreign countrys. (This value would most likely be set to default to 0, and need to be set with precised data for each country with connections to the state's airport.)


#### What is a many-to-many database?

A many-to-many relationship exists between two tables when any number of records in one table may be related to any number of records in the other table.


#### When would you use a many-to-many database? (Think generally, not in terms of the example you created).




#### What is confusing about database schemas? What makes sense?