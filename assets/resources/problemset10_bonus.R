################################################################################
##
## [ PROJ ] < Problem set #10 >
## [ FILE ] < Name of this particular file >
## [ AUTH ] < Your name / GitHub handle >
## [ INIT ] < Date you started the file >
##
################################################################################

## ---------------------------
## libraries
## ---------------------------

library(tidyverse)
library(labelled)

## ---------------------------
## directory paths
## ---------------------------

data_dir <- file.path('.', 'data')

csv_dir <- file.path(data_dir, 'csv_data')
stata_dir <- file.path(data_dir, 'stata_files')

## -----------------------------------------------------------------------------
## Part IV - Adding variable and value labels [bonus]
## -----------------------------------------------------------------------------

# YOUR TASK: Paste your HD `files` object from problem set 7 (Part II, Q1) here





# The `csv_to_df()` function
csv_to_df <- function(dir_name, file_name) {
  df <- read_csv(file = file.path(dir_name, str_c(file_name, '.csv')))  # read in CSV
  
  names(df) <- df %>%  # change column names to lowercase
    names() %>%
    str_to_lower()
  
  df
}


# YOUR TASK: Implement the `get_stata_labels()` function








# The `add_var_labels()` function
add_var_labels <- function(df, var_labels) {
  for (i in 1:nrow(var_labels)) {
    n <- var_labels[[i, 2]]  # col name
    l <- var_labels[[i, 3]]  # col label
    
    var_label(df[[n]]) <- l  # add var label
  }
  
  df
}


# The `add_val_labels()` function
add_val_labels <- function(df, val_labels) {
  for (i in 1:nrow(val_labels)) {
    n <- val_labels[[i, 3]]  # col name
    v <- val_labels[[i, 4]]  # val name
    l <- val_labels[[i, 5]]  # val label
    
    if (is.na(val_labels[[i, 2]])) {
      v <- as.numeric(v)
    }
    
    val_label(df[[n]], v) <- l  # add val label
  }
  
  df
}


# Loop to read in and label all HD data
for (i in 1:length(files)) { 
  file_name <- files[i]
  
  # Read in CSV file data
  df <- csv_to_df(csv_dir, file_name)
  
  # Read in stata file labels
  stata_labels <- get_stata_labels(stata_dir, file_name)
  
  # Add labels
  df <- add_var_labels(df, stata_labels$var_labels)
  df <- add_val_labels(df, stata_labels$val_labels)
  
  assign(file_name, df)  # assign the `df` dataframe to the name stored in `file_name`
}

## -----------------------------------------------------------------------------
## End
## -----------------------------------------------------------------------------
