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

covid_seq$ExistingMutList


length(VDelta_AY.1.22)
length(VDelta_AY.1.22_incos)
length(VDelta_AY.2)
length(VDelta_B1.617.2)
length(VDelta_B1.617.2_inco)

DeltaAY.1.22 <- sapply(SpikeVariant$ExistingMutList, str_detect, pattern=VDelta_AY.1.22)
Delta1AY.1.22_incos <- sapply(SpikeVariant$ExistingMutList, str_detect, pattern=VDelta_AY.1.22_incos)
Delta1AY.2 <- sapply(SpikeVariant$ExistingMutList, str_detect, pattern=VDelta_AY.2)
Delta1B1.617.2 <- sapply(SpikeVariant$ExistingMutList, str_detect, pattern=VDelta_B1.617.2)
Delta1B1.617.2_inco <- sapply(SpikeVariant$ExistingMutList, str_detect, pattern=VDelta_B1.617.2_inco)

DeltaAY.1.22 <- as.data.frame(DeltaAY.1.22)
Delta1AY.1.22_incos

library(openxlsx)
write.xlsx(DeltaAY.1.22,"DeltaAY.1.22.xlsx")

Delta1AY.1.22_incos <- as.data.frame(Delta1AY.1.22_incos)
write.xlsx(Delta1AY.1.22_incos,"Delta1AY.1.22_incos.xlsx", overwrite = T)

Delta1AY.2 <- as.data.frame(Delta1AY.2)
write.xlsx(Delta1AY.2,"Delta1AY.2.xlsx")

Delta1B1.617.2 <- as.data.frame(Delta1B1.617.2)
write.xlsx(Delta1B1.617.2,"Delta1B1.617.2.xlsx")

Delta1B1.617.2_inco <- as.data.frame(Delta1B1.617.2_inco)
write.xlsx(Delta1B1.617.2_inco,"Delta1B1.617.2_inco.xlsx")
