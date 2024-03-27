import shutil
from os import getenv


if 'custom' not in globals():
    from mage_ai.data_preparation.decorators import custom
if 'test' not in globals():
    from mage_ai.data_preparation.decorators import test


@custom
def transform_custom(*args, **kwargs):
    """
    args: The output from any upstream parent blocks (if applicable)

    Returns:
        Anything (e.g. data frame, dictionary, array, int, str, etc.)
    """
    BASE_DIR =  getenv("BASE_DIR_FOR_LOAD_DATA")

    shutil.rmtree(BASE_DIR)
    print(f'Deleted {BASE_DIR}!')# Specify your custom logic here



