######################################
#  COMMANDS FOR SUMMARISING RIGHT    #
#  WHALE SAMPLE DATA.                #
#                                    #
#              by                    #
#         Tim Frasier                #
#    Last Updated: 18-Jul-2025       #
######################################


############################
#  Load Needed Packages    #
############################
library(ggplot2)


################################
#  Samples by Year             #
################################

#--- Read data into R ---#
samples <- read.table("samples-by-year.csv", header = TRUE, sep = ",")

colnames(samples) <- c("year", "samples")

#--- Plot the data ---#
ggplot(samples) +
  theme_bw() +
  geom_col(aes(x = year, y = samples), fill = "blue3", alpha = 0.6) +
  ylab("Samples Collected") +
  xlab("Year")

#--- Write plot to file ---#
pdf(file = "samples-by-year.pdf", width = 5, height = 3)
ggplot(samples) +
  theme_bw() +
  geom_col(aes(x = year, y = samples), fill = "blue3", alpha = 0.6) +
  ylab("Samples Collected") +
  xlab("Year")
dev.off()
