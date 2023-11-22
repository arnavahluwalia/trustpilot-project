# Trustpilot Project

In this project, I work with three text files that contain scraped property data in JSON format from Rightmove. These files are parsed by a python script, and ingested into BigQuery. After that, dbt is run to test, transform, and enrich the data. Finally, Looker Studio is used to visualize the data and gain key insights. 

<img width="887" alt="Screenshot 2023-11-22 at 9 13 02 AM" src="https://github.com/arnavahluwalia/trustpilot-project/assets/117514353/0f1cc778-d63f-4a75-be15-5732f358d020">


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

1. To run the model, run the command:

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

This will open up the documentation locally and you can view the description, tests and data lineage.
