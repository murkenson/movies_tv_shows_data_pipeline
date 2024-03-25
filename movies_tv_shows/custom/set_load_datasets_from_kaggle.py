from typing import Dict, List

@custom
def load_data(*args, **kwargs) -> List[List[Dict]]:
    datasets = [
        {
            "name": "full-tmdb-tv-shows-dataset-2023-150k-shows",
            "created_by": "asaniczka",
        },
        {"name": "tmdb-movies-dataset-2023-930k-movies", "created_by": "asaniczka"},
        # Add more datasets here if needed
    ]

    metadata = []

    # Add metadata for each dataset
    for dataset_info in datasets:
            metadata.append({"block_uuid": f'for dataset {dataset_info["name"]}'})

    return [datasets, metadata]