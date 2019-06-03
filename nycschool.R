library(readr)
library(dplyr)
library(stringr)
library(purrr)
library(tidyr)
library(ggplot2)

combined <- read_csv("combined.csv") 
survey <- read_tsv("survey_all.txt")
survey_d75 <- read_tsv("survey_d75.txt")

survey_select <- survey %>%
  filter(schooltype == "High School") %>%
  select(dbn:aca_tot_11)

survey_d75_select <- survey_d75 %>%       
  select(dbn:aca_tot_11)

survey_total <- survey_select %>% 
  bind_rows(survey_d75_select)

survey_total <- survey_total %>%
  rename(DBN = dbn)

combined_survey <- combined %>%
  left_join(survey_total, by = "DBN")

cor_mat <- combined_survey %>%    ## interesting relationshipsS
select(avg_sat_score, saf_p_11:aca_tot_11) %>%
cor(use = "pairwise.complete.obs")
cor_tib <- cor_mat %>%
as_tibble(rownames = "variable")

strong_cors <- cor_tib %>%
select(variable, avg_sat_score) %>%
filter(avg_sat_score > 0.25 | avg_sat_score < -0.25)  

create_scatter <- function(x, y) {     
ggplot(data = combined_survey) + 
aes_string(x = x, y = y) +
geom_point(alpha = 0.3) +
theme(panel.background = element_rect(fill = "white"))
}
x_var <- strong_cors$variable[2:5]
y_var <- "avg_sat_score"

map2(x_var, y_var, create_scatter)

combined_survey_gather <- combined_survey %>%                         
gather(key = "survey_question", value = score, saf_p_11:aca_tot_11)

combined_survey_gather <- combined_survey_gather %>%
mutate(response_type = str_sub(survey_question, 4, 6)) %>%   
mutate(question = str_sub(survey_question, 1, 3))

combined_survey_gather <- combined_survey_gather %>%
mutate(response_type = ifelse(response_type  == "_p_", "parent", 
ifelse(response_type == "_t_", "teacher",
ifelse(response_type == "_s_", "student", 
ifelse(response_type == "_to", "total", "NA")))))

combined_survey_gather %>%
filter(response_type != "total") %>%
ggplot() +
aes(x = question, y = score, fill = response_type) +
geom_boxplot()
