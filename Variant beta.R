
V2
B.1.351/
  B.1.351.2/
  B.1.351.3)

Beta_V2 <- c("L18F","A67V","D80A","E484K","N501Y","D614G","A701V")
Beta_B.1.351_1 <- c("A67V","D80A","E484K","N501Y","D614G","A701V")
Beta_B.1.351_2 <- c("L18F","D80A","E484K","N501Y","D614G","A701V")
Beta_B.1.351.3 <- c("L18F","D80A","E484K","N501Y","D614G","A701V")

NGS <- c("E484K","E482Q","L452R")

VBeta_2 <- as.data.frame(sapply(SpikeVariant$ExistingMutList, str_detect, pattern=Beta_V2)) 
VBeta_2

VBeta_Beta_B.1.351_1 <- as.data.frame(sapply(SpikeVariant$ExistingMutList, str_detect, pattern=Beta_B.1.351_1)) 

VBeta_Beta_B.1.351_2 <- as.data.frame(sapply(SpikeVariant$ExistingMutList, str_detect, pattern=Beta_B.1.351_2)) 

VBeta_Beta_B.1.351.3 <- as.data.frame(sapply(SpikeVariant$ExistingMutList, str_detect, pattern=Beta_B.1.351.3)) 


NGS1 <- as.data.frame(sapply(SpikeVariant$ExistingMutList, str_detect, pattern=NGS))

write.xlsx(NGS1, "NGS1.xlsx", overwrite = T)
