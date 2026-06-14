# Copyright (c) 2026 Andrew R. Crocker
# Notes from the Abstract
# Men's vs Women's Health Centers at US News Honor Roll Hospitals (2025-2026)

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

# Data
data <- data.frame(
  Category = c("Women's Health\nCenter", "Men's Health\nCenter\n(Any Type)", "Men's Health\nCenter\n(Multidisciplinary)"),
  Count = c(19, 9, 3),
  Total = c(19, 19, 19),
  Pct = c(100, 47.4, 15.8)
)

data$Category <- factor(data$Category, levels = data$Category)

p <- ggplot(data, aes(x = Category, y = Pct)) +
  geom_col(fill = c("#2471A3", "#C0392B", "#C0392B"), width = 0.6, alpha = c(1, 1, 0.6)) +
  geom_text(aes(label = paste0(round(Pct), "%\n(", Count, " of ", Total, ")")),
            vjust = -0.3, size = 5, fontface = "bold", color = "#3A3A3A") +
  scale_y_continuous(limits = c(0, 115), breaks = seq(0, 100, 25),
                     labels = paste0(seq(0, 100, 25), "%")) +
  labs(
    title = "Who Gets a Program?",
    subtitle = "Gender-specific health centers at the 20 US News Honor Roll hospitals, 2025-2026.\nEvery hospital has a women's health center. Fewer than half have anything for men.",
    x = NULL,
    y = NULL,
    caption = "Source: Notes from the Abstract analysis of US News 2025-2026 Best Hospitals Honor Roll.\nHospital websites surveyed June 2026. Multidisciplinary = primary care + 3 or more specialties."
  ) +
  theme_1950s() +
  theme(
    plot.caption = element_text(size = 9, color = "#7A7A7A", hjust = 0, lineheight = 1.3),
    panel.grid.major.x = element_blank(),
    axis.text.x = element_text(size = 12, face = "bold", lineheight = 1.1)
  )

print(p)

ggsave("~/Downloads/honor_roll_health_centers.png", plot = p,
       width = 1456/100, height = 819/100, dpi = 100, bg = "#FAF5E9")
