Crotalus Venom Toxin Analysis

Overview<br>
This project explores the presence and overlap of venom toxins across multiple species within the Crotalus genus. The purpose of this analysis is to identify the most prevalent toxins across species and evaluate potential targets for the development of universal or broadly effective antivenoms.

Research Questions<br>
•	How much toxin overlap exists between Crotalus snake species?<br>
•	What are the most common venom toxins across the genus?<br>
•	How similar or different are venom compositions between species within the genus?<br>

Objectives<br>
•	Provide a framework for analyzing venom toxin composition in Crotalus snakes.<br>
•	Develop R code to import, clean, and visualize venom composition data.<br>
•	Summarize toxin distribution across species.<br>
•	Identify candidate toxin targets for universal antivenom development.<br>

Dataset<br>
The dataset was created using -omics data from peer-reviewed publications and includes binary (0 = Absent, 1 = Present) toxin composition data across multiple Crotalus species. Each row represents a species, and each column represents a specific toxin family.

R Script: Analysis.Tutorial.R<br>
The analysis tutorial performs the following:<br>
1.	Loads the venom composition dataset.<br>
2.	Transforms it into long format for easier visualization.<br>
3.	Plots a heatmap showing toxin presence across species.<br>
4.	Saves the plot for reporting or publication.<br>

Dependencies<br>
•	tidyverse<br>
•	ggplot2<br>

Running the Analysis<br>
#Install packages if needed<br>
#install.packages("tidyverse")<br>
#install.packages("ggplot2")<br>

#Load libraries<br>
library(tidyverse)<br>
library(ggplot2)<br>

#Set working directory and load data<br>
setwd("Insert relevant folder location")<br>
venom_data <- read.csv("venom_composition.csv")<br>

#View first few rows<br>
head(venom_data)<br>

#Check for missing values<br>
sum(is.na(venom_data))<br>

#Transform data to long format for visualization<br>
venom_long <- venom_data %>%<br>
  pivot_longer(cols = -Species, names_to = "Toxin", values_to = "Presence") %>%<br>
  mutate(Toxin = gsub("\\.", " ", Toxin))<br>

#Plot heatmap<br>
toxin_overlap <- ggplot(venom_long, aes(x = Species, y = Toxin, fill = factor(Presence))) +<br>
  geom_tile(width = 0.9) +  # Makes each column wider)<br>
  scale_fill_manual(values = c("0" = "red", "1" = "darkgreen"),<br>
                      labels = c("0" = "Absent", "1" = "Present")) +<br>
  scale_x_discrete(expand = expansion(mult = 0.1)) +  # Increase column spacing<br>
  theme_minimal() +<br>
  labs(title = "Venom Toxin Presence Across *Crotalus* Genus", fill = "Toxin Presence") +<br>
  theme(<br>
    axis.text.x = element_text(angle = 45, hjust = 1),  # Tilt x-axis labels<br>
    plot.title = element_text(hjust = 0.5),  # Center title<br>
    aspect.ratio = 1.5  # Adjust aspect ratio to spread columns<br>
  )<br>
toxin_overlap<br>

#Save the plot with more space<br>
ggsave("venom_overlap.png", plot = toxin_overlap, width = 12, height = 6, dpi = 300, bg = "white")<br>

References<br>
•	Borja et al. (2025). Venom variation and ontogenetic changes in the Crotalus molossus complex. Comparative Biochemistry and Physiology Part C: Toxicology & Pharmacology, 290, 110129. https://doi.org/10.1016/j.cbpc.2025.110129<br>
•	Calvete et al. (2009). Exploring the venom proteome of the western diamondback rattlesnake (Crotalus atrox). Journal of Proteome Research, 8(6), 3055–3067. https://doi.org/10.1021/pr900249q<br>
•	Rokyta et al. (2012). The venom-gland transcriptome of the eastern diamondback rattlesnake (Crotalus adamanteus). BMC Genomics, 13, Article 312. https://doi.org/10.1186/1471-2164-13-312<br>
•	Rokyta et al. (2013). The genesis of an exceptionally lethal venom in the timber rattlesnake (Crotalus horridus). BMC Genomics, 14, Article 394. https://doi.org/10.1186/1471-2164-14-394<br>
•	Segura et al. (2017). Proteomic and immunogenic characterization of Crotalus basiliscus venom. Journal of Proteomics, 158, 62–72. https://doi.org/10.1016/j.jprot.2017.02.015<br>
•	Strickland et al. (2018). Phenotypic variation in Crotalus scutulatus venom. Toxins, 10(4), Article 135. https://doi.org/10.3390/toxins10040135<br>
