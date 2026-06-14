# Copyright (c) 2026 Andrew R. Crocker
# Notes from the Abstract
# The Rural Penalty: Urban-rural life expectancy gap by sex over two decades
# Data: Chapel et al., Journal of Rural Health, 2025;41(1):e12875

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

data <- data.frame(
  sex = c("Men", "Men", "Women", "Women"),
  period = c("1994-2000", "2014-2020", "1994-2000", "2014-2020"),
  gap_years = c(0.7, 2.0, 0.3, 0.5),
  label = c("Men\n(1994–2000)", "Men\n(2014–2020)", "Women\n(1994–2000)", "Women\n(2014–2020)")
)

data$label <- factor(data$label, levels = data$label)
data$fill_color <- c("#E6B0AA", "#C0392B", "#A9CCE3", "#2471A3")

p <- ggplot(data, aes(x = label, y = gap_years, fill = fill_color)) +
  geom_col(width = 0.55) +
  scale_fill_identity() +
  geom_text(aes(label = paste0(gap_years, " yrs")),
            vjust = -0.5, size = 5.5, fontface = "bold", color = "#3A3A3A") +
  geom_vline(xintercept = 2.5, linetype = "dashed", color = "#D5C8B0", linewidth = 0.5) +
  scale_y_continuous(limits = c(0, 2.7),
                     breaks = c(0, 0.5, 1.0, 1.5, 2.0, 2.5),
                     labels = c("0", "0.5 yr", "1.0 yr", "1.5 yrs", "2.0 yrs", "2.5 yrs")) +
  labs(
    title = "The Rural Penalty",
    subtitle = "How many fewer years a 60-year-old rural American is expected to live\ncompared to an urban counterpart. The disparity nearly tripled for men\nover two decades. For women, it barely moved.",
    x = NULL, y = NULL,
    caption = "Source: Chapel et al., Journal of Rural Health, 2025;41(1):e12875.\nUSC Schaeffer Center, September 2024."
  ) +
  theme_1950s() +
  theme(
    panel.grid.major.x = element_blank(),
    plot.caption = element_text(size = 9, color = "#7A7A7A", hjust = 0, lineheight = 1.3)
  )

print(p)

ggsave("~/Downloads/rural_penalty_chart.png", plot = p,
       width = 1456/100, height = 819/100, dpi = 100, bg = "#FAF5E9")
