import os
import subprocess
import zipfile
from pathlib import Path
import pandas as pd
from pathlib import Path
from os import getenv
from kaggle.api.kaggle_api_extended import KaggleApi

if "data_loader" not in globals():
    from mage_ai.data_preparation.decorators import data_loader

if "test" not in globals():
    from mage_ai.data_preparation.decorators import test


@data_loader
def load_data(datasets, *args, **kwargs):
    """
    Template code for loading data from any source.

    Returns:
        Anything (e.g. data frame, dictionary, array, int, str, etc.)
    """

    BASE_DIR =  getenv("BASE_DIR_FOR_LOAD_DATA")
    DATASET_NAME = datasets["name"]
    CREATED_BY = datasets["created_by"]
    
    DATASET_PATH = os.path.join(BASE_DIR, DATASET_NAME + ".zip")
    
    metadata = []

    try:
        result = subprocess.run(
            [
                "kaggle",
                "datasets",
                "download",
                "-p",
                BASE_DIR,
                f"{CREATED_BY}/{DATASET_NAME}",
                #shivamb
            ],
            capture_output=True,
            text=True,
        )
        if result.returncode == 0:
            print("Dataset downloaded successfully.")
            # Rename the downloaded file to include dataset name
            os.rename(os.path.join(BASE_DIR, f"{DATASET_NAME}.zip"), DATASET_PATH)
            print("Dataset saved to:", DATASET_PATH)
            # Extract the dataset
            with zipfile.ZipFile(DATASET_PATH, "r") as zip_ref:
                zip_ref.extractall(BASE_DIR)
                print("Dataset extracted to:", BASE_DIR)
            df = pd.read_csv(DATASET_PATH)
            
            
            df.to_parquet(f"{BASE_DIR}{DATASET_NAME}.parquet")

            
            df_new = pd.read_csv(DATASET_PATH, nrows=5)
            metadata.append(dict(object_key=f'{DATASET_NAME}'))
            return [df_new, metadata]
        else:
            print("Error downloading dataset:")
    except Exception as e:
        print("Exception occurred while downloading dataset:")





"""
@test
def test_dataframe_structure(df,  *args) -> None:
    
    # Define the expected columns
    expected_columns = [                "show_id",
                "type",
                "title",
                "director",
                "cast",
                "country",
                "date_added",
                "release_year",
                "rating",
                "duration",
                "listed_in",
                "description",]
    
    # Check if all expected columns exist in the DataFrame
    for column in expected_columns:
        assert column in df.columns, f"Column '{column}' is missing in the DataFrame."

"""