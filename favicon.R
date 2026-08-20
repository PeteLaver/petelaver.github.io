library(ggplot2)

# 1. Define geometric coordinates for your icon design
favicon_data <- data.frame(
  x = c(1, 2, 2, 1, 1, 1.5, 2),
  y = c(1, 1, 2, 2, 1, 1.5, 1)
)

# Set seed for reproducibility
set.seed(42)

# 1. Define independent variable (Time index)
time <- seq(0, 24, by = 0.1)

# 2. Configure sinusoidal components
amplitude <- 2
period    <- 48
phase     <- 2

# 3. Generate pure sine wave + Gaussian noise
y_pure  <- amplitude * sin((2 * pi / period) * time + phase)
y_noisy <- y_pure + rnorm(length(time), mean = 0, sd = 1)

# 4. Combine into a data frame
favicon_data <- data.frame(x = time, y = y_noisy)



# 2. Render a clean plot without background elements using theme_void()
favicon_plot <- ggplot(favicon_data, aes(x = x, y = y)) +
  geom_path(color = "red", linewidth = 2, lineend = "round", linejoin = "round") +
  theme_void() +
  theme(plot.background = element_rect(fill = "transparent", color = NA))

# 3. Save as standard web-friendly PNG sizes
ggsave("favicon-16.png", plot = favicon_plot, width = 1, height = 1, dpi = 16, bg = "transparent")
ggsave("favicon-32.png", plot = favicon_plot, width = 1, height = 1, dpi = 32, bg = "transparent")
