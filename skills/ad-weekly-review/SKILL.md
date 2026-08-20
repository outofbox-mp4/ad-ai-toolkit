---
name: ad-weekly-review
description: Analyze weekly performance for Google Ads, Meta Ads, TikTok Ads, LinkedIn Ads, display platforms, or cross-channel ad programs. Use for recurring ad weekly reports, funnel diagnosis, anomaly review, and decision-ready optimization recommendations.
---

# Ad Weekly Review

## 适用场景

用于周度广告复盘、跨平台或单平台效果总结、团队周报和下周行动计划。默认 ROI 是主目标，注册和试用是过程指标。

参考：[templates/weekly-report-template.md](../../templates/weekly-report-template.md)、[methodology/roi-diagnosis.md](../../methodology/roi-diagnosis.md)。

## 输入数据要求

- 本周周期和基线周期。
- 平台、账户、币种、归因窗口和 conversion 定义。
- spend、impressions/reach、clicks、registrations、trials、payments、revenue。
- campaign、ad group/ad set、audience、creative、placement、keyword/search term、market、device 等可用分层。
- 本周重要变更：预算、出价、素材、落地页、产品、价格、tracking。

## 分析顺序

1. 校验口径和数据缺口。
2. 先给账户/渠道级 ROI 和漏斗结论。
3. 找解释最多变化的 campaign、market、audience、creative、query 或 placement。
4. 判断断点发生在 CPC、点击到注册、注册到试用、试用到付费、AOV 或 ROI。
5. 区分事实、假设、待验证数据和行动。
6. 给出下周优先级、owner、风险和复盘日期。

## 必须拆解的指标

Spend、impressions/reach、clicks、CTR、CPC、registrations、registration CPA、trials、trial CPA、payments、payment CPA、revenue、AOV、ROI。

## 必须分层的维度

platform/channel、campaign、ad group/ad set、market、device、audience、creative/asset、placement、keyword/search term、landing page。

## 判断阈值

- 任一核心 CPA 较基线恶化 >= 20% 或超目标：标异常。
- ROI 较基线下降 >= 20% 或低于目标：本周主风险。
- 花费变化 >= 20%：解释预算/投放变化。
- CVR 下降 >= 15%：定位漏斗质量问题。
- 新测试花费不足以产生 10 个试用或 3 个付费时，只做学习状态判断。

## 不允许跳过的证据

- 当前周期、基线周期、conversion 口径。
- ROI 或 revenue 是否成熟。
- Top drivers 对账户变化的贡献。
- 每个建议的证据、owner 和验证日期。

## 输出格式

1. Executive summary。
2. KPI table。
3. Funnel diagnosis。
4. Driver table。
5. Action classification。
6. Open questions / data caveats。

## 可执行动作分类

| Category | Allowed Output |
| --- | --- |
| 广告侧可执行 | 下周预算、出价、搜索词、受众、素材、结构、实验建议 |
| 落地页/网站侧建议 | 页面匹配、CTA、加载、表单、tracking 检查 |
| 产品侧建议 | 供给、功能、套餐、试用路径建议 |
| 销售/运营侧建议 | trial 激活、线索跟进、CRM 数据检查 |
| 需要业务决策 | ROI 目标、预算上限、市场取舍、是否保留学习预算 |

## Guardrails

- 不把平台归因混成真实业务 ROI，除非口径统一。
- 不在未授权时执行账户变更。
- 不把相关性说成因果。
