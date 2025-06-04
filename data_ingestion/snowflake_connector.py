# data_ingestion/snowflake_connector.py

import snowflake.connector
import pandas as pd
import os
from data_ingestion.config import SNOWFLAKE_CONFIG

class SnowflakeConnector:
    def _init_(self):
        self.ctx = snowflake.connector.connect(**SNOWFLAKE_CONFIG)
        self.cursor = self.ctx.cursor()

    def upload_dataframe(self, df: pd.DataFrame, table_name: str):
        """Creates a table and uploads the DataFrame into Snowflake."""
        columns = ", ".join([f"{col} STRING" for col in df.columns])
        create_stmt = f"CREATE OR REPLACE TABLE {table_name} ({columns});"
        self.cursor.execute(create_stmt)

        for _, row in df.iterrows():
            values = "', '".join(map(str, row.values))
            insert_stmt = f"INSERT INTO {table_name} VALUES ('{values}');"
            self.cursor.execute(insert_stmt)

        print(f"Table '{table_name}' loaded successfully.")

    def close(self):
        self.cursor.close()
        self.ctx.close()