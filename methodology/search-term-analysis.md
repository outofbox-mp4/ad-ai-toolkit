# Search Term Analysis Methodology

## Purpose

搜索词分析用于解释花费、CPC、CPA 或转化异常，不是普通关键词扩展清单。

## Query Classification

| Class | Meaning | Action |
| --- | --- | --- |
| Irrelevant | 与业务无关或明显错误意图 | 提精确/词组否定候选，需人工确认 |
| Relevant but mismatched | 需求相关但落到了错误广告组、文案或页面 | 调整结构、文案或落地页 |
| Competitor | 竞品、替代品或对比意图 | 按账户竞品策略保留、隔离或排除 |
| Research / Tutorial | 学习型、模板型、免费型意图 | 降预算、单独承接或内容化 |
| Relevant but inefficient | 业务相关但 CPA/ROI 弱 | 检查 CPC、页面、offer、下游质量 |
| Insufficient data | 花费和点击不足 | 进入观察队列，不直接否定 |

## Waste Signals

优先查：

- 高花费 0 转化。
- 高点击 0 注册。
- 注册多但 0 试用。
- 试用多但 0 付费。
- CPC 或花费突然上涨的新 query theme。
- 与产品/行业无关的主题词。

## Guardrails

不要仅因一个词 0 转化就否定。否定词必须说明 match level、证据、误伤风险和审批人。
