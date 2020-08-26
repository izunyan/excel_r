
# 表紙作成 --------------------------------------------------------------------

# RStudioの色 
#75aadb

# Excelの色
#https://www.microsoft.com/ja-jp/microsoft-365/excel
#217346

library(tidyverse)

df <- expand.grid(x = 0:5, y = 0:5)
set.seed(123)
df$z <- runif(nrow(df))


# excel風
df <- expand.grid(x = 0:8, y = 0:20)
set.seed(123)
df$z <- runif(nrow(df))

# default is compatible with geom_tile()
ggplot(df, aes(x, y, fill = z)) + 
  geom_raster() + 
  scale_fill_gradient(low = "#217346", high = "#75aadb")


library(palmerpenguins)

names(penguins)

ggplot(penguins, aes(bill_length_mm,bill_depth_mm, color = flipper_length_mm)) +
  geom_point()


ggplot(penguins, aes(bill_length_mm,bill_depth_mm, color = body_mass_g)) +
  geom_point()



ggplot(penguins, aes(bill_length_mm,bill_depth_mm)) +
  geom_bin2d(bins = 20, binwidth = c(3,0.5))


ggplot(penguins, aes(bill_length_mm,bill_depth_mm)) +
  geom_bin2d( binwidth = c(3,0.5)) +
  scale_fill_gradient(low = "#217346", high = "#75aadb")


ggplot(penguins, aes(bill_length_mm,bill_depth_mm, fill = body_mass_g)) +
  geom_tile()

