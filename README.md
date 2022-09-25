## Northwind-Database

It was our project on the 6th week of the Bootcamp.

## Dataset

It is a sample database that is shipped along with Microsoft Access. The data is about “Northwind Traders”, a fictional company. The database contains all sales transactions between the company and its customers as well as purchases from Northwinds suppliers.

All the the csv files are available in the [northwind_data folder](https://github.com/Krisztana/Northwind-Database/tree/main/northwind_data).

### Challenge description

The tasks were :

    * to create a Postgres database
    
    * to create tables in a database
    
    * to write SQL queries to retrieve data
    
    * to load CSV files into a database
    
    * to build a dashboard
    
    * to upload everything into a cloud server


At this project, I used [pgAdmin](https://www.pgadmin.org) to create the database, the tables and also to run some queries. 
As the next step, I did set up an [RDS instance](https://aws.amazon.com/rds/) to be able to conect to [Metabase](https://www.metabase.com/) and build the dashboard. 

My files: 

* create_tables - used to create the tables in the database

* analyze_nortwind - SQL queries to answer the questions

* northwind_metabase - SQL queries to build the dashboard on Metabase
