#!/usr/bin/env Rscript


# get arguments
args = commandArgs(trailingOnly=TRUE)

# test if there is at least one argument: if not, return an error
if (length(args)==0) {
  stop("At least one argument must be supplied (input file).csv", call.=FALSE)
} else if (length(args)==1) {
  # default output file
  args[2] = "out.csv"
}



### IMAGE ANALYSIS GET AVERAGE PER IMAGE ###

library(tidyverse)

# load data
df <- read_csv(args[1])

#clean data
df_out <- df %>% 
  separate(Slice, into = c("File", "junk"), sep = "\\.") %>% 
  select(-junk) %>% 
  separate(File, into = c("sample", "angle"), sep = "_") %>% 
  select(sample, area = `Total Area`, perim = Perim.) %>% 
  group_by(sample) %>% 
  summarize_all(list(mean,sd)) %>% 
  arrange(sample) %>% 
  select(sample, area = area_fn1, area_sd = area_fn2, 
         perim = perim_fn1, perim_sd = perim_fn2)


write_csv(df_out, args[2])