# Load necessary libraries
library(Boruta)  # For feature selection using the Boruta algorithm
library(dplyr)   # For data manipulation
library(reshape2) # For reshaping data
library(ggplot2) # For plotting

# Read data from CSV file
data <- read.csv('all_features.csv')

# Define the groups to iterate over
groups <- c("group_30", "group_1y", "group_180", "group_90")

# Loop through each group to perform Boruta
for (group in groups) {
  # Define features (X) and target label (y)
  X <- data[, !names(data) %in% c(group, "livetime", "death")]  # Feature data
  y <- data[[group]]  # Target variable for the current group
  
  # Run the Boruta algorithm for feature selection
  boruta <- Boruta(x = X, y = y, pValue = 0.01, mcAdj = TRUE, maxRuns = 300)
  
  # Print the results of Boruta
  print(boruta)
  print(table(boruta$finalDecision))  # Show the counts of each decision made by Boruta
  
  # Process and plot the results
  boruta.variable.imp <- boruta.imp(boruta)  # Process the results
  
  # Create a boxplot for feature importance including tentative features
  p <- ggplot(boruta.variable.imp, aes(x = Variable, y = Importance, fill = finalDecision)) +
    geom_boxplot(outlier.shape = 1) +  # Boxplot with outliers
    scale_fill_manual(values = c("shadowMax" = "lightgray", 
                                  "shadowMean" = "gray", 
                                  "shadowMin" = "darkgray", 
                                  "Confirmed" = "royalblue", 
                                  "Tentative" = "orange", 
                                  "Rejected" = "red")) +  # Custom colors for feature status
    theme_minimal() +  # Use a minimal theme
    theme(axis.text.x = element_text(angle = 90, hjust = 1, vjust = 0.5, color = "black"),  # Rotate x-axis labels
          panel.grid = element_blank(),  # Remove grid lines
          panel.border = element_rect(fill=NA),  # No fill for panel border
          axis.ticks = element_line(color = "black")) +  # Black ticks for axes
    labs(
      x = "Feature",  # Label for x-axis
      y = "Importance",  # Label for y-axis
      fill = "Feature Status") +  # Label for legend
    ggtitle(paste("Boruta Results for", group))  # Add title with group name
  
  # Save the plot as a PDF file for each group
  ggsave(filename = paste0("Boruta_results_", group, ".pdf"), plot = p, width = 10, height = 6)
}

# Function to process the results of the Boruta algorithm
boruta.imp <- function(x) {
  # Melt the Importance History to long format
  imp <- melt(x$ImpHistory, na.rm = TRUE)[, -1]  
  colnames(imp) <- c("Variable", "Importance")  # Rename columns
  imp <- imp[is.finite(imp$Importance), ]  # Filter out finite importance values
  
  # Create a data frame for final decisions
  variableGrp <- data.frame(Variable = names(x$finalDecision), 
                            finalDecision = x$finalDecision)
  
  # Define shadow feature groups
  showGrp <- data.frame(Variable = c("shadowMax", "shadowMean", "shadowMin"),
                        finalDecision = c("shadowMax", "shadowMean", "shadowMin"))
  
  # Combine variable groups with importance values
  variableGrp <- rbind(variableGrp, showGrp)
  boruta.variable.imp <- merge(imp, variableGrp, all.x = TRUE)
  
  # Sort variables by median importance
  sortedVariable <- boruta.variable.imp %>% 
    group_by(Variable) %>% 
    summarise(median = median(Importance)) %>% 
    arrange(median)
  sortedVariable <- as.vector(sortedVariable$Variable)
  
  # Reorder the factor levels for plotting
  boruta.variable.imp$Variable <- factor(boruta.variable.imp$Variable, levels = sortedVariable)
  
  return(boruta.variable.imp)  # Return the processed importance data
}
