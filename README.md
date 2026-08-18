# Ad AI Toolkit

一个面向效果广告团队的开源合集：可执行的 Agent Skills、广告工作模板，以及经过结构化记录的 AI 工具目录。目标是把日常投放分析、素材协作和实验设计沉淀成可审查、可复用的工作流。

## 包含什么

| 分类 | 适用场景 |
| --- | --- |
| [Skills](./skills) | 让 Agent 按明确边界完成广告分析与规划 |
| [Templates](./templates) | 直接复用的投放周报、实验与创意 Brief |
| [Tools](./tools) | 按广告工作流收录 AI 工具与集成方案 |

## 已包含的 Skills

| Skill | 用途 |
| --- | --- |
| [`paid-media-weekly-review`](./skills/paid-media-weekly-review) | 把跨平台付费媒体账户数据转成周度洞察与行动项 |
| [`paid-media-structure-audit`](./skills/paid-media-structure-audit) | 审核账户结构、定向、预算和衡量体系 |
| [`search-term-mining`](./skills/search-term-mining) | 从搜索词报告发现增量与浪费 |
| [`ad-creative-brief`](./skills/ad-creative-brief) | 形成可测试、可制作的广告创意 Brief |
| [`paid-media-experiment-design`](./skills/paid-media-experiment-design) | 设计有判定规则的广告实验 |

每个 Skill 均以 `SKILL.md` 发布，遵循 [Agent Skills](https://agentskills.io) 的目录规范。可将 `skills/<skill-name>` 安装或复制到所用 Agent 支持的 skills 目录。

## 快速开始

1. 选择一个 skill 目录，阅读其中的 `SKILL.md`。
2. 在 Agent 中安装或复制该目录。
3. 提供业务目标、时间范围、数据定义与脱敏数据。
4. 先审阅建议；任何预算、出价、定向和投放状态的变更都应由人确认。

## 工具收录原则

工具不以“好用”作为唯一标准。每条收录应说明用途、支持渠道、定价模式、所需数据权限、数据处理位置、最近验证日期、局限性与替代方案。请使用 [工具条目模板](./tools/README.md)。

## 安全与贡献

- 不提交 API 密钥、广告账户访问令牌、客户个人数据、受众名单或未脱敏报表。
- 不把推测写成因果结论，不在未授权时执行投放变更。
- 提交前请阅读 [贡献指南](./CONTRIBUTING.md) 与 [安全政策](./SECURITY.md)。

## Roadmap

- Meta / TikTok / LinkedIn 平台专用分析 skills
- 广告命名、UTM 与转化追踪检查器
- 工具条目与真实工作流示例
- 可重复的 skill 评测用例

## License

[MIT](./LICENSE)
