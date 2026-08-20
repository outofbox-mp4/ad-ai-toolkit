# Data Schemas

这里存放广告分析的数据字典和指标口径说明，用来让 Agent 在分析前先统一字段含义、计算公式、数据来源和分层维度。

它不是报表导出目录，也不保存真实账户数据。真实广告账户导出、CRM 数据、客户信息和收入明细都不应提交到仓库。

## 当前文件

| File | Purpose |
| --- | --- |
| [funnel-metrics.md](./funnel-metrics.md) | 定义广告漏斗指标、公式和数据质量规则 |
| [google-ads-fields.md](./google-ads-fields.md) | 说明 Google Ads 常用字段、成本转换和脱敏处理 |
| [market-segmentation.md](./market-segmentation.md) | 定义市场、意图、人群、offer 等分层维度 |

## 使用方式

分析类 skill 应先引用这里的口径，再做诊断。若数据来源不同，例如 Google Ads、GA4、CRM 或 warehouse，需要明确标注来源和归因窗口，不能把不同口径的转化或收入直接混用。
