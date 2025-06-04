# data_ingestion/load_customers.py

import pandas as pd
from data_ingestion.snowflake_connector import SnowflakeConnector

def main():
    df = pd.read_csv("data/customers.csv")
    connector = SnowflakeConnector()
    connector.upload_dataframe(df, "CUSTOMERS")
    connector.close()

if __name__ == "__main__":
    main()