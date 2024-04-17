# This is the final project for [Data Engineering Zoomcamp](https://github.com/DataTalksClub/data-engineering-zoomcamp) by [DataTalks Club](https://datatalks.club)  🚀😤


## Table of Contents

- [Introduction](#introduction)
   - [Overview](#overview)
   - [Problem description](#problem-description)
- [Technologies](#technologies)
- [Data Source](#data-source)
- [Reproducability](#reproducability)
- [Future Improvements](#future-improvements)
- [Credits](#credits)



## Introduction

### Overview

**Movies and TV shows on streaming platforms 🎥🍿**

![Movies and TV shows](/recreate_project/static/040_project_logo.svg)

I really enjoy watching movies and TV shows, and I recently watched `Dune 2` and `Gentlemen` on Netflix. It was fantastic! 

For my final project as part of the Data Engineering Zoomcamp 2024 program, I have selected two TMDB (The Movie Database) datasets from Kaggle: 

- The Full TMDb TV Shows Dataset for 2024 
- The full TMDb Movies Dataset for 2024

These datasets provide comprehensive information about various movies and TV shows, including ratings, genres, cast, and more.

I will be focusing my analysis on these platforms: 

- Netflix
- Amazon Prime
- Disney+
- Hulu


### Problem description


1. **Platform Content Overview**: Analysis of TV shows and movies available on each platform.
2. **Decadal Distribution of Releases**: Examination of the distribution of TV shows and movies by their release years over the last ten years, categorized by platform.
3. **Genre Dominance by Platform**: Identification of the top five prevalent genres on each platform.
4. **Episodic Excellence**: Ranking the top 10 TV shows on each platform based on the number of episodes.
5. **Film Length Leaders**: Ranking the top 10 movies on each platform by their runtime duration.

## Dashboard

You can view the dashboard [here](https://lookerstudio.google.com/reporting/7ef1cb87-8bd6-4b62-8946-3ea0e79a7ea6).

> [!NOTE]
After completing the course, I have deleted all the data, so there is nothing left on the dashboard.

![](/recreate_project/static/060_lookerstudio_report.gif)


Also it is saved as a static PDF [here](/recreate_project/static/061_lookerstudio_report.pdf).


## Technologies

The selected technologies for this project include:

- **Cloud:** Google Cloud Platform (GCP)
- **Data Lake (DL):** Google Cloud Storage (GCS)
- **Data Warehouse (DWH):** BigQuery
- **Infrastructure as Code (IaC):** Terraform
- **Workflow Orchestration:** Mage AI
- **Transforming Data:** DBT (data build tool)
- **Data Visualization:** Looker Studio

![Architecture diagram](/recreate_project/static/050_data_pipeline_architecture.png)

> [!NOTE]
 For Partitioning, tables larger than 100 Gb are chosen, and for Clustering tables larger than 10 Gb are chosen. The reason for filtering out the smaller tables is because the optimization benefit is smaller and less predictable. Therefore, this project does not include these smaller tables, as the volume of data we have is relatively small. Here is the [source](https://cloud.google.com/blog/products/data-analytics/new-bigquery-partitioning-and-clustering-recommendations).


A few words about how the pipeline operates in MAGE AI. Data is extracted from the `Kaggle` dataset and stored in the `data` directory on the server. It is then archived.
In the following block, it is saved in `parquet` format and uploaded to `gcs`. External tables, staging, and core-level models are created within the `dbt` block. Upon successful completion of all higher-level processes, the `data` directory is successfully removed.
In my case, I used [Dynamic Blocks](https://docs.mage.ai/design/blocks/dynamic-blocks) to take the output of one block and dynamically create more blocks using that information.

## Data Source

Dataset was taken from Kaggle:

 - [The Full TMDb TV Shows Dataset for 2024](https://www.kaggle.com/datasets/asaniczka/full-tmdb-tv-shows-dataset-2023-150k-shows)
    - **File Type:** `CSV`
    - **File Size:** `78.3` MB
    - **Rows:** `166,383`
    - **Columns:** `29`
 - [The Full TMDb TV Movies Dataset for 2024](https://www.kaggle.com/datasets/asaniczka/tmdb-movies-dataset-2023-930k-movies)
    - **File Type:** `CSV`
    - **File Size:** `463.1` MB
    - **Rows:** `1,011,520`
    - **Columns:** `23`

## Reproducability

>How to Recreate the Project? 

Recreating the project is a simple process and should only take about 15 minutes. You can find a detailed tutorial on how to do this [here](/recreate_project/INSTALL.md).

## Future Improvements

- Create tests for all code and sql

## Credits

A special thank you to the **instructors**, who have provided guidance and support throughout the course. Their expertise and insights have been incredibly valuable in the development of the Movies and TV Shows project. The course has taught me a great deal of useful skills and techniques, which have greatly enhanced my knowledge as a data engineer.

- [Ankush Khanna](https://linkedin.com/in/ankushkhanna2)
- [Victoria Perez Mola](https://www.linkedin.com/in/victoriaperezmola/)
- [Alexey Grigorev](https://linkedin.com/in/agrigorev)
- [Matt Palmer](https://www.linkedin.com/in/matt-palmer/)
- [Luis Oliveira](https://www.linkedin.com/in/lgsoliveira/)
- [Michael Shoemaker](https://www.linkedin.com/in/michaelshoemaker1/)

Thank you for organizing such a comprehensive and interesting course experience! 🙏



## Feedback:

>The feedbacks that was received after the verification process on the course

- Looks nice!
- The benefit of choosing a large dataset is that partitioning and clustering actually makes sense, you are the only person I evaluated that actually did this step! The steps to reproduce are clear, and the tiles are beautiful. It would be nice if you included more information on the steps you took, ie, information on data transformation with dbt, maybe a screenshot of your DAG, etc.
- Good command of python and detailedly and logically segregated scripts. Seems to not have up-to-date data to be fetched regularly via batch? Would be cool to have that!
