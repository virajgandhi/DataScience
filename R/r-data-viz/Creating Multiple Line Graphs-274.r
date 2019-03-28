## 1. Visualizing Data for Multiple Populations ##

life_expec <- read_csv("life_expec.csv")

## 2. Manipulating the Data for Visualization ##

life_expec_sex <- life_expec %>%
  filter(Race == "All Races" & Sex != "Both Sexes")

## 3. Graphing Life Expectancies for Men and Women: Multiple Panels ##

ggplot(data = life_expec_sex) +
  aes(x = Year, y = Avg_Life_Expec) +
facet_wrap(~Sex, ncol = 1) +
geom_line() 

## 4. Graphing Life Expectancies for Men and Women on the Same Axes ##

ggplot(life_expec_sex) +
  aes(x = Year, y = Avg_Life_Expec, color = Sex) +
  geom_line()

## 5. Graphing a Subset of Data ##

# ggplot(life_expec_sex) + 
#   aes(x = Year, y = Avg_Life_Expec, color = Sex) +
#   geom_line()

ggplot(life_expec_sex) + 
  aes(x = Year, y = Avg_Life_Expec, color = Sex) +
  geom_line() +
  xlim(1900, 1950)

## 6. Exploring the Data Further ##

life_expec_sex_race <- life_expec %>%
  filter((Sex =="Male" | Sex == "Female") & ( Race == "Black" | Race == "White"))


## 7. Manipulating Multiple Line Graph Aesthetics ##

ggplot(life_expec_sex_race) + 
  aes(x = Year, y = Avg_Life_Expec, color = Sex, lty = Race) +
  geom_line()+
  scale_color_manual(values=c("darkgreen", "darkorchid"))+
scale_linetype_manual(values = c(1,4))

## 8. Deciding How to Present the Data ##

ggplot(life_expec_sex_race) + 
  aes(x = Year, y = Avg_Life_Expec, lty = Race) +
  geom_line()+
scale_linetype_manual(values = c(1,3)) +
 facet_wrap(~Sex, ncol = 2)+
labs(title = "United States Life Expectancy: 100 Years of Change",  y = "Average Life Expectancy (Years)") + 
  theme(panel.background = element_rect(fill = "white"))