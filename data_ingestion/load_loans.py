# data_ingestion/load_loans.py

import pandas as pd
from data_ingestion.snowflake_connector import SnowflakeConnector

def main():
    df = pd.read_csv("data/loans.csv")
    connector = SnowflakeConnector()
    connector.upload_dataframe(df, "LOANS")
    connector.close()

if __name__ == "__main__":
    main()