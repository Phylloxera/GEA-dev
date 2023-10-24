#!/usr/bin/env Rscript
mydf<-read.delim("metadata.txt", row.names = NULL)
mydf <- mydf[,colSums(is.na(mydf))<nrow(mydf)]
cols_to_be_rectified <- names(mydf)[vapply(mydf, is.character, logical(1))]
mydf[, cols_to_be_rectified] <- lapply(mydf[, cols_to_be_rectified], trimws)
write.table(mydf, "metadata.txt", sep="\t", na="", quote=F, row.names=F)
