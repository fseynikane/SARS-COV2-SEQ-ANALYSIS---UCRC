
install.packages("adegenet", dep=TRUE)

install.packages("phangorn", dep=TRUE)

library(adegenet)
library(phangorn)
library(lubridate)

dna1 <- fasta2DNAbin(file="nextclade.aligned.fasta")

dna1

str(Variant_annotation)

Variant_annotation$month_test <- month(Variant_annotation$Tested_Date, label = T)
Variant_annotation$year_test <- year(Variant_annotation$Tested_Date)

library(ape)

D <- dist.dna(dna1, model = "TN93")
length(D)  #number of pairwise distances, computed as n(n-1)/2
temp <- as.data.frame(as.matrix(D))
table.paint(temp, cleg=0, clabel.row=.5, clabel.col=.5)

tre <- nj(D)
class(tre)

tre <- ladderize(tre)
tre # tells us what the tree will look like but doesn't show the actual construction

plot(tre, cex = 0.6)
title("A Simple NJ Tree")


h_cluster <- hclust(D, method = "average", members = NULL) # method = average is used for UPGMA, members can be equal to NULL or a vector with a length of size D
plot(h_cluster, cex = 0.6)


plot(tre, show.tip=FALSE) # gets rid of the labels on the end, refer to the first tree depicted above
title("Unrooted NJ tree")
myPal <- colorRampPalette(c("red","yellow","green","blue"))

tiplabels(Variant_annotation$month_test, bg=num2col(Variant_annotation$month_test), cex=.5) #we use the annot dataset to get our years
temp <- pretty(1993:2008, 5)
legend("bottomleft", fill=num2col(temp, col.pal=myPal), leg=temp, ncol=2)


plot(tre, type = "unrooted", show.tip = FALSE)
title("Unrooted NJ Tree")
tiplabels(Variant_annotation$month_test, bg=num2col(Variant_annotation$month_test), cex=0.5)




dna2 <- as.phyDat(dna1) #assign the original dna sequences data as a phyDat object...
class(dna2)
dna2

tre.ini <- nj(dist.dna(dna1,model="raw"))
tre.ini


parsimony(tre.ini, dna2)


tre.pars <- optim.parsimony(tre.ini, dna2)


tre.pars

parsimony(tre.pars, dna2)


library(ape)
plot(tre.pars, type="unr", show.tip=FALSE, edge.width=2)
title("Maximum-parsimony tree")
tiplabels(tre.pars$tip.label, bg=transp(num2col(Variant_annotation$month_test),.7), cex=.5, fg="transparent")
