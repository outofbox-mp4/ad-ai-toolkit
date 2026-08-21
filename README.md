# Ad Optimization Method Library

![Google Ads](https://img.shields.io/badge/Platform-Google%20Ads-4285F4?style=flat-square&logo=googleads&logoColor=white)
![Facebook Ads](https://img.shields.io/badge/Facebook%20Ads-0666E5?style=flat-square&logo=meta&logoColor=white)
![TikTok Ads](https://img.shields.io/badge/TikTok%20Ads-000000?style=flat-square&logo=tiktok&logoColor=white)
![Reddit Ads](https://img.shields.io/badge/Reddit%20Ads-FF4500?style=flat-square&logo=reddit&logoColor=white)
![ChatGPT Ads](https://img.shields.io/badge/ChatGPT%20Ads-412991?style=flat-square&logo=openai&logoColor=white)
![SaaS B2B](https://img.shields.io/badge/Industry-SaaS-orange?style=flat-square)
![Agent Ready](https://img.shields.io/badge/AI-Agent%20Ready-16a34a?style=flat-square)

<p align="center">
  <img width="400" height="350" alt="企鹅家族00006-潇洒小滑板" src="https://github.com/user-attachments/assets/a2db1d4a-b4f7-4ff4-88bd-f044550b69ef" />
</p>

> 这个仓库不塞垃圾 Prompt，整套框架逻辑均来自实战经验。
>
> 目标是让 Agent 每次调取账户时，都能输出可复盘、可交付、可直接落地的数据决策，而不是乱给建议，增加决策负担。

## Why This Exists

Agent可以调广告，广告操作逐步AI化，那么，优化师的出路在哪？这个岗位真正的价值在哪？我觉得是业务判断能力：

- 问题发生时，如何精准定位其所在的漏斗阶段？
- 是广告侧可控问题，还是业务/产品端供给问题？
- 该继续投、缩量、暂停、做实验，还是交给业务决策？
- 哪些证据不能跳过，哪些结论不能乱下？

对于很多真的想精进能力的优化师来说，市场上可学习的系统化资料极少，大家大多只能靠在岗位上独自摸索，不可避免地重复踩坑、找不到方向。建这个仓库，就是把我踩过的坑和高频的判断逻辑整理出来。**大家一起把经验沉淀成干货，少走点弯路，顺便把这个岗位的含金量搞上去。**

所有案例均使用虚拟产品 FlowNote 做演示（一款会议记录软件）。

## Core Philosophy

```text
广告花费
  -> 展示
    -> 点击
      -> 注册
        -> 试用
          -> 付费
            -> ROI
```

默认 ROI 是最终目标，注册和试用是过程指标。过程指标会随业务场景变化：SaaS 常看注册、试用、付费；跨境电商可替换为关注、加购、下单和客单价。

每次分析必须判断问题发生在哪一段：

| Queries | What It Tells |
| --- | --- |
| CPC 是否上升 | 流量成本或竞争变强 |
| 点击到注册率是否下降 | 搜索意图、受众、页面或产品预期错配 |
| 注册 CPA 是否异常 | 前漏斗获客成本失控 |
| 注册到试用率是否下降 | 注册质量或产品激活路径变弱 |
| 试用 CPA 是否异常 | 中漏斗是否还能支撑增长 |
| 试用到付费率是否下降 | 付费能力、产品价值或运营承接变弱 |
| 付费 CPA 是否异常 | 最终获客成本是否可接受 |
| 客单价是否下降 | 收入质量是否变差 |
| ROI 是否恶化 | 投放是否还值得继续 |

## Asset Map

| Directory | What It Captures |
| --- | --- |
| [methodology](./methodology) | 通用方法论：ROI 诊断、账户诊断、市场洞察、搜索词分析、实验设计 |
| [sops](./sops) | 常见投放问题检查清单：ROI 下滑、CPA 异常、转化下降、付费减少、否定词列表 |
| [skills](./skills) | 可安装的 Agent skills，让 Agent 按固定流程完成重复性优化工作 |
| [templates](./templates) | 报告交付模板：周报、诊断报告、实验 brief、决策记录 |
| [data-schemas](./data-schemas) | 数据字段和指标口径 |
| [tools](./tools) | 可接入Agent的广告自动化工具 |

## Featured Assets

| Asset | When To Use |
| --- | --- |
| [roi-diagnosis](./skills/roi-diagnosis) | 诊断 ROI 主目标下账户表现 |
| [google-ads-campaign-audit](./skills/google-ads-campaign-audit) | 检查 Google Ads 系列表现 |
| [search-term-anomaly-diagnosis](./skills/search-term-anomaly-diagnosis) | 搜索词花费、CPC、CPA 或转化异常排查 |
| [ad-weekly-review](./skills/ad-weekly-review) | 广告周复盘 |
| [ad-structure-audit](./skills/ad-structure-audit) | 账户结构审计 |
| [ad-experiment-design](./skills/ad-experiment-design) | 广告实验设计 |
| [search-ad-assets](./skills/search-ad-assets) | Search 标题、描述等文字资产 |
| [ad-creative-brief](./skills/ad-creative-brief) | 视觉广告创意 brief |

## What Makes This Different

普通的 AI 提问通常是直接抛数据报告或截图：“*帮我分析一下这个广告账户*”，得到的往往是泛泛而谈的建议。

这个资产库则是通过标准化流程约束 Agent，确保产出的诊断更稳、更精准：

1. 先统一数据口径和转化定义。
2. 再拆完整漏斗，而不是只盯浅层CPA。
3. 明确断点发生在流量成本、注册质量、试用激活、付费能力、客单价还是 ROI。
4. 区分广告侧可控问题和业务侧不可控问题。
5. 给出证据、阈值、风险、owner、下一步实验和停止规则。

## Contribution

欢迎用 Issue 交流广告投放里的真实难题、奇怪波动和踩坑案例。这个仓库的目标不是收集漂亮话，而是把经验沉淀成 Agent 能执行的判断代码。

提交前请阅读 [CONTRIBUTING.md](./CONTRIBUTING.md)。新增内容应服务真实优化工作，并尽量回答：它能让 Agent 下次少犯什么判断错误？

## Safety

- Skills 默认只分析、建议和生成草稿。
- 预算、出价、定向、否定词、素材发布、投放状态等写操作必须获得明确确认。
- 示例只能使用虚构或脱敏数据。
- 私有报表应保存在仓库外或被忽略的本地私有路径；需要长期保存时使用批准的本机加密或组织 Secret Manager。

## License

[MIT](./LICENSE)
