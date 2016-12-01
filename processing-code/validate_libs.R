# List all libs used in posts in _data/libs.yml --------
library(dplyr)
library(tidyr)
library(yaml)
source("processing-code/helpers.R")

libs_yaml <- yaml.load_file("_data/libs.yml")




# for each post, pull out the language and libraries used -----------------

posts <- list_posts()

langs <- sapply(posts, yaml2df, "lang") %>%
  bind_rows() %>%
  select(file, field, value)

libs <- sapply(posts, yaml2df, "lib") %>%
  bind_rows() %>%
  select(file, field, value)



# Then, identify libs are used in posts but not in _data/libs.yml ---------

crossref_libs <- function(df, libs_yaml) {
  # crossreference languages and libraries used with _data/libs.yml
  # input:
  #   - df (data.frame): a data frame with file, field, and value
  # output: 
  #   - data.frame with following columns:
  #       1) file (chr): source md file for post
  #       2) lang (chr): language e.g., r, python
  #       3) missing_lib (chr): libs used in post, but not in _data/libs.yml
  lang <- df$value[df$field == "lang"]
  libs_in_post <- df$value[df$field == "lib"]
  if (length(unique(lang)) > 1) {
    stop("crossref_libs() assumes that each post has only one tagged language!")
  }
  stopifnot(length(unique(df$file)) == 1)
  
  # find which list to pull from
  which_list <- libs_yaml %>%
    lapply(FUN = function(x) x$lang == lang) %>%
    unlist() %>%
    which()
  
  libs_in_yaml <- libs_yaml[[which_list]]$libs
  missing <- !(libs_in_post %in% libs_in_yaml)
  if (any(missing)) {
    res <- data.frame(file = unique(df$file), 
               lang = lang, 
               missing_lib = libs_in_post[missing])
  } else {
    res <- data.frame(file = NULL, lang = NULL, missing_lib = NULL)
  }
  res
}

missing_df <- langs %>%
  full_join(libs) %>%
  group_by(file) %>%
  do(crossref_libs(., libs_yaml))




# Last, fill in any missing libs in _data/libs.yml ------------------------

sync_libs_yaml <- function(missing_df, libs_yaml) {
  # If any libs are used in posts, but not in the _data/libs.yml file, this 
  # function will add the missing libraries to the _data/libs.yml file and 
  # overwrite the old _data/libs.yml file. 
  # args: 
  #   - missing_df (data.frame) with all missing libs for each post
  #   - libs_yaml (list) the list generated from our _data/libs.yml file
  # returns: nothing
  if (nrow(missing_df) > 0) {
    
    missing_df <- missing_df %>%
      distinct(lang, missing_lib)
    
    for (i in 1:length(libs_yaml)) {
      lang_df <- subset(missing_df, lang == libs_yaml[[i]]$lang)
      any_missing <- nrow(lang_df) > 0
      
      if (any_missing) {
        libs_yaml[[i]]$libs <- c(libs_yaml[[i]]$libs, 
                                 lang_df$missing_lib) %>%
          unique()
      }
    }
    cat(as.yaml(libs_yaml), file = "_data/libs.yml")
  }
}

sync_libs_yaml(missing_df, libs_yaml)
