# 📊 Bitcoin Proxy RSI Strategy — Beginner Project Using R & ChatGPT

## 🗓️ Built in One Day from Scratch

Someone casually asked me to “look into” two companies — **MicroStrategy (MSTR)** and **Metaplanet Inc. (MTPLF)**.

I had no prior trading experience. But I used that suggestion as a launchpad.

With **ChatGPT as my research and coding assistant**, I figured out that these two companies are often treated as **proxy assets for Bitcoin** (because they hold BTC on their balance sheets).

From that insight, I built this entire analysis pipeline using **R** — in a single day.

---

## 💡 What I Built

A **Bitcoin RSI strategy** that checks for “ENTRY” and “EXIT” signals and tracks how those signals would have performed if followed — not just for Bitcoin, but also for MSTR and MTPLF.

---

## 🛠️ Tools & Workflow

**Tools:** R, tidyverse, TTR, lubridate, writexl, ChatGPT  
**Assets Analyzed:**
- 🪙 BTC (from CoinGecko)
- 📈 MSTR (MicroStrategy – USD stock)
- 🇯🇵 MTPLF (Metaplanet – JPY stock, from Yahoo Japan)

**What I Did:**
1. Fetched, cleaned, and aligned historical price data
2. Calculated **RSI** for Bitcoin
3. Defined entry/exit logic (RSI < 40 → ENTRY; RSI > 70 → EXIT)
4. Backtested the strategy using real BTC prices
5. Measured % returns and holding periods between signals

---

## 📂 Files in This Repo

### 📁 Data Files

| File | Description |
|------|-------------|
| `BTC_CoinGecko.xlsx` | Raw BTC price data from CoinGecko |
| `BTC_MSTR_MTPLF_Merged.xlsx` | Merged BTC, MSTR, and MTPLF (including market cap & volume) |
| `BTC_MSTR_MTPLF_Clean.xlsx` | Cleaned dataset with just BTC, MSTR, MTPLF prices |
| `BTC_Signals.xlsx` | RSI values + ENTRY/EXIT signals |
| `BTC_RSI_Backtest.xlsx` | Backtest results for BTC, MSTR, and MTPLF based on RSI signals |

### 📁 Script Files

| Script | Purpose |
|--------|---------|
| `01_merge_data.R` | Reads and merges raw BTC, MSTR, and MTPLF files |
| `02_generate_signals.R` | Calculates RSI and labels each row as ENTRY, EXIT, or NA |
| `03_backtest_signals.R` | Pairs ENTRY and EXIT signals and calculates returns for BTC, MSTR, MTPLF |

---

## 🧠 Why This Matters to Me

I didn’t build this because I’m a trader. I built this because I’m a **data analyst** and I wanted to see how far I could go in a single day using:
- Real market data
- AI assistance (ChatGPT)
- My own drive to build something concrete

This project shows what happens when you follow a simple idea, leverage the tools around you, and just **start**.

---

⚠️ **Disclaimer:** This is not financial advice. This is a learning project.

