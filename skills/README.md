# 广告 Skills 目录

这里收录可由 AI Agent 调用的广告工作流。每个 skill 是一个独立目录，核心文件为 `SKILL.md`；它应说明触发场景、所需输入、执行步骤、输出格式和安全边界。

## 当前分类

- **账户与效果分析**：周报、异常诊断、账户结构审计
- **搜索广告优化**：搜索词挖掘、关键词与否定词建议、Search 文本资产
- **创意与策略**：创意 Brief、投放实验与决策框架

## 已收录

| Skill | 用途 |
| --- | --- |
| [`ad-weekly-review`](./ad-weekly-review) | 生成跨平台广告周度复盘与行动项 |
| [`ad-structure-audit`](./ad-structure-audit) | 审核账户结构、定向、预算和衡量体系 |
| [`search-term-anomaly-diagnosis`](./search-term-anomaly-diagnosis) | 从搜索词中诊断花费、CPC、CPA 或转化异常 |
| [`search-ad-assets`](./search-ad-assets) | 围绕关键词、触发点和 CTA 生成 Search 文本资产 |
| [`ad-creative-brief`](./ad-creative-brief) | 创建可测试、可制作的广告创意 Brief |
| [`ad-experiment-design`](./ad-experiment-design) | 设计有明确判定规则的广告实验 |

## 新增 Skill 模板

```text
skills/
└── <skill-name>/
    └── SKILL.md
```

`<skill-name>` 使用小写连字符命名，例如 `meta-ads-weekly-review`。`SKILL.md` 至少包含：

```md
---
name: skill-name
description: 清晰描述该 skill 的功能，以及它应在什么任务中被调用。
---

# Skill 标题

## 输入

## 工作流

## 输出

## 安全边界
```

请保持单一职责；不要内置凭据、客户数据或未经验证的平台规则。提交前按仓库根目录的 [贡献指南](../CONTRIBUTING.md) 自检。
