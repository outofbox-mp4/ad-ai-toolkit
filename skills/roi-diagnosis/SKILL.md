---
name: roi-diagnosis
description: Diagnose ROI deterioration, multi-goal pressure, registration/trial suppression, and weakening payment ability for Google Ads, SaaS, B2B, or cross-border ad programs. Use when ROI, registration CPA, trial CPA, payment CPA, or revenue quality must be decomposed into funnel evidence and controllable next actions.
---

# ROI Diagnosis

## 适用场景

用于 ROI 下滑、注册/试用/付费多个目标同时承压、账户付费能力持续削弱、或需要判断广告侧可控问题和业务侧供给问题边界的诊断。

优先阅读仓库级方法论：[methodology/roi-diagnosis.md](../../methodology/roi-diagnosis.md)、[methodology/account-diagnosis.md](../../methodology/account-diagnosis.md)、[data-schemas/funnel-metrics.md](../../data-schemas/funnel-metrics.md)。

## 输入数据要求

- 当前周期和可比基线周期。
- Spend、impressions、clicks、registrations、trials、payments、revenue。
- ROI 目标、注册 CPA 目标、试用 CPA 目标、付费 CPA 目标或其它业务阈值。
- conversion 定义、归因窗口、收入成熟期、币种。
- campaign、market、device、query theme、audience、landing page、offer 维度数据。
- 已尝试并淘汰的业务场景、关键词池、受众池、页面或素材角度。

## 分析顺序

1. 确认口径：ROI、收入、转化定义、归因窗口和 payment cohort 是否可比。
2. 拆完整漏斗：广告花费 -> 展示 -> 点击 -> 注册 -> 试用 -> 付费 -> 付费金额 -> ROI。
3. 定位断点：判断是 CPC、点击到注册、注册到试用、试用到付费、AOV 还是 ROI 本身恶化。
4. 分层归因：按 campaign、market、device、query theme、audience、landing page、offer 分层。
5. 判断多目标压制：若 ROI、注册、试用同时被压，检查是否进入流量池收缩和学习样本减少。
6. 区分边界：广告侧可控、网站侧、产品侧、销售/运营侧、业务决策。
7. 给出下一步实验：每个建议必须有证据、阈值、风险和验证窗口。

## 必须拆解的指标

- CPC 是否上升。
- 点击到注册率是否下降。
- 注册 CPA 是否异常。
- 注册到试用率是否下降。
- 试用 CPA 是否异常。
- 试用到付费率是否下降。
- 付费 CPA 是否异常。
- 客单价或付费金额是否下降。
- ROI 是否恶化。

## 必须分层的维度

campaign、channel、market/country、device、query theme、audience、landing page/final URL、offer、conversion action、date。

## 判断阈值

用户给出目标时以用户目标为准；否则使用默认排查阈值：

- CPC 较基线上升 >= 20%。
- 点击到注册率、注册到试用率下降 >= 15%。
- 注册 CPA、试用 CPA、付费 CPA 较基线恶化 >= 20% 或超过目标。
- 试用到付费率下降 >= 20%。
- AOV 下降 >= 15%。
- ROI 低于目标或较基线下降 >= 20%。
- 付费少于 3 个、试用少于 10 个、或样本低于常态 30% 时标低置信度。

多目标压制判断：如果 ROI 目标、注册 CPA 目标、试用 CPA 目标同时收紧，并伴随 spend、impressions、trials 或 payments 连续下降，必须提示账户可能进入保守收缩状态。

## 不允许跳过的证据

- 当前周期和基线周期。
- ROI 是否低于目标或恶化。
- 每个漏斗段的当前值、基线值和变化。
- 付费与收入数据成熟度。
- 是否存在 tracking/upload/CRM 口径变化。
- 是否已经尝试并淘汰主要业务相关场景。
- 每条建议对应的证据和可验证下一步。

## 输出格式

1. 一句话结论：ROI 是否恶化、断点在哪里、广告侧是否可控。
2. 漏斗拆解表。
3. 分层 driver 表：campaign/market/query/audience/landing page 的贡献。
4. 多目标压制判断：是否为保守收缩、学习样本不足或供给不足。
5. 动作分类表。
6. 下一步实验 brief：目标、假设、成功阈值、停止规则、审批要求。

## 可执行动作分类

| Category | Allowed Output |
| --- | --- |
| 广告侧可执行 | 预算控制、出价策略建议、query/keyword/audience/geo/device 调整建议、结构隔离、只读预检、实验草案 |
| 落地页/网站侧建议 | 页面匹配、速度、CTA、表单、试用入口、价格展示、tracking 检查 |
| 产品侧建议 | 新场景供给、功能表达、试用路径、套餐、付费墙、激活体验 |
| 销售/运营侧建议 | 试用激活、邮件/CRM、线索跟进、付费转化承接 |
| 需要业务决策 | ROI 目标是否过高、是否保留学习预算、是否开新市场/新供给、增长与利润取舍 |

## Guardrails

- 不要把“继续优化账户结构”作为最终答案。
- 不要因注册便宜就建议放量，必须看 trial、payment、AOV 和 ROI。
- 不要在 payment cohort 未成熟时下强 ROI 结论。
- 不要执行账户写操作，除非用户明确要求并确认具体目标。
