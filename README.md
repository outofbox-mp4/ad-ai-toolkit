# Ad Optimization Method Library

这是一个广告优化师的方法论资产库，重点服务于 Google Ads / SaaS / B2B / 跨境投放场景，并可拓展到搜索类平台广告及其它社媒广告。

这里不做 prompt 堆积。而是呈现可复用的判断逻辑、诊断 SOP、指标口径、决策阈值、报告模板、实验模板和 Agent skill 编写规范，让 Agent 每次都按同一套优化逻辑分析、产出和行动。

## 资产库原则

简单问题可以直接问 Agent。

默认 ROI 是主目标，注册和试用是过程指标。过程指标会随业务变化：SaaS 常看注册、试用、付费；跨境电商可替换为关注、加购、下单、客单价和 ROI。

任何广告问题都必须拆完整漏斗：

```text
广告花费 -> 展示 -> 点击 -> 注册 -> 试用 -> 付费 -> 付费金额 -> ROI
```

每次分析必须判断问题发生在哪一段：CPC、点击到注册率、注册 CPA、注册到试用率、试用 CPA、试用到付费率、付费 CPA、客单价、ROI。

## 目录

| 目录 | 用途 |
| --- | --- |
| [methodology](./methodology) | 共用方法论：ROI 诊断、账户诊断、市场洞察、搜索词分析、实验设计 |
| [sops](./sops) | 可执行检查清单：ROI 下滑、CPA 异常、试用下降、付费削弱、搜索词浪费 |
| [skills](./skills) | 可安装的 Agent skills，让 Agent 按固定流程完成高频工作 |
| [templates](./templates) | 团队交付模板：周报、诊断报告、实验 brief、决策记录 |
| [data-schemas](./data-schemas) | 数据字段和指标口径，避免不同分析口径混用 |
| [examples](./examples) | 脱敏案例，展示方法论如何落到真实广告优化工作 |
| [tools](./tools) | 广告自动化工具和 MCP 接入模板 |

## 当前核心资产

| 资产 | 用途 |
| --- | --- |
| [roi-diagnosis](./skills/roi-diagnosis) | 诊断 ROI、注册、试用多目标同时压制和付费能力削弱 |
| [google-ads-campaign-audit](./skills/google-ads-campaign-audit) | 只读审计 Google Ads 系列表现 |
| [search-term-anomaly-diagnosis](./skills/search-term-anomaly-diagnosis) | 搜索词花费、CPC、CPA 或转化异常排查 |
| [ad-weekly-review](./skills/ad-weekly-review) | 广告周度复盘 |
| [ad-structure-audit](./skills/ad-structure-audit) | 账户结构审计 |
| [ad-experiment-design](./skills/ad-experiment-design) | 广告实验设计 |
| [search-ad-assets](./skills/search-ad-assets) | Search 标题、描述等文字资产 |
| [ad-creative-brief](./skills/ad-creative-brief) | 视觉广告创意 brief |

## 使用方式

1. 先读 [AGENTS.md](./AGENTS.md)，确认 Agent 的默认判断逻辑。
2. 分析类任务优先从 [methodology/roi-diagnosis.md](./methodology/roi-diagnosis.md) 和 [data-schemas/funnel-metrics.md](./data-schemas/funnel-metrics.md) 统一口径。
3. 高频工作用 [skills](./skills) 中的可安装 skill 执行。
4. 团队交付用 [templates](./templates) 输出，关键结论进入决策记录。
5. 任何真实账户导出、客户数据、凭据和受众数据都不进入仓库。

## 安全边界

- Skills 默认只分析、建议和生成草稿。
- 预算、出价、定向、否定词、素材发布、投放状态等写操作必须获得明确确认。
- 示例只能使用虚构或脱敏数据。
- 私有报表应保存在仓库外或被忽略的本地私有路径；需要长期保存时使用批准的本机加密或组织 Secret Manager。

## License

[MIT](./LICENSE)
