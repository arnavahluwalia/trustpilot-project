# trustpilot-project

In this project, I work from three text files that contain scraped property data from Rightmove. These files are parsed by a python script, and ingested into BigQuery. After that, DBT is run to test and transform the data and create data marts. Finally, looker is used to visualize the data.

[![](https://mermaid.ink/img/pako:eNqNVNFu2jAU_RXLFdUmQQmgboKiSKUJTzy0Be0lmSYnuQGvIaa2M8oo_z7bCSEJY6sfIvv6HN97Tq69xyGLAI9wnLBtuCJcotmznyI1RBYsOdms0E_BUm8c2A6RBM1ZxkMQ425gf89xekSUQygpS9FicopqouVtONsAlxTEj96NfJMVWuemY0C9Kqh_AdSvggYVEKRRPtEoDbcRvElOQtkQUkQ9Hys1br5AnzY7uWLpZ63Ix__VBN4j4QLQlCYg0LVicfuRgypNuSKQ9qhZVpk_eNU2TujyKQO--5CFG0623jPZmoPHAe9WKUpAKmLG1xDpbW9xWp_wY2rPJeFoHq5gTcZdap_qQ8WssKLTsd9njETvJq1enlIQXVpDT30zt9WZLD7oZKtVZikLP-2WIaNKT9A1WoCodkarVSsxd6Fhfr1GdJHQCBrgjLEX4Pv9NyoyktDf5oijqb8oKQDa08PBL9xBYUKEcCBGyqQdimmSjK7iOG4LyRV6dDUcDu-a0CDJoIC6X1xnel-ivw6GE_f2jLCDRF3YgjJVw3FLSr68Oy8HID0mcaYP7rRk9CbDh_55VUx5soQyiWs595Ukt9bAukDpX-Lo5V_Ek_ClYAwGgxJuWVY7ZAnjxr8azVz1tnlfzLdvvj1jeR3Y_K_GhTokeDX-14OmN_9xXN5Oudw6pOzcoxn17bxn2gue665vQvFjVRS38RpUHhqp13mvUT6W6gqDj0dqGkFMskT62E8PCkoyyea7NMQjyTNo42wTEQkOJUrCGo9ikgg4_AGQBOd9?type=png)](https://mermaid.live/edit#pako:eNqNVNFu2jAU_RXLFdUmQQmgboKiSKUJTzy0Be0lmSYnuQGvIaa2M8oo_z7bCSEJY6sfIvv6HN97Tq69xyGLAI9wnLBtuCJcotmznyI1RBYsOdms0E_BUm8c2A6RBM1ZxkMQ425gf89xekSUQygpS9FicopqouVtONsAlxTEj96NfJMVWuemY0C9Kqh_AdSvggYVEKRRPtEoDbcRvElOQtkQUkQ9Hys1br5AnzY7uWLpZ63Ix__VBN4j4QLQlCYg0LVicfuRgypNuSKQ9qhZVpk_eNU2TujyKQO--5CFG0623jPZmoPHAe9WKUpAKmLG1xDpbW9xWp_wY2rPJeFoHq5gTcZdap_qQ8WssKLTsd9njETvJq1enlIQXVpDT30zt9WZLD7oZKtVZikLP-2WIaNKT9A1WoCodkarVSsxd6Fhfr1GdJHQCBrgjLEX4Pv9NyoyktDf5oijqb8oKQDa08PBL9xBYUKEcCBGyqQdimmSjK7iOG4LyRV6dDUcDu-a0CDJoIC6X1xnel-ivw6GE_f2jLCDRF3YgjJVw3FLSr68Oy8HID0mcaYP7rRk9CbDh_55VUx5soQyiWs595Ukt9bAukDpX-Lo5V_Ek_ClYAwGgxJuWVY7ZAnjxr8azVz1tnlfzLdvvj1jeR3Y_K_GhTokeDX-14OmN_9xXN5Oudw6pOzcoxn17bxn2gue665vQvFjVRS38RpUHhqp13mvUT6W6gqDj0dqGkFMskT62E8PCkoyyea7NMQjyTNo42wTEQkOJUrCGo9ikgg4_AGQBOd9)



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
