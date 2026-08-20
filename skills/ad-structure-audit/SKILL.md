---
name: ad-structure-audit
description: Audit Google, Meta, TikTok, LinkedIn, or other ad account structures for strategy alignment, funnel control, targeting overlap, budget logic, measurement, naming, and operational risks. Use when asked to review or redesign an ad account, campaign taxonomy, or measurement setup.
---

# Ad Structure Audit

## 适用场景

用于审计账户结构是否支持 ROI、注册、试用、付费和收入目标。不要把所有效果问题默认归因到账户结构；结构审计必须证明结构如何影响漏斗判断或学习信号。

参考：[methodology/account-diagnosis.md](../../methodology/account-diagnosis.md)。

## 输入数据要求

业务目标、conversion 定义、ROI/CPA 阈值、campaign/ad group/ad set 层级、预算、出价策略、定向、否定/排除、素材映射、landing page、UTM、命名规则、历史变更和核心表现数据。

## 分析顺序

1. 将每个 campaign 映射到 funnel stage、market、intent/audience、offer、landing page 和 conversion goal。
2. 检查是否有预算混投、目标混投、受众/关键词重叠、自我竞争或学习信号过碎。
3. 检查命名、UTM、conversion action、归因窗口是否支持稳定复盘。
4. 按 ROI 和下游质量检查预算分配是否合理。
5. 区分低风险清理、需要实验验证的结构变化和高风险变更。

## 必须拆解的指标

每个主要结构单元必须看 spend、clicks、CPC、registrations、trials、payments、revenue、registration CPA、trial CPA、payment CPA、AOV、ROI。

## 必须分层的维度

campaign、ad group/ad set、funnel stage、market、intent/audience、keyword/theme、creative/asset、landing page、conversion goal、budget owner。

## 判断阈值

- 不同目标或 funnel stage 混在同一预算池：高风险。
- 同一 intent/audience 被多个 campaign 抢量且 ROI/CPA 不可归因：高风险。
- 结构单元过去 7-14 天低于 10 个试用或 3 个付费：不要做强效果判定。
- 历史可比性会被破坏的大改：必须进入实验或迁移计划。
- ROI 弱但过程指标便宜：不允许直接放量，需看下游质量。

## 不允许跳过的证据

- 账户结构图或结构表。
- 每个 campaign 的目标、market、funnel stage 和 conversion goal。
- 预算与表现的对应关系。
- tracking/UTM/命名是否支持复盘。
- 建议调整的风险、回滚方式和验证指标。

## 输出格式

1. 结构健康结论。
2. Campaign mapping table。
3. Finding table：finding、evidence、impact、recommendation、priority、owner、validation metric。
4. 分阶段路线图：立即清理、下一轮实验、长期结构调整。
5. 动作分类。

## 可执行动作分类

| Category | Allowed Output |
| --- | --- |
| 广告侧可执行 | 命名/UTM 清理、预算隔离、结构重组草案、实验计划、只读预检 |
| 落地页/网站侧建议 | 页面和 campaign/intent 对齐、追踪参数检查 |
| 产品侧建议 | 缺失场景页、功能供给、行业页或案例页 |
| 销售/运营侧建议 | 线索阶段和广告 conversion goal 对齐 |
| 需要业务决策 | 是否牺牲短期学习重建结构、预算池和市场优先级 |

## Guardrails

- 不破坏历史可比性而不记录变更日期。
- 不在无证据时把问题归因到账户结构。
- 不执行结构变更，除非用户明确确认。
