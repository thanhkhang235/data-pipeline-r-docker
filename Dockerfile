# Use the official R image
FROM rocker/r-ver:4.4.1

# Install system dependencies
RUN apt-get update && apt-get install -y \
    libcurl4-openssl-dev \
    libssl-dev \
    libxml2-dev \
    libxt-dev \
    pandoc \
    git \
    && apt-get clean

# Install renv package
RUN R -e "install.packages('renv')"

# Copy project files into the container
WORKDIR /pipeline
COPY . /pipeline

# Install project-specific R packages using renv
RUN R -e "if (!file.exists('renv.lock')) renv::init()"
RUN R -e "renv::restore()"


# Set container startup command
CMD ["R", "-e", "targets::tar_make()"]
