# ROI Diagnosis Methodology

## Purpose

用于诊断广告 ROI 下滑、CPA 异常、注册/试用/付费同时被压制，以及账户付费能力持续削弱的问题。

默认 ROI 是主目标，过程指标服务于定位问题，不单独代表账户健康。

## Full Funnel

```text
Spend -> Impressions -> Clicks -> Registrations -> Trials -> Payments -> Revenue -> ROI
```

| Funnel Step | Metric | Question |
| --- | --- | --- |
| Spend -> Impressions | CPM, impression share, lost IS | 是预算、排名、库存还是市场规模限制了展示？ |
| Impressions -> Clicks | CTR, CPC | 素材、文案、query/audience 是否吸引目标人群，流量成本是否上升？ |
| Clicks -> Registrations | click-to-register rate, registration CPA | 流量意图和落地页是否匹配？ |
| Registrations -> Trials | registration-to-trial rate, trial CPA | 注册质量、试用路径、产品激活是否变差？ |
| Trials -> Payments | trial-to-payment rate, payment CPA | 付费意愿、产品价值、销售/运营承接是否变弱？ |
| Payments -> Revenue | AOV, revenue per payment | 客单价、套餐结构、折扣和付费质量是否下降？ |
| Revenue -> ROI | ROI / ROAS | 最终回收是否支持继续投放？ |

## Baseline

优先使用最近可比周期：7 天对前 7 天，14 天对前 14 天，或当前月对上月同期。若有季节性，用去年同期或同星期结构对比。

基线必须满足：

- 转化定义一致。
- 归因窗口一致。
- 主要投放范围、市场和预算策略没有不可比变化。
- 支付和收入数据已过必要成熟期。

## Default Thresholds

这些是默认排查阈值，不是硬性业务目标。用户给出业务目标时，以用户目标为准。

| Signal | Default Trigger |
| --- | --- |
| CPC pressure | CPC 比基线上升 >= 20%，且点击或转化没有同步改善 |
| Click-to-registration drop | 点击到注册率下降 >= 15% |
| Registration CPA anomaly | 注册 CPA 超目标，或比基线恶化 >= 20% |
| Registration-to-trial drop | 注册到试用率下降 >= 15% |
| Trial CPA anomaly | 试用 CPA 超目标，或比基线恶化 >= 20% |
| Trial-to-payment drop | 试用到付费率下降 >= 20%，且样本量足够 |
| Payment CPA anomaly | 付费 CPA 超目标，或比基线恶化 >= 20% |
| AOV drop | 客单价下降 >= 15% |
| ROI drop | ROI 低于目标，或比基线下降 >= 20% |

小样本不要直接下结论。少于 3 个付费、少于 10 个试用、或低于账户正常日均样本 30% 时，必须标注低置信度。

## Multi-Goal Pressure Diagnosis

当 ROI、注册、试用多个目标同时压制，且付费能力持续削弱时，按以下逻辑判断：

1. 先确认是不是追踪或口径问题：多个事件是否同时掉、是否有 tag/CRM/upload 变化、支付 cohort 是否成熟。
2. 再看流量池是否被目标压缩：预算消耗下降、展示下降、点击下降、Search impression share 下降、PMax/Demand Gen 学习受限、bid strategy 限制。
3. 再看质量是否真实恶化：点击到注册率、注册到试用率、试用到付费率、AOV、ROI 是否逐段下降。
4. 如果相关业务场景基本已尝试并淘汰，判断是否“新增有效供给不足”，而不是继续要求账户结构挤出增长。
5. 输出必须给出广告侧能验证的下一步实验，以及业务侧需要补供给或调整目标的判断边界。

## Decision Output

每个结论都要落到一个决策：

- 继续投：ROI 达标，且下游质量稳定。
- 控制投：过程指标便宜但下游质量弱，保留学习预算。
- 缩减投：花费有量但注册/试用/付费证据弱。
- 暂停或否定：明确无关、错误意图或长期无下游价值。
- 需要业务决策：目标过高压缩流量池，或业务供给不足导致广告侧没有可扩展空间。
