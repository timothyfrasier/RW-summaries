##################################
# COMMANDS FOR SUMMARIZING RIGHT #
# WHALE SAMPLE COLLECTOR DATA    #
#                                #
#             by                 #
#        Tim Frasier             #
#    Last Updated: 08-AUG-2025   #
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
collectors <- read.table("collectors.csv", header = TRUE, sep = ",")
colnames(collectors) <- c("collector", "count")

#---------------------------------------#
# Number of samples with collector data #
#---------------------------------------#
sum(collectors$count)


#--------------------------------#
#  Command for making pie chart  #
#--------------------------------#
ggplot(collectors, aes(x = "", y = count, fill = collector)) +
  geom_bar(stat = "identity", width = 1) +
  coord_polar("y", start = 0) +
  theme_void() +
  scale_fill_viridis(discrete = TRUE, option = "mako") +
  labs(
    title = "Sample Collectors Since 2020"
  )

#--- Export the plot ---#
pdf("collectors.pdf", width = 4, height = 3)
ggplot(collectors, aes(x = "", y = count, fill = collector)) +
  geom_bar(stat = "identity", width = 1) +
  coord_polar("y", start = 0) +
  theme_void() +
  scale_fill_viridis(discrete = TRUE, option = "mako") +
  labs(
    title = "Sample Collectors Since 2020"
  )
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


