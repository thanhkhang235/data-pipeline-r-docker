# Function to clean data
clean_data <- function(data) {
  data %>%
    filter(mpg > 15) %>%  # Example filter
    mutate(cyl = as.factor(cyl))  # Convert cylinder column to a factor
}

# Function to create a summary table
create_summary <- function(data) {
  data %>%
    group_by(cyl) %>%
    summarize(
      avg_mpg = mean(mpg),
      avg_hp = mean(hp),
      .groups = "drop"
    )
}

# Function to create a scatter plot
create_plot <- function(data, x, y, title) {
  ggplot(data, aes_string(x = x, y = y)) +
    geom_point() +
    ggtitle(title) +
    theme_minimal()
}

# Function to save a plot
save_plot <- function(file_path, plot) {
  dir <- dirname(file_path)
  if (!dir.exists(dir)) {
    dir.create(dir, recursive = TRUE)
  }
  ggsave(filename = file_path, plot = plot, width = 6, height = 4)
  return(normalizePath(file_path))  # Return the file path for targets
}
