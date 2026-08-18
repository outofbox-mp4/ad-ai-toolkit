# 广告模板目录

这里收录不依赖某个 Agent 或广告平台的通用工作模板。它们适合直接复制到 Notion、飞书文档、项目管理工具或团队协作流程中使用。

## 当前分类

- **效果复盘**：指标变化、归因线索和行动计划
- **实验设计**：假设、对照、指标、时长与判定规则
- **创意协作**：用户洞察、卖点、脚本和合规要求

## 已收录

| 模板 | 用途 |
| --- | --- |
| [`campaign-weekly-review.md`](./campaign-weekly-review.md) | 广告周报与优化行动跟踪 |
| [`paid-media-experiment.md`](./paid-media-experiment.md) | 投放实验卡与结果判定 |
| [`ad-creative-brief.md`](./ad-creative-brief.md) | 广告创意制作与测试 Brief |

## 新增模板规范

每个模板使用描述用途的 kebab-case 文件名，例如 `landing-page-audit.md`。开头应说明模板适用的场景，并保留能直接填写的字段、表格或检查清单。

```md
# 模板标题

## Context

- Goal:
- Owner:
- Date range:

## Checklist / Working area

...
```

模板不应包含真实客户数据、账户 ID、密钥或无法公开的业务规则。需要 Agent 执行的工作流请新增为 [Skill](../skills/README.md)，而非放入模板目录。
