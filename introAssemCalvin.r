# Script for Calvin to download example genome of Strep pneumoniae

# Download Rstudio for mac
#https://download1.rstudio.org/RStudio-0.99.896.dmg

library(RSQLite)

# Point to a public repository for R packages
source('http://bioconductor.org/biocLite.R')
# Download the SRAdb package
biocLite('SRAdb')

biocLite('DBI')
library(DBI)

# Load SRAdb package
library(SRAdb)

# Load all the SRA databases onto your machine
srafile = getSRAdbFile()
#Connect to the database because we want to get a particular SRA project ID
con = dbConnect(RSQLite::SQLite(), srafile)

# List all the SRA links for this project (Streptococcus pneumoniae sequencing)
# Run it in head to get only a few lines
head(listSRAfile('ERS455230', con))

## Once we have the link to the SRA file lets download it on the command line
## Run in bash
# cd ~/ownCloud/projects/BioinfoHub/20160426_Yiwen_StrepPneuGenome/
# wget ftp://ftp-trace.ncbi.nlm.nih.gov/sra/sra-instant/reads/ByExp/sra/ERX/ERX557/ERX557088/ERR600259/ERR600259.sra
# 
## Convert sra to fastq.gz
# fastq-dump --gzip --split-3 ERR600259.sra
# 
## JBworkMBP-6:20160426_Yiwen_StrepPneuGenome jbreen$ ll
## total 38389592
## -rw-r--r--  1 jbreen  staff          205 26 Apr 10:41 20160426_Yiwen_StrepPneuGenome.Rproj
## -rw-r--r--  1 jbreen  staff    377929093 26 Apr 11:00 ERR600259.sra
## -rw-r--r--  1 jbreen  staff    233757776 26 Apr 11:06 ERR600259_1.fastq.gz
## -rw-r--r--  1 jbreen  staff    238988034 26 Apr 11:06 ERR600259_2.fastq.gz
## -rw-r--r--  1 jbreen  staff  18804788224 26 Apr 10:56 SRAmetadb.sqlite

## Run fastQC

## Trim data

## VelvetOptimiser

## Align to reference strain (ask Stephen Kidd)
## Use bowtie2 etc
