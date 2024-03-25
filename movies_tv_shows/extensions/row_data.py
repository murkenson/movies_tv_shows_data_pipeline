expectations_json = [
    {
        "expectation_type": "expect_table_row_count_to_be_between",
        "kwargs": {"min_value": 1},
    }
]


@extension("great_expectations", expectations=expectations_json)
def validate(validator, *args, **kwargs):
    pass
