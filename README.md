# trustpilot-project

In this project, I work from three text files that contain scraped property data from Rightmove. These files are parsed by a python script, and ingested into BigQuery. After that, DBT is run to test and transform the data and create data marts. Finally, looker is used to visualize the data.



## Python Ingestion Installation and Setup
1. Install dependencies used by the python script

        pip3 install numpy
        pip3 install pandas
        pip3 install pandas-gbq
        pip3 install google-cloud

3. Run python ingestion

        python3 main.py


## dbt Installation and Setup

1. Clone the repository. Create a virtual environment (preferred) before completing the next steps.

2. To install `dbt-bigquery`, follow the instructions [here](https://docs.getdbt.com/docs/core/pip-install).
3. To install `dbt-utils`, make sure you have the packages.yml file in the root folder and run the following command in the terminal.

        dbt deps

4. To connect dbt to your Google Cloud project using a service account file, follow the instructions [here](https://docs.getdbt.com/docs/core/connect-data-platform/bigquery-setup). This step will generate a profiles.yml file. 

## Running the model, tests

1. To run the model, run the following command:

        dbt run

2. To test the model, run

        dbt test

3. To run and test the model, run

        dbt build

## View Docs

To view the dbt docs, run 

    dbt docs generate

Once the catalog.json file is created, run

    dbt docs serve

This will open up the documentation locally and you can view the description, tests, lineage.
