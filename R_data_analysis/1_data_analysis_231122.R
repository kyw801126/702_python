install.packages("descr") 
library(descr)
# 1. forest 데이터 불러오기
forest_example_data <-read_excel("data/7-1_forest_example_data.xls")
forest_example_data
# 2. 컬럼이름을 변경
#"name","city","gubun","area","number","stay","city_new","code","codename"
# 2-1 .rename
forest_example_data <-  rename(forest_example_data,
                   name = 휴양림명,
                   city = 시도명,
                   gubun = 휴양림구분)
# 2-2 .  
colnames(forest_example_data) <- c("name","city","gubun","area","number","stay","city_new","code","codename")

#3. dplry 을 활용해 city_new 컬럼을 활용해서 시도별 분포 확인 카운트 내림차순arrage
library(dplyr)
 
count(forest_example_data, city_new) %>% arrange(desc(n))
#4. codename 제공기관 컬럼 시도별 분포 확인 arrange
count(forest_example_data, codename) %>% arrange(desc(n))
#5. city 중 경기도, 충청북도 경상북도 지역 데이터만 추출
area <- forest_example_data %>% 
  filter(city %in% c("경기도", "충청북도", "경상북도"))
area
#6. city  시도명컬럼을 활용해 시도별 분포 확인
# descr 설치 freq 함수 활용
freq(forest_example_data$city, plot=T, main='City')

library(readxl)
entrance_xls <- read_xls("data/7-2_entrance_exam.xls")
head(entrance_xls)
colnames(entrance_xls) <- c("country", "JAN", "FEB", "MAR", "APR", "MAY", "JUN",
                            "JUL", "AUG", "SEP", "OCT", "NOV", "DEC")
head(entrance_xls)
# 공백제거
entrance_xls$country <- gsub(" ", "", entrance_xls$country)
head(entrance_xls)

#국가 수를 확인 방법
entrance_xls |> nrow()

# 1 월 기준 정렬후 상위 5개국 추출
top5_country <- entrance_xls[order(-entrance_xls$JAN), ] |> head(n=5)
top5_country

install.packages("reshape2")
library(reshape2)
top5_melt <- melt(top5_country, id.vars = "country", variable.name = "mon") 
top5_melt
library(ggplot2)
ggplot(top5_melt, aes(x=mon, y=value, group=country)) + 
  geom_line(aes(color =country)) +
  ggtitle("20년 국적별 입구수 변화추이")

# 미세먼지 데이터 
dustdata <- read_excel("data/7-4_미세먼지_dustdata.xlsx")
head(dustdata)

dust_1 <- dustdata[, c("날짜", "성북구", "중구")]
dust_1
is.na(dust_1)
sum(is.na(dust_1))

# psych
install.packages("psych")
library(psych)
describe(dust_1$성북구)
describe(dust_1$중구)
boxplot(dust_1$성북구, dust_1$중구,
        main = "finedust_compare", xlab="AREA", names=c("성북구", "중구"),
        ylab="FINEDUST_PM", col = c("blue", "green"))
