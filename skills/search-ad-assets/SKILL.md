---
name: search-ad-assets
description: Create search-ad text assets for Google Ads, Microsoft Advertising, and similar text Search platforms. Use when responsive search-ad headlines, descriptions, display paths, sitelinks, callouts, or structured snippets must be mapped to keyword themes, search triggers, proof, and CTA. Do not use for visual creative, bidding, account diagnosis, or search-term mining.
---

# Search Ad Assets

## 适用场景

用于 Search 广告文字资产：标题、描述、display path、sitelink、callout、structured snippet。核心不是堆标题，而是把 keyword、trigger、proof、CTA 对齐到搜索意图和落地页。

## 输入数据要求

platform、market/language、landing page、conversion event、offer、approved claims、keyword themes、search triggers、match type context、brand rules、policy constraints、current asset limits、历史表现数据。

## 分析顺序

1. 按 keyword theme 和 search intent 分组。
2. 为每组建立 message map：keyword、trigger、proof、CTA、brand。
3. 判断该资产要改善哪个漏斗段：CTR、点击到注册率、注册 CPA、试用 CPA 或 ROI。
4. 生成标题、描述和 extension，并标注每条资产的角色。
5. 检查字符数、政策、声明真实性和 landing page 一致性。
6. 给出测试组合、pinning 建议和下游验证指标。

## 必须拆解的指标

CTR、CPC、click-to-registration rate、registration CPA、registration-to-trial rate、trial CPA、payment signal、ROI。没有历史数据时，说明只能产出待测资产，不能宣称效果。

## 必须分层的维度

keyword theme、search trigger、intent stage、market/language、landing page、offer、device、brand vs non-brand、competitor vs generic。

## 判断阈值

- 资产不能只服务 CTR；若历史点击到注册率或试用率弱，必须加强 intent qualification。
- 若某 theme trial rate < 6% 且无 payment signal，不建议写强扩量型文案。
- 若 claim 无页面证据或政策依据，不得写入资产。
- Pinning 只用于法律、品牌或顺序强约束；否则保留组合多样性。

## 不允许跳过的证据

- keyword theme 和 search trigger。
- landing page 是否支持 CTA 和 proof。
- approved claims 来源。
- 字符限制和政策风险。
- 每组资产的验证指标。

## 输出格式

每个 keyword theme 输出：

1. Message map。
2. Headline table：asset、role、trigger、intended combination、pinning rationale。
3. Description table。
4. Display paths and extensions。
5. Compliance checks。
6. Launch/test checklist。

## 可执行动作分类

| Category | Allowed Output |
| --- | --- |
| 广告侧可执行 | RSA 标题/描述、extensions、pinning 建议、测试组合 |
| 落地页/网站侧建议 | 页面 proof、CTA、section、query-message match |
| 产品侧建议 | 缺失功能证据、场景页、案例或价格说明 |
| 销售/运营侧建议 | demo/consult CTA 与后续承接 |
| 需要业务决策 | 是否使用竞品词、价格/折扣/对比声明 |

## Guardrails

- 不编造价格、折扣、结果、评价、客户、竞品声明。
- 不为提高关键词密度而重复堆词。
- 不把纯 Search 资产混入视觉创意 brief。
