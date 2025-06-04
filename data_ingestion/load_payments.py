# data_ingestion/load_payments.py

import pandas as pd
from data_ingestion.snowflake_connector import SnowflakeConnector

def main():
    df = pd.read_csv("data/payments.csv")
    connector = SnowflakeConnector()
    connector.upload_dataframe(df, "PAYMENTS")
    connector.close()

if __name__ == "__main__":
    main()