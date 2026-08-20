---
name: google-ads-campaign-audit
description: Audit Google Ads campaign performance for a specific day or date range, producing read-only campaign tables and funnel diagnosis for registrations, trials, payments, revenue, ROI, spend, CPC, and volume changes. Do not use for search-term mining or direct account changes.
---

# Google Ads Campaign Audit

## 适用场景

用于检查 Google Ads 某天、某周或某周期的 campaign 表现，尤其是注册、试用、付费、ROI、花费和量级变化。若问题需要搜索词明细，转到 `search-term-anomaly-diagnosis`。

参考：[methodology/roi-diagnosis.md](../../methodology/roi-diagnosis.md)、[data-schemas/google-ads-fields.md](../../data-schemas/google-ads-fields.md)、[templates/diagnosis-report-template.md](../../templates/diagnosis-report-template.md)。

## 输入数据要求

- Google Ads customer account 或 workspace 默认账户。
- 当前周期和基线周期；相对日期必须转成具体日期。
- 业务目标：ROI、注册 CPA、试用 CPA、付费 CPA、收入或 ROAS。
- conversion action 定义、归因窗口、收入成熟期、币种。
- campaign 级数据，以及必要时的 conversion action、device、country、search impression share、landing page、asset 或 ad group 分层。

## 分析顺序

1. 先确认口径和数据成熟度。
2. 做账户级漏斗：spend、impressions、clicks、registrations、trials、payments、revenue、ROI。
3. 对比当前周期和基线，定位断点。
4. 做 campaign 表，找贡献最大变化的 campaign。
5. 对异常 campaign 继续分层：channel、device、country、conversion action、landing page、search impression share。
6. 判断是量级、CPC/竞争、流量质量、漏斗/网站、tracking，还是 payment cohort 未成熟。
7. 输出动作分类和下一步只读检查/实验。

## 必须拆解的指标

CPC、CTR、click-to-registration rate、registration CPA、registration-to-trial rate、trial CPA、trial-to-payment rate、payment CPA、AOV、ROI。

## 必须分层的维度

campaign、channel、date、conversion action、device、country/market、landing page/final URL。Search campaign 异常时补 search impression share、budget lost IS、rank lost IS；PMax 异常时补 asset group、final URL、audience signal 和 geo。

## 判断阈值

- CPC 较基线上升 >= 20%：进入成本压力诊断。
- 任一核心 CVR 下降 >= 15%：进入漏斗质量诊断。
- 注册/试用/付费 CPA 超目标或较基线恶化 >= 20%：标异常。
- ROI 低于目标或较基线下降 >= 20%：标最终目标恶化。
- latest 3-day trial rate < 6% 且无 payment signal：不要扩量。
- campaign 有花费但 0 registrations 或 0 trials：建议降预算或暂停，除非用户明确说这是已批准学习测试。
- 付费少于 3 个或 payment cohort 未成熟：不要下强 ROI 结论。

## 不允许跳过的证据

- 当前周期和基线周期。
- campaign 级 spend、clicks、registrations、trials、payments/revenue。
- conversion action 口径。
- ROI 或 revenue 数据是否成熟。
- 异常 campaign 对账户总变化的贡献。
- 建议扩量、收缩或暂停时的 trial/payment/ROI 证据。

## 输出格式

1. 一句话结论。
2. Account summary 表。
3. Campaign audit 表：campaign、channel、spend、clicks、registrations、trials、payments/revenue、registration CPA、trial CPA、ROI、judgment。
4. What changed：按漏斗段说明变化。
5. Action classification 表。
6. 需要进一步调用 search-term、landing page、product 或 sales/ops 的检查项。

## 可执行动作分类

| Category | Allowed Output |
| --- | --- |
| 广告侧可执行 | 预算/出价/结构/geo/device/query/asset 的建议、只读预检、实验草案；不直接 mutate |
| 落地页/网站侧建议 | final URL、CTA、表单、加载、页面匹配、tracking 检查 |
| 产品侧建议 | 试用路径、功能供给、价格/套餐、激活体验 |
| 销售/运营侧建议 | trial 激活、线索跟进、CRM/upload 延迟 |
| 需要业务决策 | ROI 目标、保留学习预算、市场取舍、是否补充新供给 |

## Sensitive Data Handling

不要提交或输出 developer token、OAuth secrets、tokens、service-account JSON、ADC、客户 PII、受众名单或未脱敏报表。公开示例使用别名和虚构数据。需要本地保存私有导出时，放在仓库外或忽略路径，并使用批准的本机加密或组织 Secret Manager。

## Guardrails

- 本 skill 只读；不改预算、出价、定向、否定词、素材或状态。
- 不因注册便宜就建议放量；必须看 trial、payment、AOV 和 ROI。
- 不把 tracking broken 当默认结论，除非多个独立信号同时支持。
- 不把所有问题归因于账户结构。
