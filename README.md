# CS157A_ecommerce

The CS157A_Project.sql file contains the SQL code required to create the database and the tables as per the design specification in the Design section and Implementation and Testing section of the proposal 

The Sample_inputs.sql file contains all the sample input data used during testing.

The Views.sql file contains all the SELECT SQL statements created for all the view requirements specified in the Design section and Implementation and Testing section of the proposal. 

# Deploy Database using Preconfigured Docker Image

Assuming that docker is installed on your machine.

There are two docker images available. One image only contains the configured tables: "linraymond/cs157a_sql_database_no_sample_data". Another image contains the tables and sample data: "linraymond/cs157a_sql_database_with_sample_data".

To pull the docker image with only the configured tables: 

```
docker pull linraymond/cs157a_sql_database_no_sample_data
```

To pull the docker image with the configured tables and sample data:

```
docker pull linraymond/cs157a_sql_database_with_sample_data
```

Both docker containers have a password for the root user set to "changeme-security" without quotes. It is highly recommended to change the root password to something more secure.

