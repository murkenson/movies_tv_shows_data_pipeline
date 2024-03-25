expectations_json = [
    {
        "expectation_type": "expect_table_columns_to_match_set",
        "kwargs": {
            "column_set": [
                "show_id",
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
                "description",
            ]
        }
    }
]


@extension("great_expectations", expectations=expectations_json)
def validate(validator, *args, **kwargs):
    pass
