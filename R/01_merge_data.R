library(quantmod)
library(tidyverse)
library(lubridate)

# ========== 1. Load BTC Data ==========
btc_df <- read_csv("data/BTC_CoinGecko.csv") %>%
  rename(Date = 1, BTC_USD = 2, market_cap = 3, total_volume = 4) %>%
  mutate(Date = as.Date(Date))

# ========== 2. Stock Fetcher ==========
get_stock_close <- function(ticker, label) {
  stock <- getSymbols(ticker, auto.assign = FALSE, from = "2017-01-01")
  df <- data.frame(Date = index(stock), coredata(Cl(stock)))
  colnames(df)[2] <- label
  return(df)
}

# ========== 3. Get MSTR and MTPLF (JPY) ==========
mstr_df <- get_stock_close("MSTR", "MSTR")
mtplf_df <- get_stock_close("3350.T", "MTPLF_JPY")

# ========== 4. Get USD/JPY from FRED via fallback ==========
exchange_df <- read.csv("https://fred.stlouisfed.org/graph/fredgraph.csv?id=DEXJPUS") %>%
  rename(Date = 1, USDJPY = 2) %>%
  mutate(Date = as.Date(Date), USDJPY = as.numeric(USDJPY)) %>%
  filter(!is.na(USDJPY))

# ========== 5. Convert MTPLF to USD ==========
mtplf_usd <- left_join(mtplf_df, exchange_df, by = "Date") %>%
  mutate(MTPLF_USD = MTPLF_JPY / USDJPY) %>%
  select(Date, MTPLF_USD)

# ========== 6. Merge All ==========
merged <- reduce(
  list(btc_df, mstr_df, mtplf_usd),
  full_join,
  by = "Date"
) %>%
  arrange(Date)

# ========== 7. Filter to common valid rows ==========
filtered <- merged %>%
  filter(!is.na(BTC_USD) & !is.na(MSTR) & !is.na(MTPLF_USD))

# ========== 8. Save Both Versions ==========
dir.create("data", showWarnings = FALSE)

# Full version with market_cap and volume
write.csv(filtered, "data/BTC_MSTR_MTPLF_Merged.csv", row.names = FALSE)

# Clean version with just price signals
filtered %>%
  select(Date, BTC_USD, MSTR, MTPLF_USD) %>%
  write.csv("data/BTC_MSTR_MTPLF_Clean.csv", row.names = FALSE)

message("??? Saved: Merged (with volume/cap) and Clean (price-only) CSVs to /data/")


