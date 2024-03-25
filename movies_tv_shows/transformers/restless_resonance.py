from typing import Dict, List


@transformer
def transform(data, *args, **kwargs):
    return [data]