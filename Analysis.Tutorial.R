# Load necessary libraries ----
# install.packages("tidyverse")
# install.packages("ggplot2")
# library(tidyverse)
# library(ggplot2)

# Load the dataset ----
setwd("C:/Users/cameron_anderson2/Box/MS Biology/Classes/BIO 5202/Analysis Tutorial") # Insert relevant working directory
venom_data <- read.csv("venom_composition.csv")

# View first few rows
head(venom_data)

# Check for missing values
sum(is.na(venom_data))

# Transform data to long format for visualization
venom_long <- venom_data %>%
  pivot_longer(cols = -Species, names_to = "Toxin", values_to = "Presence") %>%
  mutate(Toxin = gsub("\\.", " ", Toxin))  # Remove periods inbetween toxin names

# Plot heatmap
toxin_overlap <- ggplot(venom_long, aes(x = Species, y = Toxin, fill = factor(Presence))) +
  geom_tile(width = 0.9) +  # Makes each column wider)
  scale_fill_manual(values = c("0" = "red", "1" = "darkgreen"),
                      labels = c("0" = "Absent", "1" = "Present")) +
  scale_x_discrete(expand = expansion(mult = 0.1)) +  # Increase column spacing
  theme_minimal() +
  labs(title = "Venom Toxin Presence Across *Crotalus* Genus", fill = "Toxin Presence") +
  theme(
    axis.text.x = element_text(angle = 45, hjust = 1),  # Tilt x-axis labels
    plot.title = element_text(hjust = 0.5),  # Center title
    aspect.ratio = 1.5  # Adjust aspect ratio to spread columns
  )

toxin_overlap

# Save the plot with more space
ggsave("venom_overlap.png", plot = toxin_overlap, width = 12, height = 6, dpi = 300, bg = "white")
