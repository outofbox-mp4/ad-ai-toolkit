# 广告 Skills 目录

这里收录可由 Agent 安装调用的广告优化工作流。每个 skill 保持 `skills/<skill-name>/SKILL.md` 结构；共用方法论、SOP、模板和数据口径放在仓库其它目录，避免每个 skill 各写一套判断逻辑。

## Skill 编写要求

每个 skill 必须包含：

- 适用场景
- 输入数据要求
- 分析顺序
- 必须拆解的指标
- 必须分层的维度
- 判断阈值
- 不允许跳过的证据
- 输出格式
- 可执行动作分类：广告侧可执行、落地页/网站侧建议、产品侧建议、销售/运营侧建议、需要业务决策的事项

## 已收录

| Skill | 用途 |
| --- | --- |
| [`roi-diagnosis`](./roi-diagnosis) | 诊断 ROI 波动 |
| [`google-ads-campaign-audit`](./google-ads-campaign-audit) | 审核 Google Ads 系列表现 |
| [`search-term-anomaly-diagnosis`](./search-term-anomaly-diagnosis) | 搜索字词异常排查、否词建议 |
| [`ad-weekly-review`](./ad-weekly-review) | 广告周度复盘 |
| [`ad-structure-audit`](./ad-structure-audit) | 审核账户结构 |
| [`ad-experiment-design`](./ad-experiment-design) | 设计广告实验 |
| [`search-ad-assets`](./search-ad-assets) | 生成 Search 广告标题、描述等文字资产 |
| [`ad-creative-brief`](./ad-creative-brief) | 创建视觉广告创意 Brief |

## 新增 Skill 模板

```text
skills/
└── <skill-name>/
    ├── SKILL.md
    └── examples/
        └── example.md
```

提交前按 [CONTRIBUTING.md](../CONTRIBUTING.md) 和 [AGENTS.md](../AGENTS.md) 自检。示例只能使用虚构或已脱敏的数据。
