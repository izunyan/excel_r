library(tidyverse)
library(writexl)


# set.seed(123); 変数1 <- round(rnorm(10, mean = 10, sd = 5))
# set.seed(1); 変数2 <- round(runif(10, min = 1,max = 3))
#  
# tibble(id = 1:10,
#        )

library(palmerpenguins)

penguins

penguins %>% count(species)

# adelie:アデリーペンギン 
# Chinstrap:ヒゲ［アゴヒモ］ペンギン
# gentoo:ジェンツーペンギン

penguins %>% count(island)

 # Biscoe :    
 # Dream       
 # Torgersen   



library(writexl)
library(lubridate)

penguins <- penguins

penguins <- 
  penguins %>% 
  mutate(種類 = case_when(species == "Adelie"    ~ "アデリー",
                          species == "Chinstrap" ~ "ヒゲ",
                          species == "Gentoo"    ~ "ジェンツー"))

penguins <- 
  penguins %>% 
  select(-species)

penguins %>% count(種類)

write_xlsx(penguins, "data/ペンギン.xlsx")






