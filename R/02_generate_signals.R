library(TTR)
library(tidyverse)

# Load the cleaned data
data <- read_csv("data/BTC_MSTR_MTPLF_Clean.csv")

# Calculate RSI for Bitcoin
data <- data %>%
  arrange(Date) %>%
  mutate(RSI = RSI(BTC_USD, n = 14))

# Generate signal
data <- data %>%
  mutate(Signal = case_when(
    RSI < 40 ~ "ENTRY",
    RSI > 70 ~ "EXIT",
    TRUE ~ NA_character_
  ))

# Save signal CSV
write_csv(data, "data/BTC_Signals.csv")

message("✅ Signals generated and saved to /data/BTC_Signals.csv")
