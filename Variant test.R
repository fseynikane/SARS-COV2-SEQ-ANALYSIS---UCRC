library(stringr)
VDelta_21A <- c("T19R","V70F","T95I","G142D","F157del","R158del","A222V","W258L",
                "K417N","L452R","T478K","D614G","P681R","D950N")

VDelta_B1.617.2 <- c("T19R","T95I","G142D","F157del","R158del",
                "L452R","T478K","D614G","P681R","D950N")
VDelta_B1.617.2_inco <- c("T19R","G142D","F157del","R158del",
                     "L452R","T478K","D614G","P681R","D950N")

VDelta_AY.1.22 <- c("T19R","T95I","G142D","F157del","R158del","W258L",
                "K417N","L452R","T478K","D614G","P681R","D950N")
VDelta_AY.1.22_incos <- c("T19R","G142D","F157del","R158del","W258L",
                   "K417N","L452R","T478K","D614G","P681R","D950N")

VDelta_AY.2 <- c("T19R","V70F","G142D","F157del","R158del","A222V",
                    "K417N","L452R","T478K","D614G","P681R","D950N")


covid_seq$ExistingMutList[1]


str_detect(covid_seq$ExistingMutList, pattern = VDelta_21A)

length(covid_seq$ExistingMutList)


lapply(covid_seq$ExistingMutList, str_detect, pattern=VDelta_AY.1.22)

lapply(covid_seq$ExistingMutList, str_detect, pattern=VDelta_AY.1.22_incos)

lapply(covid_seq$ExistingMutList, str_detect, pattern=VDelta_B1.617.2_inco)

lapply(covid_seq$ExistingMutList, str_detect, pattern=VDelta_B1.617.2)

covidDeltal_VDelta_AY.1.22 <-lapply(covid_seq$ExistingMutList, str_count, pattern=VDelta_AY.1.22)

covidDeltal_VDelta_AY.1.22_inco <-lapply(covid_seq$ExistingMutList, str_count, pattern=VDelta_AY.1.22_incos)

covidDeltal_VDelta_B1.617.2_inco <-lapply(covid_seq$ExistingMutList, str_count, pattern=VDelta_B1.617.2_inco)

covidDeltal_VDelta_B1.617.2 <- lapply(covid_seq$ExistingMutList, str_count, pattern=VDelta_B1.617.2)

length(VDelta_B1.617.2)
lapply(covidDeltal_VDelta_B1.617.2, sum)==length(VDelta_B1.617.2)

lapply(covidDeltal_VDelta_B1.617.2_inco, sum) ==length(VDelta_B1.617.2_inco)

table(lapply(covidDeltal_VDelta_B1.617.2_inco, sum) ==length(VDelta_B1.617.2_inco))
length(VDelta_AY.1.22)

length(VDelta_AY.1.22_incos)

lapply(covidDeltal, sum)




rm(VariantDelta_B1.617.2)

covid_seq1 <- as.data.frame(covid_seq)


(str_detect(covid_seq$ExistingMutList[1], pattern = VDelta_B1.617.2))== TRUE

VariantDelta_B1.617.2 <- as.list(NULL)

for (i in 1:nrow(covid_seq1)){
  VariantDelta_B1.617.2[i] <- str_detect(covid_seq$ExistingMutList[1], pattern = VDelta_B1.617.2)
}

VariantDelta_B1.617.2
