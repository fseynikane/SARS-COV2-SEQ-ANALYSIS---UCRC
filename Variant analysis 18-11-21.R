
clade_mali <- read.csv2("nextclade.csv", header = T)

res <- Factoshiny(clade_mali)

table(clade_mali$clade)
str(clade_mali)

names(clade_mali)
clade_mali1 <- clade_mali[,c(1,2,5:13,23:25)]

clade_mali2 <- clade_mali1[-1,-1]

rownames(clade_mali2) <- clade_mali1[-1,1]


res <- Factoshiny(clade_mali2)


table(Variant_annotation$month_test,Variant_annotation$clade)

barplot(table(Variant_annotation$month_test,Variant_annotation$clade))
Variant_annotation$Sex
library(ggplot2)
library(dplyr)
library(forcats)
library(dplyr)
library(ggplot2)
library(tidyr)
library(scales)
library(ggraph)
library(igraph)
library(tidyverse)
library(viridis)

ggplot(data = Variant_annotation, aes(x= factor(VariantScname)), 
       xTickLabelFont=c(20,"bold"),
       yTickLabelFont=c(20,"bold"))+
  geom_bar(stat="count") + 
  labs(title="Distribution of SARS-CoV-2 variants in Mali (N= 65)",x="Variant", y = "Frequency") +
  stat_count(geom = "text", aes(label = stat(count)), size = 4,
             position=position_fill(vjust=0.5) ,colour="white")+
  theme(text = element_text(size=15))



ggplot(data = Variant_annotation, aes(x= factor(VariantScname), fill=Sex))+
  geom_bar(stat="count", position = "dodge") + 
  labs(title="Distribution of SARS-CoV-2 variants by gender in Mali (N= 65)",x="Variant", y = "Frequency", fill= "Gender")+
  stat_count(geom = "text", aes(label = stat(count)), position = position_dodge(0.90), size = 4, 
             vjust=-0.9, hjust=0.5, colour = "Black")+
  theme(text = element_text(size=15))


fun_mean <- function(x){
  return(data.frame(y= round(mean(x),digits = 2) ,label=round(mean(x,na.rm=T),digits = 2)))
  }

round(mean(34.6622), 2)
ggplot(data = Variant_annotation, aes(x= VariantScname, y=Age, fill=VariantScname))+
  geom_boxplot() + 
  stat_summary(fun.y=mean, geom="point", shape=23, size=4)+
  stat_summary(fun.data = fun_mean, geom="text", vjust=-0.7, size=5)+
  labs(title="Age distribution according to SARS-CoV-2 variants in Mali (Overall mean age= 36.15 ± 15.9)",
       x="Variant", y = "Age frequency (years)", fill= "Variant", size=15)+
  theme(text = element_text(size=20))+
  geom_jitter(shape=16, position=position_jitter(0.2))

ggsave("Age distribution according to SARS-CoV-2 variants in Mali.jpg", 
       dpi = 120, width = 2000, height = 1500, units = "px")

ggplot(data = Variant_annotation, aes(x= fct_rev(fct_reorder(VariantScname,Age,.fun= "mean")), y=Age, fill=VariantScname))+
  geom_boxplot() + 
  stat_summary(fun.y=mean, geom="point", shape=23, size=4)+
  labs(title="Age distribution according to SARS-CoV-2 variants in Mali (Overall mean age= 36.15 ± 15.9)",x="Variant", y = "Age frequency (years)", fill= "Variant")+
  theme(text = element_text(size=15))

Variant_annotation$month_test
d
table(Variant_annotation$Symptoms_1, useNA = "always")

ggplot(data = Variant_annotation, aes(x= factor(VariantScname), fill=Symptoms))+
  geom_bar(stat="count", position = "dodge") + 
  labs(title="Distribution of symptoms according to the carriage of SARS-CoV-2 variants (N= 65)",x="Variant", y = "Frequency", fill= "Symptoms")+
  stat_count(geom = "text", aes(label = stat(count)), position = position_dodge(0.90), size = 4, 
             vjust=-0.5, hjust=0.5, colour = "Black")+
  theme(text = element_text(size=15))

questionr::irec(Variant_annotation$Symptoms_1)
## Recodage de Variant_annotation$Symptoms_1 en Variant_annotation$Symptoms
Variant_annotation$Symptoms <- fct_recode(Variant_annotation$Symptoms_1,
  "Headaches" = "Cephale",
  "Muscle pain" = "courbature",
  "Thoracic pain" = "Douleurs basithoracique",
  "Dyspnea" = "Dyspnoea",
  "Fever" = "Fievre",
  "Fever" = "Grippe",
  "Loss of smell" = "Perte d'odorat",
  "No symptoms" = "Ras",
  "No symptoms" = "RAS",
  "Cough" = "toux",
  "Cough" = "Toux",
  "Cough" = "Toux seche",
  "Digestive disorder" = "Ulcere gastrique"
)


ggplot(data = Variant_annotation, aes(x= factor(month_test), fill=VariantScname))+
  geom_bar(stat="count", position = "dodge") + 
  labs(title="Distribution of SARS-CoV-2 variants  according to the PCR test period (N= 65)",x="Variant", y = "Frequency", fill= "Month (2021)")+
  stat_count(geom = "text", aes(label = stat(count)), position = position_dodge(0.90), size = 4, 
             vjust=-0.9, hjust=0.5, colour = "Black")+
  theme(text = element_text(size=15))
