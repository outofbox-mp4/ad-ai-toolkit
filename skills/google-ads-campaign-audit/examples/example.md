# Example: Google Ads Campaign Audit

> Fictional example only. The account, campaign names, IDs, conversion counts, and spend values are anonymized and should not be treated as real customer data.

## User Prompt

```text
Use $google-ads-campaign-audit to review FlowNote Google Ads performance for account_alpha.
Compare 2026-08-12 to 2026-08-18 with 2026-08-05 to 2026-08-11.
Primary conversion is trial registration. Target CPA is $30.
Do not modify the account, and keep account IDs and raw campaign names out of the output.
```

## Example Output

结论：FlowNote 这 7 天没有出现 CPA 失控，主要问题是 Search 量级回落，PMax 注册便宜但 trial 质量仍偏弱。当前 trial CPA 为 `$18.42`，低于 `$30` 目标；建议先恢复 Search 有效流量，再限制 PMax 的低意图扩量。

### Account Summary

| Period | Spend | Clicks | Register | Trial | Cost / Trial | Main Read |
| --- | ---: | ---: | ---: | ---: | ---: | --- |
| 2026-08-12 to 2026-08-18 | $1,842.10 | 4,860 | 312 | 100 | $18.42 | CPA 可控，量级下降 |
| 2026-08-05 to 2026-08-11 | $2,205.40 | 5,740 | 371 | 124 | $17.79 | 基准量级更高 |
| Change | -16.5% | -15.3% | -15.9% | -19.4% | +3.5% | 不是花费暴涨，而是有效量减少 |

### Campaign Table

| Campaign | Channel | Spend | Clicks | Register | Trial | Cost / Register | Cost / Trial | Judgment |
| --- | --- | ---: | ---: | ---: | ---: | ---: | ---: | --- |
| `search_core_tasks` | Search | $860.30 | 1,920 | 154 | 68 | $5.59 | $12.65 | 仍是主力，trial 下降来自点击量减少 |
| `search_competitor_test` | Search | $314.20 | 680 | 28 | 5 | $11.22 | $62.84 | CPA 高，需要拆看 query 与竞品意图 |
| `pmax_trial_growth` | PMax | $512.60 | 1,840 | 110 | 22 | $4.66 | $23.30 | 注册便宜，但 trial 转化率偏低 |
| `display_remarketing` | Display | $155.00 | 420 | 20 | 5 | $7.75 | $31.00 | 小量级，保留观察 |

### What Changed

- Search 核心系列 spend 下降 `18.8%`，click 下降 `17.4%`，trial 下降 `20.9%`；Search impression share 稳定，CPC 未显著上涨，优先排查预算节奏、关键词状态、广告强度和落地页可用性。
- 竞品测试系列 cost / trial 达 `$62.84`，超过目标 CPA；这更像流量意图问题，而不是全账户 tracking 问题。
- PMax 注册成本低，但 register to trial rate 只有 `20.0%`，低于 Search 核心系列的 `44.2%`；暂不建议把 Search 预算直接转给 PMax。
- Payment 数据处于短 cohort，不足以判断 30 天收入质量。

### Recommended Actions

| Priority | Action | Evidence | Risk |
| --- | --- | --- | --- |
| P1 | 对 `search_core_tasks` 做只读 delivery 检查：预算受限、关键词状态、广告拒登、落地页状态和 search impression share 变化 | 主力系列 CPA 可控但量级下降 | Low |
| P1 | 对 `search_competitor_test` 拉 search-term anomaly review，区分竞品研究词、登录/下载词和无关词 | cost / trial 高于目标 109.5% | Medium |
| P2 | PMax 保持当前预算，不因低注册成本直接扩量；先检查 asset group、final URL expansion、geo 和 audience signal | 低注册成本没有转化为 trial 质量 | Medium |
| P2 | 若下周 Search trial 仍下降，再对核心关键词的 rank-lost IS 与 CPC 做 auction 复盘 | 当前证据不支持直接归因竞争加剧 | Low |

所有动作均为建议或只读检查；未获得明确批准前，不调整预算、出价、否定词或投放状态。
