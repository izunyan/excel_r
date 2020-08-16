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
library(tidyverse)
# library(lubridate)

penguins <- penguins

penguins <- 
  penguins %>% 
  mutate(種類 = case_when(species == "Adelie"    ~ "アデリー",
                          species == "Chinstrap" ~ "ヒゲ",
                          species == "Gentoo"    ~ "ジェンツー"))

# penguins <- 
#   penguins %>% 
#   select(-species)

penguins %>% count(種類)

penguins <- 
penguins %>% 
  select(species,種類, everything())

write_xlsx(penguins, "data/ペンギン.xlsx")


library(readxl)

df <- 
read_xlsx("data/ペンギン.xlsx")


# シート別にデータがあるexcelファイル作成
library(writexl)

p_list <- 
  split(df, df$種類)

write_xlsx(p_list, "data/ペンギン（シート別）.xlsx")

library(stringi)

stri_trans_nfkc("ﾍﾟﾝｷﾞﾝ")

to do
str()の表示列数縮減
skipの説明