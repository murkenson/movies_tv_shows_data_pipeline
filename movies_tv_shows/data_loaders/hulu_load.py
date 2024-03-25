import os
import subprocess
import zipfile
from pathlib import Path
import pandas as pd
from pathlib import Path
from kaggle.api.kaggle_api_extended import KaggleApi

if 'data_loader' not in globals():
    from mage_ai.data_preparation.decorators import data_loader

if 'test' not in globals():
    from mage_ai.data_preparation.decorators import test

@data_loader
def load_data(*args, **kwargs):
    """
    Template code for loading data from any source.

    Returns:
        Anything (e.g. data frame, dictionary, array, int, str, etc.)
    """

    BASE_DIR = "data/"
    DATASET_NAME = "hulu-movies-and-tv-shows"
    dataset_path = os.path.join(BASE_DIR, DATASET_NAME + ".zip")

    try:
        result = subprocess.run(['kaggle', 'datasets', 'download', '-p', BASE_DIR, f'shivamb/{DATASET_NAME}'], capture_output=True, text=True)
        if result.returncode == 0:
            print("Dataset downloaded successfully.")
            print(result.stdout)
            # Rename the downloaded file to include dataset name
            os.rename(os.path.join(BASE_DIR, f'{DATASET_NAME}.zip'), dataset_path)
            print("Dataset saved to:", dataset_path)
            # Extract the dataset
            with zipfile.ZipFile(dataset_path, "r") as zip_ref:
                zip_ref.extractall(BASE_DIR)
                print("Dataset extracted to:", BASE_DIR)
            df = pd.read_csv(dataset_path)
            return df
        else:
            print("Error downloading dataset:")
            print(result.stderr)
    except Exception as e:
        print("Exception occurred while downloading dataset:")
        print(str(e))

