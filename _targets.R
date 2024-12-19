# Load required libraries
library(targets)
library(dplyr)
library(ggplot2)

# Source custom functions
source("functions.R")

# Define the pipeline
list(
  # Ensure the output directory exists
  tar_target(
    create_output_dir,
    {
      if (!dir.exists("output")) dir.create("output", recursive = TRUE)
      "output"  # Return the directory path for downstream targets
    }
  ),
  
  # Load the raw data
  tar_target(
    raw_data,
    mtcars  # Load the mtcars dataset
  ),
  
  # Clean the raw data
  tar_target(
    cleaned_data,
    clean_data(raw_data)  # Clean the dataset using a custom function
  ),
  
  # Generate a summary table
  tar_target(
    summary_table,
    create_summary(cleaned_data)  # Generate a summary table
  ),
  
  # Create a scatter plot for horsepower vs MPG
  tar_target(
    horsepower_plot,
    create_plot(cleaned_data, x = "hp", y = "mpg", title = "Horsepower vs MPG")  # Create a scatter plot
  ),
  
  # Create a scatter plot for weight vs MPG
  tar_target(
    weight_plot,
    create_plot(cleaned_data, x = "wt", y = "mpg", title = "Weight vs MPG")  # Create another scatter plot
  ),
  
  # Save the horsepower plot
  tar_target(
    saved_horsepower_plot,
    {
      save_plot("output/horsepower_plot.png", horsepower_plot)
    },
    format = "file"  # Specify that the target produces a file
  ),
  
  # Save the weight plot
  tar_target(
    saved_weight_plot,
    {
      save_plot("output/weight_plot.png", weight_plot)
    },
    format = "file"  # Specify that the target produces a file
  )
)
