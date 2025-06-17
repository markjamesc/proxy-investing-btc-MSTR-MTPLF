# 03_backtest_signals.R
# Backtests RSI-based ENTRY/EXIT strategy on BTC, MSTR, and MTPLF

library(tidyverse)
library(lubridate)
library(writexl)

# ===== 1. Load Signal Data =====
signals <- read_csv("data/BTC_Signals.csv") %>%
  arrange(Date) %>%
  filter(!is.na(Signal)) %>%
  mutate(Date = as.Date(Date))

# ===== 2. Initialize Trades Table =====
trades <- tibble()

# ===== 3. Walk Through Signal Rows =====
i <- 1
while (i <= nrow(signals)) {
  if (signals$Signal[i] == "ENTRY") {
    entry_date <- signals$Date[i]
    entry_btc <- signals$BTC_USD[i]
    entry_mstr <- signals$MSTR[i]
    entry_mtplf <- signals$MTPLF_USD[i]
    
    # Find next EXIT after this ENTRY
    exit_idx <- which(signals$Signal == "EXIT" & signals$Date > entry_date)[1]
    
    if (!is.na(exit_idx)) {
      exit_date <- signals$Date[exit_idx]
      exit_btc <- signals$BTC_USD[exit_idx]
      exit_mstr <- signals$MSTR[exit_idx]
      exit_mtplf <- signals$MTPLF_USD[exit_idx]
      
      # Calculate returns
      return_btc <- round((exit_btc - entry_btc) / entry_btc * 100, 2)
      return_mstr <- round((exit_mstr - entry_mstr) / entry_mstr * 100, 2)
      return_mtplf <- round((exit_mtplf - entry_mtplf) / entry_mtplf * 100, 2)
      days_held <- as.numeric(difftime(exit_date, entry_date, units = "days"))
      
      # Record trade
      trades <- bind_rows(trades, tibble(
        Entry_Date = entry_date,
        Exit_Date = exit_date,
        Days_Held = days_held,
        BTC_Entry = entry_btc,
        BTC_Exit = exit_btc,
        BTC_Return = return_btc,
        MSTR_Entry = entry_mstr,
        MSTR_Exit = exit_mstr,
        MSTR_Return = return_mstr,
        MTPLF_Entry = entry_mtplf,
        MTPLF_Exit = exit_mtplf,
        MTPLF_Return = return_mtplf
      ))
      
      i <- exit_idx  # skip ahead to next trade after this EXIT
    } else {
      break  # no more EXITs
    }
  }
  i <- i + 1
}

# ===== 4. Save Final Trade History =====
write_xlsx(trades, "data/BTC_RSI_Backtest.xlsx")
message("✅ Backtest complete. Results saved to /data/BTC_RSI_Backtest.xlsx")

