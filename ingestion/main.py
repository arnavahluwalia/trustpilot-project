import pandas as pd
import numpy as np
from google.cloud import bigquery
from google.oauth2 import service_account
import pandas_gbq
import json
from typing import List

# Read table schema from json file
def getTableSchema() -> List[str]:
    with open('properties_raw_schema.json') as fd:
     json_data = json.load(fd)
     return json_data

# Load json from file into a pandas dataframe
def readJson(path: str) -> pd.DataFrame:
    df = pd.read_json(path, encoding = 'utf-8-sig', orient="split")
    return df

# The data needs some preprocessing before it can be loaded
def preprocessDataFrame(df) -> pd.DataFrame:
    df = df.rename(columns={'Full Description':'full_description', 'Agent Name':'agent_name', 'Agent Address':'agent_address'})
    df['latitude'] = pd.to_numeric(df['latitude'], errors='coerce').astype('float64')
    df['longitude'] = pd.to_numeric(df['longitude'], errors='coerce').astype('float64')
    df['price'] = pd.to_numeric(df['price'], errors='coerce').astype('float64')
    df['maxSizeFt'] = pd.to_numeric(df['maxSizeFt'], errors='coerce').astype('float64')
    df['number_bedrooms'] = pd.to_numeric(df['number_bedrooms'], errors='coerce').astype('float64')
    df['retirement'] = df['retirement'].replace('', False).astype('bool')
    
    return df

# Ensure that the dataframe conforms to the schema and datatypes we expect
def assertDataFrame(df):
    table_schema = getTableSchema()
    
    # Ensure that the schema of the file is as expected
    assert (len(df.columns) == len(table_schema))
    for col in table_schema:
        assert (col['name'] in df.columns)
    
    # Assert column types are as expected
    assert (df['price'].dtype == np.dtype('float64'))
    assert (df['number_bedrooms'].dtype == np.dtype('float64'))
    assert (df['longitude'].dtype == np.dtype('float64'))
    assert (df['latitude'].dtype == np.dtype('float64'))
    assert (df['maxSizeFt'].dtype == np.dtype('float64'))
    assert (df['retirement'].dtype == np.dtype('bool'))

# Load a dataframe into our properties_raw table in bigquery
# Creates the table with the specified schema if it doesn't exist
def load_to_gcp(df):
    table_schema = getTableSchema()
    credentials = service_account.Credentials.from_service_account_file('credentials.json')
    project_id = 'property-data-analysis'
    pandas_gbq.context.credentials = credentials
    pandas_gbq.context.project = project_id
    pandas_gbq.to_gbq(df, 'properties_dataset.properties_raw', if_exists='append', table_schema=table_schema)

# Read json -> preprocess -> ensure data looks right -> load into bigquery
files = ['properties_1.txt', 'properties_2.txt', 'properties_3.txt']
for file in files:
    df = readJson(file)
    df = preprocessDataFrame(df)
    assertDataFrame(df)
    load_to_gcp(df)
