# Copyright (c) 2026 Andrew R. Crocker
# Notes from the Abstract
# After Everything Else Is Accounted For
# Male-to-female hazard ratios for cause-specific mortality
# Data: Francis et al., JAMA Netw Open. 2026;9(1):e2556299
# NHANES 1999-2018, n=47,056

library(ggplot2)
library(dplyr)

theme_1950s <- function() {
  theme_minimal(base_family = "Arial", base_size = 14) +
    theme(
      plot.background = element_rect(fill = "#FAF5E9", color = NA),
      panel.background = element_rect(fill = "#FAF5E9", color = NA),
      panel.grid.major = element_line(color = "#E6DECA", linewidth = 0.6),
      panel.grid.minor = element_blank(),
      axis.title = element_text(face = "bold", color = "#3A3A3A"),
      axis.text = element_text(color = "#4A4A4A"),
      plot.title = element_text(face = "bold", size = 20, color = "#3A3A3A"),
      plot.subtitle = element_text(size = 13, color = "#5A5A5A"),
      plot.margin = margin(15, 15, 15, 15),
      legend.position = "none"
    )
}

# Fully adjusted male-to-female hazard ratios (Table 2)
data <- data.frame(
  cause = c("Heart disease", "Diabetes", "Stroke", "Cancer",
            "Influenza &\npneumonia", "Unintentional\ninjuries",
            "Kidney disease", "Alzheimer\ndisease", "Chronic lower\nrespiratory"),
  hr = c(1.96, 1.90, 1.72, 1.68, 1.53, 1.50, 1.48, 1.12, 0.96),
  significant = c(TRUE, TRUE, TRUE, TRUE, FALSE, TRUE, FALSE, FALSE, FALSE)
)

data$cause <- factor(data$cause, levels = rev(data$cause))
data$fill_color <- ifelse(data$significant, "#C0392B", "#D5A6A1")
data$label <- ifelse(data$significant,
                     sprintf("%.2f", data$hr),
                     sprintf("%.2f (ns)", data$hr))
data$label_color <- ifelse(data$significant, "#3A3A3A", "#888888")

p <- ggplot(data, aes(x = hr, y = cause, fill = fill_color)) +
  geom_col(width = 0.6) +
  scale_fill_identity() +
  geom_vline(xintercept = 1.0, color = "#3A3A3A", linewidth = 1, alpha = 0.5) +
  geom_text(aes(label = label, color = label_color),
            hjust = -0.1, size = 4.5, fontface = "bold") +
  scale_color_identity() +
  scale_x_continuous(limits = c(0, 2.3),
                     breaks = c(0, 0.5, 1.0, 1.5, 2.0),
                     labels = c("0", "0.5", "1.0\n(equal)", "1.5", "2.0")) +
  annotate("text", x = 1.96, y = 9.5,
           label = "Men are 96% more likely\nto die of heart disease\nafter adjusting for all\nbehavioral confounders.",
           size = 3.5, color = "#C0392B", fontface = "italic", hjust = 0.5) +
  labs(
    title = "After Everything Else Is Accounted For",
    subtitle = "Male-to-female hazard ratios for cause-specific mortality, adjusted for age,\nrace, smoking, alcohol, BMI, diabetes, hypertension, and chronic conditions.\nA value of 1.0 means equal risk. Values above 1.0 mean men die at higher rates.",
    x = NULL, y = NULL,
    caption = "Source: Francis et al., JAMA Netw Open, 2026;9(1):e2556299.\nNHANES 1999-2018, n=47,056. ns = not statistically significant (p > .05)."
  ) +
  theme_1950s() +
  theme(
    panel.grid.major.y = element_blank(),
    plot.caption = element_text(size = 9, color = "#7A7A7A", hjust = 0, lineheight = 1.3),
    axis.text.y = element_text(face = "bold", size = 12)
  )

print(p)

ggsave("~/Downloads/adjusted_mortality_ratios.png", plot = p,
       width = 1456/100, height = 819/100, dpi = 100, bg = "#FAF5E9")
