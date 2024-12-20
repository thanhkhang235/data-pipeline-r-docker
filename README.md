# R Data Pipeline with Targets and Docker

This repository contains an R data pipeline that processes and visualizes data using the targets package for reproducible workflows. The pipeline is fully containerized with Docker, ensuring a consistent and portable environment.

It supports automated execution via GitHub Actions and generates outputs like summary statistics and visualizations.

### Dataset
This pipeline processes the `mtcars` dataset, which contains fuel consumption and various car attributes for 32 car models. The dataset includes columns such as miles per gallon (`mpg`), number of cylinders (`cyl`), horsepower (`hp`), weight (`wt`), and more. The goal is to clean, summarize, and visualize the data for better understanding.

## Features

- **Reproducible Pipeline**: Powered by the **`targets`** and **`renv`** packages for dependency management and workflow reproducibility.
- **Containerized Environment**: Docker ensures all dependencies are pre-installed and versioned.
- **Simple Execution**: Run the entire pipeline with a single command.
- **Automated CI/CD**: Integrated with **GitHub Actions**, the pipeline runs automatically for every push or pull request to the `main` branch.



## Setup

### Prerequisites

- **Docker**: Install [Docker](https://www.docker.com/).
- **Git**: Clone the repository:

```bash
  git clone https://github.com/thanhkhang235/data-pipeline-r-docker.git
  cd data-pipeline-r-docker
```
 
# Running the Pipeline

## Build the Docker Image

To build the Docker image for the pipeline, run the following command:

```bash
docker build -t r_targets_pipeline .
```

## Run the Pipeline
To run the pipeline inside the container, use the following command. This mounts the current directory into the container and executes the pipeline:

```bash
docker run -v $(pwd):/pipeline r_targets_pipeline
```

## Pipeline Execution

The pipeline performs the following steps:

### Data Cleaning

- Filters rows with MPG greater than 15.
- Converts the `cyl` column into a factor for categorical analysis.

### Summary Statistics

- Calculates average MPG and horsepower grouped by the number of cylinders.

### Visualization

Creates scatter plots for:
- **Horsepower vs MPG**
- **Weight vs MPG**

## Outputs

The pipeline generates the following outputs, stored in the `output/` directory:

- **`horsepower_plot.png`**: Scatter plot of horsepower vs MPG.
- **`weight_plot.png`**: Scatter plot of weight vs MPG.
- **Summary Table**: Average MPG and horsepower grouped by cylinders (viewable in the R console).


## Key Files

- **_targets.R**: Defines the pipeline targets.
- **functions.R**: Contains helper functions for processing and visualization.
- **renv.lock**: Ensures reproducibility by capturing R package dependencies.
- **Dockerfile**: Defines the containerized environment.

