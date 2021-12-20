title: "Lake Superior Nearshore Sonde Data"
author: "Reane Loiselle"
date: "12/13/2021"

##Load relevant packages and set figure specs
library(tidyverse)
library(lubridate)
library(magrittr)
knitr::opts_chunk$set(echo=TRUE,fig.width=10,fig.height=5,comment="#R>")
## Set your working directory before here
d <- read_csv("LLO_Burke_TROLL_21.csv") %>%
  mutate(Date=as.Date(Date,format="%m/%d/%y"))

turb2 <- d %>%
  select(Site,Date,m,Turbidity) %>%
  filter(m<=2) %>%  
  na.omit(turb2)
turb2_sum <- turb2 %>%
  group_by(Site,Date) %>%
  summarize(n=n(),
            mn_Turbidity=mean(Turbidity,na.rm=TRUE),
            sd_Turbidity=sd(Turbidity,na.rm=TRUE)) %>%
  ungroup() %>%
  arrange(factor(Site, levels = c('WE1a', 'WE1b', 'AR2a', 'AR2b', 'BR3a', 'BR3b', 
                                  'BR3c',"FR4a","FR4b","FR4c","Bbay","LLO4","SBay","MB5a", "MB5c","SCav","6a","6b","7a","7b","8a","8b","9a","CB10","CB11","10a","CB1","CB3","11a","11b","11c")))
turb2_sum

## Creating output file
write.csv(turb2_sum,"J:\\Burke_Data\\Data\\LS_Nearshore\\Profile Data\\R Studio\\Outputs\\Means_Surface_Turbidity.csv", quote=FALSE,row.names=FALSE)  

##Specific Conductance 

sp2 <- d %>%
  select(Site,Date,m,SpCond) %>%
  na.omit(sp2)
sp2_sum <- sp2 %>%
  group_by(Site,Date) %>%
  summarize(n=n(),
            mn_SpCond=mean(SpCond,na.rm=TRUE),
            sd_spCond=sd(SpCond,na.rm=TRUE)) %>%
  ungroup() %>%
  arrange(factor(Site, levels = c('WE1a', 'WE1b', 'AR2a', 'AR2b', 'BR3a', 'BR3b', 'BR3c',"FR4a","FR4b","FR4c","Bbay","LLO4","SBay","MB5a","MB5c","SCav","6a","6b","7a","7b","8a","8b","9a","CB10","CB11","10a","CB1","CB3","11a","11b","11c")))
sp2_sum

## Creating output file
write.csv(sp2_sum,"J:\\Burke_Data\\Data\\LS_Nearshore\\Profile Data\\R Studio\\Outputs\\Means_Surface_SpCond.csv", quote=FALSE,row.names=FALSE)

