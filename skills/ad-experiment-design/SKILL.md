---
name: ad-experiment-design
description: Design measurable ad experiments for ROI, CPA, funnel conversion, bidding, audience, creative, landing-page, budget, market, or campaign-structure decisions. Use when an optimization decision needs a hypothesis, success threshold, guardrails, and stop rules.
---

# Ad Experiment Design

## 适用场景

用于把广告优化问题转成可判断的实验：是否放量、收缩、暂停、改页面、改素材、换目标、开新市场或补业务供给。

参考：[methodology/experiment-design.md](../../methodology/experiment-design.md)、[templates/experiment-brief-template.md](../../templates/experiment-brief-template.md)。

## 输入数据要求

业务决策、当前问题、假设、目标人群/市场/系列、控制组、处理组、预算、时间、primary metric、guardrail metrics、样本量、转化滞后、可执行限制。

## 分析顺序

1. 先写清楚实验结束后要做什么决策。
2. 定义假设对应的漏斗段。
3. 选择 primary metric，默认优先 ROI 或下游 CPA；注册/试用为过程指标。
4. 定义 guardrails：注册质量、trial rate、payment rate、AOV、ROI、花费消耗。
5. 选择实验设计：平台实验、A/B、holdout、geo split，或标注为观察性比较。
6. 设定成功阈值、停止规则、最短观察期和复盘日期。
7. 输出实施清单和结果解释规则。

## 必须拆解的指标

CPC、点击到注册率、注册 CPA、注册到试用率、试用 CPA、试用到付费率、付费 CPA、AOV、ROI。

## 必须分层的维度

campaign、market、device、audience、query theme、creative/asset、landing page、offer、date。

## 判断阈值

- Primary metric 改善需达到预设阈值；默认 >= 15% 才视为可讨论改善。
- Guardrail 恶化 >= 15% 时，即使 primary metric 改善也需谨慎。
- 花费不足以获得 10 个试用或 3 个付费时，不做最终 ROI 判定。
- 实验不得在学习期或转化滞后未结束前因为早期波动停止。

## 不允许跳过的证据

- 决策问题。
- 假设和对应漏斗段。
- 控制组/处理组差异。
- primary metric、guardrails、成功阈值、停止规则。
- 可能混淆因素：季节性、预算变化、tracking、页面/产品变更。

## 输出格式

使用 experiment brief：decision、hypothesis、design、primary metric、guardrails、duration rationale、implementation checklist、interpretation rule、owner、next review。

## 可执行动作分类

| Category | Allowed Output |
| --- | --- |
| 广告侧可执行 | 出价、预算、结构、query、受众、素材、市场实验草案 |
| 落地页/网站侧建议 | 页面版本、CTA、表单、试用入口测试 |
| 产品侧建议 | 功能/供给/套餐/价格表达实验 |
| 销售/运营侧建议 | 激活邮件、CRM 跟进、销售承接实验 |
| 需要业务决策 | ROI 目标、学习预算、市场优先级、是否接受短期 ROI 波动 |

## Guardrails

- 不把观察性比较说成因果实验。
- 不启动或改动账户，除非用户明确批准。
- 不做没有成功阈值和停止规则的实验。
