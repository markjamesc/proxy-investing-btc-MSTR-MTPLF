# Bitcoin Proxy RSI Strategy — Legacy Project

This repository preserves an earlier one-day R analysis of Bitcoin, MicroStrategy (MSTR), and Metaplanet (MTPLF). It is retained to show the starting point from which the later, decision-focused portfolio analysis was rebuilt.

> **Current version:** [AI-Augmented Bitcoin Proxy Analysis](https://github.com/markjamesc/ai-augmented-bitcoin-proxy-analysis)

The current project expands the comparison to six companies, models value per diluted common share, incorporates capital-structure and execution risks, records internal checks across 18 company-scenario observations, and produces an employer-facing report and presentation.

## Original project objective

The original analysis asked how a simple Bitcoin RSI entry/exit rule would have performed not only for Bitcoin but also for two Bitcoin-sensitive public equities.

## Workflow

1. Fetch, clean, and align historical price data.
2. Calculate Bitcoin RSI.
3. Label observations as entry, exit, or neutral.
4. Pair entry and exit signals.
5. Compare returns and holding periods across BTC, MSTR, and MTPLF.

The signal rule used in this learning project was:

- RSI below 40: entry
- RSI above 70: exit

## Stack

- R
- tidyverse
- TTR
- lubridate
- writexl
- ChatGPT-assisted research and coding

## Repository contents

### R scripts

| Script | Purpose |
|---|---|
| [`R/01_merge_data.R`](R/01_merge_data.R) | Merge and align BTC, MSTR, and MTPLF source data |
| [`R/02_generate_signals.R`](R/02_generate_signals.R) | Calculate RSI and create entry/exit labels |
| [`R/03_backtest_signals.R`](R/03_backtest_signals.R) | Pair signals and calculate asset returns |

### Data and outputs

| File | Purpose |
|---|---|
| [`data/BTC_CoinGecko.csv`](data/BTC_CoinGecko.csv) | Historical BTC data |
| [`data/BTC_MSTR_MTPLF_Merged.csv`](data/BTC_MSTR_MTPLF_Merged.csv) | Aligned multi-asset dataset |
| [`data/BTC_MSTR_MTPLF_Clean.csv`](data/BTC_MSTR_MTPLF_Clean.csv) | Clean analysis dataset |
| [`data/BTC_Signals.csv`](data/BTC_Signals.csv) | RSI and signal labels |
| [`data/BTC_RSI_Backtest.xlsx`](data/BTC_RSI_Backtest.xlsx) | Backtest output |

## Why this repository remains public

This project documents an earlier stage of the portfolio. It demonstrates rapid learning and modular R scripting, while the rebuilt project demonstrates the more mature standard: decision framing, benchmark selection, scenario design, dilution-aware modeling, reproducible validation, explicit uncertainty, and proportionate recommendation.

## Limitations

- The RSI thresholds were not tuned or independently validated.
- The analysis does not model transaction costs, taxes, liquidity, or slippage.
- A signal derived from Bitcoin is applied to proxy equities without establishing that it is optimal for those securities.
- The project is educational and is not investment advice.

