##################################
# COMMANDS FOR SUMMARIZING RIGHT #
# WHALE SEXING DATA.             #
#                                #
#             by                 #
#        Tim Frasier             #
#    Last Updated: 18-Jul-2025   #
##################################

###########################
# Load Needed Packages    #
###########################
library(ggplot2)


###########################
# Load the Data           #
###########################
sexes <- read.table("sexes.csv", header = TRUE, sep = ",")

#--------------------------------------#
# Remove sexes that are not "m" or "f" #
#--------------------------------------#
sexesfull <- sexes[sexes$sex == "m" | sexes$sex == "f", ]

#--- Total Number ---#
ntotal <- nrow(sexesfull)
ntotal

#--- Number of Females ---#
nfemales <- nrow(sexesfull[sexesfull$sex == "f", ])
nfemales

#--- Number of Males ---#
nmales <- nrow(sexesfull[sexesfull$sex == "m", ])
nmales


#----------------------------#
# Organize data for plotting #
#----------------------------#
numbers <- c(nfemales, nmales)
labels <- c("Females", "Males")

data <- data.frame(labels, numbers)

#--- Plot the data ---#
ggplot(data) +
  theme_bw() +
  geom_col(aes(x = labels, y = numbers), fill = "blue3", alpha = 0.6) +
  geom_text(aes(x = labels, y = numbers + 5, label = numbers), ) +
  xlab("Molecular Sex") +
  ylab("Number of individuals")

#--- Export the plot ---#
pdf("sexes.pdf", width = 4, height = 3)
ggplot(data) +
  theme_bw() +
  geom_col(aes(x = labels, y = numbers), fill = "blue3", alpha = 0.6) +
  geom_text(aes(x = labels, y = numbers + 5, label = numbers), ) +
  xlab("Molecular Sex") +
  ylab("Number of individuals")
dev.off()

#-------------------------------#
#  Export the cleaned sex data  #
#-------------------------------#
colnames(sexesfull) <- c("NEA", "Molecular_Sex")
write.csv(sexesfull, "molecular-sexes.csv", quote = FALSE, row.names = FALSE)

