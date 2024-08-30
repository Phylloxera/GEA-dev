#!/usr/bin/env Rscript
mydf<-read.delim("metadata.txt", row.names = NULL)
mydf <- mydf[,colSums(is.na(mydf))<nrow(mydf)]
cols_to_be_rectified <- names(mydf)[vapply(mydf, is.character, logical(1))]
mydf[, cols_to_be_rectified] <- lapply(mydf[, cols_to_be_rectified], trimws)
mydf[] <- lapply(mydf, sub, pattern = ",,", replacement = ",") #7/10/24 double commas in SkesaPlasList
mydf[] <- lapply(mydf, sub, pattern = ",$", replacement = "") #7/10/24 trailing commas in SkesaPlasList
write.table(mydf, "metadata.txt", sep="\t", na="", quote=F, row.names=F)
