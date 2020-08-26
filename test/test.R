library(tidyverse)
library(writexl)


# set.seed(123); 変数1 <- round(rnorm(10, mean = 10, sd = 5))
# set.seed(1); 変数2 <- round(runif(10, min = 1,max = 3))
#  
# tibble(id = 1:10,
#        )

library(palmerpenguins)
# https://github.com/allisonhorst/palmerpenguins

有名なirisデータセットの代替として公開されたペンギンデータ。

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

# to do --------------------

1.2 プロジェクトとはに画像


本のタイトル

rchunk outputのフォントサイズ

palmerpenguins

creative commons


R version 4.0.2のエラー
""の中でtabキーを打つと、
path.expand(path) でエラー: unable to translate 'E:/excel_r/data/csv/郢晏｣ｹﾎｦ郢ｧ・ｮ郢晢ｽｳ<ef>・ｼ蛹ｻ<81>・ｲ邵ｺ・ｩ邵ｺ<84>陋ｻ諤憺倹<ef>・ｼ逶各r_cp932.csv' to UTF-8
→versionを3.6.1に戻したら解決