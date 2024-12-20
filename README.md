# R Data Pipeline with Targets and Docker

This repository contains an R data pipeline that processes and visualizes data using the `targets` package for reproducible workflows. The pipeline is fully containerized using Docker to ensure a consistent environment.

## Features

- **Reproducible pipeline**: Powered by `targets` and `renv`.
- **Containerized environment**: Ensures consistency with Docker.
- **Simple execution**: Run the entire pipeline with a single command.
- **GitHub Actions Integration:** The pipeline runs automatically on GitHub for every push or pull request to the main branch.


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
By default, the container runs the following command:
```bash
targets::tar_make()
```

## Check Outputs
The output files, including plots and summaries, will be saved in the output/ directory.

## Key Files

- **_targets.R**: Defines the pipeline targets.
- **functions.R**: Contains helper functions for processing and visualization.
- **renv.lock**: Ensures reproducibility by capturing R package dependencies.
- **Dockerfile**: Defines the containerized environment.

