install.packages("multilinguer")
library(multilinguer)
install_jdk()
install.packages(c("stringr", "hash", "tau", "Sejong", "RSQLite","devtools"), type="binary")
install.packages("remotes")
remotes::install_github("haven-jeon/KoNLP",
                        upgrade="never",
                        INSTALL_opts= c("--no-multiarch"), force = T)
library(KoNLP)
useNIADic()
txt <- readLines("data/hiphop.txt")
head(txt)
library(stringr)
txt <- str_replace_all(txt, "\\W", " ")

extractNoun("대한민국의 주권은 국민에게 있고, 모든 권력은 국민으로부터 나온다.")
library(dplyr)
library(ggplot2)
nouns <- extractNoun(txt)
wordcount <- table(unlist(nouns))
wordcount
df_word <- as.data.frame(wordcount, stringsAsFactors = F)
df_word
df_word <- rename(df_word,
                  word = Var1,
                  freq = Freq)
df_word1 <- filter(df_word, nchar(word) >= 2)
top20 <- df_word1 %>% 
  arrange(desc(freq)) %>% 
  head(20)
top20
install.packages("wordcloud")
library(wordcloud)
library(RColorBrewer)
pal <- brewer.pal(8, "Dark2")
set.seed(1234)
wordcloud(words = df_word1$word,
          freq = df_word1$freq,
          min.freq = 2,
          max.words = 200,
          random.order = F,
          rot.per = .1,
          scale = c(4, 0.3),
          colors = pal)
pal <- brewer.pal(9, "Blues")[5:9]
wordcloud(words = df_word1$word,
          freq = df_word1$freq,
          min.freq = 2,
          max.words = 200,
          random.order = F,
          rot.per = .1,
          scale = c(4, 0.3),
          colors = pal)
