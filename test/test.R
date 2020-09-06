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


# 

library(writexl)

p_list <- 
  split(df, df$種類)

write_xlsx(p_list, "data/ペンギン（シート別）.xlsx")

library(stringi)

stri_trans_nfkc("ﾍﾟﾝｷﾞﾝ")


# 気温 ----------------------------------------------------------------------

library(tidyverse)
library(readxl)
library(janitor)
library(writexl)
library(lubridate)

read_xlsx("data/気温.xlsx", skip = 3)


temp <- 
read_xlsx("data/気温.xlsx", skip = 3) %>% 
  clean_names(case = "old_janitor")

glimpse(temp)

temp %>% names()

temp <- 
  temp %>% 
  select(年月日, 最高気温_2, 最高気温_4,  最低気温_7, 最低気温_9) %>% 
  rename(date = 年月日,
         最高気温  = 最高気温_2,
         最高気温_時刻  = 最高気温_4,
         最低気温  = 最低気温_7, 
         最低気温_時刻  = 最低気温_9)

temp <- 
  temp %>% 
  slice(-(1:2))

temp <- 
temp %>% 
  mutate(date = ymd(date),
         date_original = date,
         最高気温_時刻 = ymd_hm(最高気温_時刻),
         最高気温_時刻_original = 最高気温_時刻, # 時刻ずれ検証用
         最低気温_時刻 = ymd_hm(最低気温_時刻))

write_xlsx(temp, "data/temp.xlsx")

# ここでexcel上で最高気温の時刻列を時刻の型に手動で変換(Libreofficeのcalc)


read_xlsx("data/temp.xlsx")

# 日付が数値になる問題は、col_types = "text"の際に発生！


Sys.timezone()
x <- "2018-01-01 12:00:00"
as.POSIXct(x)
xj <- as.POSIXct(x)

as_datetime(x)
as_datetime(xj)

as_datetime(x) %>% 
force_tz()


read_csv("data/csv/気温.csv", 
         locale = locale(encoding = "cp932"), skip = 3)


# 引用 ----------------------------------------------------------------------

出典：総務省 ICTスキル総合習得プログラム 4-3（https://www.soumu.go.jp/ict_skill/pdf/ict_skill_4_3.pdf）

# to do ---------- ----------

レ プロジェクトとはに画像


本のタイトル
「ここまで出来る！R言語でexcelクッキング」
「Rで読むExcelファイル（仮）」

rchunk outputのフォントサイズ

レpalmerpenguins

creative commons

開始ページ数指定

# ページの空白チェック --------------------------------------------------------------
はじめに　：あと半ページ増やせる
プロジェクト：OK
一つの Excel ファイルを読み込む　：あと半ページ増やせる
シートを指定して読み込む　：ぴったり
複数の Excel ファイルを読み込む　：1p増やすか3行削る
一つの Excel ファイルを保存する　：1p増やすか2行削る
複数のファイルを一度に保存する　：1p増やすか3行削る
csvファイルを読み込む　：1p増やすか半ページ削る
csv ファイルを保存する　：数行増やせる
データ解析：そのまま
# 引用 ----------------------------------------------------------------------



R version 4.0.2のエラー
""の中でtabキーを打つと、
path.expand(path) でエラー: unable to translate 'E:/excel_r/data/csv/郢晏｣ｹﾎｦ郢ｧ・ｮ郢晢ｽｳ<ef>・ｼ蛹ｻ<81>・ｲ邵ｺ・ｩ邵ｺ<84>陋ｻ諤憺倹<ef>・ｼ逶各r_cp932.csv' to UTF-8
→versionを3.6.1に戻したら解決