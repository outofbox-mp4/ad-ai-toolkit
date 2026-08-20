# Multi-Goal Pressure Example

> Fictional example. This case demonstrates the diagnosis pattern for ROI, registration, and trial targets being tightened at the same time.

## Scenario

FlowNote 同时提高 ROI 目标、降低注册 CPA 目标、降低试用 CPA 目标。过去 4 周账户花费持续下降，付费样本减少，PMax 和 Search 都进入保守投放。

## Key Evidence

| Signal | Observation | Interpretation |
| --- | --- | --- |
| Spend | 4 周下降 38% | 流量池被目标压缩 |
| Impressions | 下降 44% | 新数据减少 |
| Trials | 下降 41% | 学习样本减少 |
| Payments | 从 18 降到 7 | 付费样本不足，模型学习能力变弱 |
| ROI | 从 1.9 到 1.7 | 未达目标，但也缺少扩量样本 |
| Tested themes | 核心、竞品、模板、免费、行业场景均已测试 | 可能是新增有效供给不足 |

## Diagnosis

这是多目标高压导致的保守收缩风险。广告侧仍需排查 CPC、query、页面和转化率，但不能把结论停在“继续优化账户结构”。如果相关场景已充分尝试并淘汰，下一步应同时做广告侧最小实验和业务侧供给判断。

## Next Experiments

| Experiment | Purpose | Success | Stop |
| --- | --- | --- | --- |
| 高意图 Search 小预算恢复 | 验证核心需求是否仍有付费能力 | trial CPA <= target 且 payment signal 出现 | 连续 7 天无 trial 或 query 明显无关 |
| 新行业场景 landing page | 验证新增供给能否打开流量池 | click-to-registration 和 trial rate 均高于账户均值 | 注册多但 0 trial |
| PMax final URL 限制测试 | 判断 PMax 是否被低意图页面稀释 | trial rate 提升 >= 20% | 花费充足后无 payment signal |
