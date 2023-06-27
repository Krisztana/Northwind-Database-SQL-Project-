## Northwind-Database Project

This repository contains an analysis of the Northwind Database, including a sample database commonly shipped along with Microsoft Access. The dataset represents a fictional company called "Northwind Traders" and contains records of sales transactions between the company and its customers and information about purchases from Northwind's suppliers.


**Dataset**

The dataset provides comprehensive data about the operations of Northwind Traders, allowing for detailed analysis and exploration. It consists of various CSV files containing relevant information related to sales, customers, suppliers, products, etc. These CSV files can be found in the [northwind_data folder](https://github.com/Krisztana/Northwind-Database/tree/main/northwind_data).

**Challenge description**

The main tasks accomplished in this project include:

* Creating a Postgres database
* Designing and creating tables within the database
* Writing SQL queries to retrieve specific data from the database
* Loading CSV files into the database
* Building a dashboard to visualize the data
* Uploading the project to a cloud server

During the project, I utilized [pgAdmin](https://www.pgadmin.org) to create the database, and tables, and execute queries. Additionally, an [RDS instance](https://aws.amazon.com/rds/) was set up to establish a connection with [Metabase](https://www.metabase.com/) and create the dashboard.



**Project Files**

The following files are available in this repository:

* create_tables.sql: Used to create the necessary tables in the database.
* analyze_northwind.sql: Contains SQL queries to answer specific questions related to the dataset.
* northwind_metabase.sql: Consists of SQL queries used to build the dashboard in Metabase.

**Conclusion**

This project aims to provide valuable insights into the fictional company's sales and purchase data by leveraging the Northwind Database and implementing various SQL queries and table creations. The accompanying dashboard created in Metabase allows for a comprehensive and interactive analysis of the dataset.  
