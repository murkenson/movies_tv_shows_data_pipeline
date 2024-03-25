import datetime
import os
from os import path, getenv
import shutil

from google.cloud import storage

if "data_exporter" not in globals():
    from mage_ai.data_preparation.decorators import data_exporter


@data_exporter
def export_data(*args, **kwargs):
    """
    Exports data to some source.

    Args:
        data: The output from the upstream parent block
        args: The output from any additional upstream blocks (if applicable)

    Output (optional):
        Optionally return any object and it'll be logged and
        displayed when inspecting the block run.
    """

    #print(kwargs)

    PLATFORM_NAME = kwargs["object_key"]

    BASE_DIR = "data/"

    # Specify your data exporting logic here
    if not os.path.isdir(BASE_DIR):
        raise FileNotFoundError(f"{BASE_DIR} not exist")

    storage_client = storage.Client()

    BUCKET_NAME = getenv("GCS_BUCKET_NAME")

    print(f"The current bucket name is: {BUCKET_NAME}")

    bucket = storage_client.bucket(f"{BUCKET_NAME}")

    parquet_file = f"{PLATFORM_NAME}.parquet"

    parquet_file_path = os.path.join(BASE_DIR, parquet_file)

    blob_path = f"data/movies_tv_shows/{parquet_file}"

    print(f"Loading {parquet_file_path} to {blob_path} ...")

    bucket.blob(blob_path).upload_from_filename(parquet_file_path)

    return  parquet_file
