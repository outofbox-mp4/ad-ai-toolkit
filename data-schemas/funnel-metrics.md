# Funnel Metrics

## SaaS Funnel

| Metric | Formula | Notes |
| --- | --- | --- |
| Spend | ad cost | 从平台 micros 或原始币种转换 |
| Impressions | impressions | 展示量 |
| Clicks | clicks | 点击量 |
| CTR | clicks / impressions | 判断素材、文案和流量匹配 |
| CPC | spend / clicks | 判断流量成本压力 |
| Registrations | registration conversions | 过程指标，不等于最终质量 |
| Click-to-registration rate | registrations / clicks | 判断点击后页面和意图匹配 |
| Registration CPA | spend / registrations | 前漏斗获客成本 |
| Trials | trial conversions | SaaS/B2B 关键过程指标 |
| Registration-to-trial rate | trials / registrations | 判断注册质量和激活路径 |
| Trial CPA | spend / trials | 中漏斗成本 |
| Payments | payment conversions | 最终转化样本 |
| Trial-to-payment rate | payments / trials | 判断付费能力 |
| Payment CPA | spend / payments | 最终获客成本 |
| Revenue | conversion value or warehouse revenue | 需说明口径和成熟期 |
| AOV | revenue / payments | 判断客单价 |
| ROI | revenue / spend | 默认最终目标 |

## Data Quality Rules

- 不同平台归因不能直接相加为真实业务收入，除非有去重口径。
- Google Ads uploaded conversions、GA4 events、CRM/warehouse revenue 要分开标注来源。
- 当支付有 7/14/30 天成熟期时，近期 ROI 只能做方向判断。
- 样本不足时标注低置信度，不做强动作。
