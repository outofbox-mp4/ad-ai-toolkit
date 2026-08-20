---
name: search-term-anomaly-diagnosis
description: Diagnose whether search queries are driving abnormal spend, CPC, CPA, ROI, or conversion decline. Use when spend or CPC spikes, CPA exceeds target, conversions fall, or high-spend zero-conversion search terms may explain an anomaly. Do not use for routine keyword expansion or direct negative-keyword changes.
---

# Search-Term Anomaly Diagnosis

## 适用场景

用于花费暴涨、CPC 暴涨、CPA 异常、转化少/无转化、ROI 变差时，从搜索词排查是否有高花费无关主题词、低质量意图或新 query theme。

参考：[methodology/search-term-analysis.md](../../methodology/search-term-analysis.md)、[sops/search-term-waste-checklist.md](../../sops/search-term-waste-checklist.md)。

## 输入数据要求

- 当前周期和基线周期。
- target CPA、target ROI 或可接受范围。
- conversion 定义：注册、试用、付费或收入。
- search term、campaign、ad group、keyword、match type、spend、clicks、CPC、registrations、trials、payments、revenue/ROI。
- 已知 tracking、landing page、bid、match type 或 campaign 变更。

## 分析顺序

1. 先确认账户级异常是否真实存在，且当前周期与基线可比。
2. 按 query 找高花费 0 转化、高点击 0 注册、注册多 0 试用、试用多 0 付费。
3. 找 CPC 或 spend 突然上升的新 query theme。
4. 将 query 分类：无关、相关但错配、竞品、研究/教程、相关但低效、样本不足。
5. 判断异常来自搜索词浪费、CPC/竞争、落地页错配、产品/offer 弱，还是 tracking/upload 问题。
6. 只输出否定词候选和调整建议，不自动执行。

## 必须拆解的指标

query spend、clicks、CPC、registrations、registration CPA、trials、trial CPA、payments、payment CPA、revenue、ROI；若缺少下游数据，明确说明无法判断 query 质量到哪一段。

## 必须分层的维度

query theme、search term、campaign、ad group、keyword、match type、device、country/market、landing page、date。

## 判断阈值

- query spend >= 目标 CPA 的 1 倍且 0 conversion：进入高花费 0 转化队列。
- query clicks >= 账户该类 query 正常转化所需点击量的 1.5 倍且 0 registration：标记浪费风险。
- CPC 较基线上升 >= 20%：标记成本压力。
- CPA 超目标或较基线恶化 >= 20%：标记异常。
- 新 theme 占当前 search spend >= 10%：必须单独解释。
- 小花费、少点击、无转化：只进入观察队列，不直接否定。

## 不允许跳过的证据

- 当前周期 vs 基线的 spend、CPC、conversion 和 CPA。
- 高花费 0 转化列表。
- 新 query theme。
- 否定词候选的 match level、证据和误伤风险。
- 相关但低效 query 的落地页/offer/tracking 检查。

## 输出格式

1. 异常定义和影响范围。
2. Driver table：theme/query、current vs baseline spend、CPC、registrations、trials、payments、CPA/ROI、classification、hypothesis、action、risk。
3. High-spend zero-conversion queue。
4. Negative candidate list：exact/phrase/broad、reason、false-positive risk、reviewer。
5. 非广告侧检查：landing page、product、sales/ops、tracking。

## 可执行动作分类

| Category | Allowed Output |
| --- | --- |
| 广告侧可执行 | 否定词候选、query 隔离、match type 收紧、预算控制、campaign/ad group 结构建议 |
| 落地页/网站侧建议 | query intent 与页面错配、CTA/表单/页面速度检查 |
| 产品侧建议 | 相关需求但产品供给不足、功能/场景页缺失 |
| 销售/运营侧建议 | 高意图 trial 无付费时检查跟进和激活 |
| 需要业务决策 | 竞品词策略、免费/教程流量是否保留学习预算 |

## Prompt examples

```text
Use $search-term-anomaly-diagnosis to investigate a CPA anomaly for account <account-alias>.
Compare <current-period> with <baseline-period>. Target CPA is <target-cpa>;
conversion is <conversion-definition>. Identify high-spend zero-conversion terms,
new query themes, and review-only negative candidates. Do not modify the account.
```

## Guardrails

- Never add negatives automatically.
- Do not label relevant but high-CPA query as waste before checking landing-page fit, conversion definition and downstream quality.
- Do not expose raw exports, customer data, credentials or account IDs in public examples.
