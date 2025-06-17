# 📈 Bitcoin RSI Strategy Analysis

## 🗂 Data Sources Used

- `BTC_CoinGecko.csv`: Daily BTC price from CoinGecko
- `MSTR_Yahoo.csv`: MicroStrategy daily stock price (proxy for BTC exposure)
- `MTPLF_Yahoo_Japan.csv`: Metaplanet daily stock price (Japanese BTC proxy)
- `BTC_MSTR_MTPLF_Merged.csv`: Full merged dataset
- `BTC_MSTR_MTPLF_Clean.csv`: Cleaned version with NAs removed and converted prices
- `BTC_Signals.csv`: Buy/Sell signals based on RSI (<40 entry, >70 exit)
- `BTC_RSI_Backtest.xlsx`: Backtest of the RSI strategy

---

## ⚙️ Strategy Summary

The strategy used the **Relative Strength Index (RSI)** on BTC's price to generate simple trading signals:

- **ENTRY**: When RSI < 40
- **EXIT**: When RSI > 70

This mimics a contrarian momentum strategy, buying BTC when it's relatively weak and selling when it's strong.

---

## 📊 Backtest Results

Key performance stats from `BTC_RSI_Backtest.xlsx`:

- 📅 Total Trades: *N* (determined from file)
- 📈 Average Return per Trade: *X.XX%*
- 📆 Average Days Held: *Y* days
- ✅ Win Rate: *Z%* (number of positive returns / total)

> Note: This strategy does **not** use leverage or consider trading fees or slippage.

---

## 💡 Observations

- RSI-generated entries often correlate with BTC dips and can be used as **long-only signals**.
- Holding periods vary from **short-term rebounds** to **multi-week rallies**.
- Signal generation is very simple—adding more indicators may improve precision.

---

## 🔍 Limitations

- Based purely on RSI (single indicator)
- Only uses closing price, no intraday data
- No incorporation of volume, volatility, or macro indicators
- No stop-loss or trailing mechanisms
- No position sizing logic

---

## 💭 Future Improvements

1. **Add More Indicators**: MACD, Bollinger Bands, moving average crossovers.
2. **Multi-Asset Strategy**: Compare performance of BTC vs. MSTR and MTPLF to find better proxies or diversifiers.
3. **Position Sizing Logic**: Add risk control.
4. **Trading Cost Simulation**: Include slippage and fees.
5. **Sharpe Ratio & Drawdown Metrics**: For full portfolio evaluation.

---

## 👶 Context

This project was created by a **complete beginner to trading** using ChatGPT guidance and R scripting. The companies (MSTR and Metaplanet) were given by a friend. The idea of treating them as BTC proxies emerged from GPT’s analysis. All scripting and strategy design were completed in **one day** using public data.

---

## 🧠 Key Takeaway

Even with basic technical indicators and open data, it is possible to prototype a strategy and evaluate its historical performance. While not financial advice, this project demonstrates a **strong foundation** for building automated trading systems using R.

---
