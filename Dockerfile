# Use the official R image
FROM rocker/r-ver:4.3.0

# Install system dependencies
RUN apt-get update && apt-get install -y \
    libcurl4-openssl-dev \
    libssl-dev \
    libxml2-dev \
    libxt-dev \
    pandoc \
    git \
    && apt-get clean

# Install R packages
RUN R -e "install.packages(c('targets', 'dplyr', 'ggplot2', 'remotes'))"

# Copy project files into the container
WORKDIR /pipeline
COPY . /pipeline

# Install project-specific R packages (if needed)
RUN R -e "if (file.exists('functions.R')) source('functions.R')"

# Set container startup command
CMD ["R", "-e", "targets::tar_make()"]
