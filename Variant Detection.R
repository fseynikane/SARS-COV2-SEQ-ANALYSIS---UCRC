BiocManager::install("sitePath")
BiocManager::install("treeio")
library(sitePath)
library(ape)
library(treeio)

#Importer un fichier arborescent 
tree <- read.tree("nextstrain_ncov_gisaid_africa_tree.nwk")

plot(tree)


#Importer un fichier d'alignement de séquences 
alignment_file <- "multi_fasta_2021-10-26.meg1.fas"

?multi2di
?addMSA




tree1 <- addMSA(tree, alignment_file, alignment = F ,"fasta")
summary(tree)alig

summary(tree)
preassessment <- sneakPeek(tree, makePlot = TRUE)
