# Data Schemas

这里存放广告分析的数据字典和指标口径说明，用来让 Agent 在分析前先统一字段含义、计算公式、数据来源和分层维度。

## 当前文件

| File | Purpose |
| --- | --- |
| [funnel-metrics.md](./funnel-metrics.md) | 定义广告漏斗指标、计算公式和业务指标数据 |
| [google-ads-fields.md](./google-ads-fields.md) | 说明 Google Ads 常用字段 |
| [market-segmentation.md](./market-segmentation.md) | 定义市场、意图、人群、offer 等分层维度 |

## 使用方式

分析类 skill 应先引用这里的口径，再做诊断。若数据来源不同，例如 Facebook Ads、GA4、CRM 或 SQL warehouse，需要明确标注来源和归因窗口，不能把不同口径的转化或收入直接混用。
