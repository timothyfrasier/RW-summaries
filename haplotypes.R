##################################
# COMMANDS FOR SUMMARIZING RIGHT #
# WHALE HAPLOTYPE DATA.          #
#                                #
#             by                 #
#        Tim Frasier             #
#    Last Updated: 25-Jul-2025   #
##################################

###########################
# Load Needed Packages    #
###########################
library(ggplot2)
library(viridis)
library(dplyr)



###########################
# Load the Data           #
###########################
haplotypes <- read.table("haplotypes.csv", header = TRUE, sep = ",")

#-------------------------------------------#
# Number of individuals with haplotype data #
#-------------------------------------------#
nrow(haplotypes)

#--------------------------#
# Counts of each haplotype #
#--------------------------#
hapSummary <- haplotypes |>
  count(haplotype)
hapSummary

#--- Write to file ---#
write.csv(hapSummary, "haplotype-counts.csv", quote = FALSE, row.names = FALSE)


#--------------------------------#
#  Command for making pie chart  #
#--------------------------------#
ggplot(hapSummary, aes(x = "", y = n, fill = haplotype)) +
  geom_bar(stat = "identity", width = 1) +
  coord_polar("y", start = 0) +
  theme_void() +
  scale_fill_viridis(discrete = TRUE, option = "mako")

#--- Export the plot ---#
pdf("haplotypes.pdf", width = 4, height = 3)
ggplot(hapSummary, aes(x = "", y = n, fill = haplotype)) +
  geom_bar(stat = "identity", width = 1) +
  coord_polar("y", start = 0) +
  theme_void() +
  scale_fill_viridis(discrete = TRUE, option = "mako")
dev.off()

####################################
# Manually label the plot prior to #
# putting on the website.          #
####################################

#----------------------------------#
#  Haplotype and Sex Summary       #
#----------------------------------#

#--- Load the data ---#
hapSex <- read.table("haplotype-sex.csv", sep = ",", header = TRUE)

#--- Get summary data ---#
summary <- hapSex |>
  count(haplotype, sex)
summary

#--- Write to file ---#
write.csv(summary, "hapsex-counts.csv", quote = FALSE, row.names = FALSE)

###################################
# Manually remove irrelevant rows #
###################################


