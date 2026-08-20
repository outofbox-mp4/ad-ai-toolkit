# Ad MCP Tool：将 Google Ads 安全接入 Codex / Agent

这是一个可复用的本机 MCP 接入说明和安全模板，用于把 **Google Ads API** 经由 MCP server 提供给 Codex 或其他 Agent。它不包含 MCP server 二进制、真实客户 ID、开发者令牌、OAuth 客户端文件、ADC 文件或报表数据。

> 状态：基于一次 Windows + Codex 本机 `stdio` 接入的实操记录整理；官方要求与本机经验分别标注。最后核验：2026-08-19。

## 适用场景与推荐认证方式

| 使用场景 | 官方推荐方式 | 本工具的接入建议 |
| --- | --- | --- |
| 团队管理自有/已受邀管理的账户 | Service account | 生产优先；将 service account 作为 Google Ads 用户授予最小权限，密钥交由组织的 Secret Manager 管理。 |
| 少量账户、临时本机开发、服务账号受组织策略限制 | Single-user OAuth | 可用 ADC；使用专用的 Desktop OAuth client 与专用 Google 身份，避免绑定个人日常账号。 |
| 面向外部客户的产品 | Multi-user OAuth | 在产品内完成用户授权、租户隔离、撤销和审计；不要复用单个团队 refresh token。 |

Google Ads 官方将 service account workflow 作为“管理自己可访问账户”的优先方式，single-user OAuth 是受限情况下的回退；第三方多租户产品应使用 multi-user OAuth。见 [OAuth 方式选择](https://developers.google.com/google-ads/api/docs/oauth/overview)。

## 架构与信任边界

```text
Codex / Agent
  └─ stdio MCP 配置（无秘密）
       └─ Start-GoogleAdsMcp.ps1（当前 Windows 用户解密短暂注入环境）
            └─ Google Ads MCP server
                 └─ ADC 或 service-account 凭据（本机/密钥系统，不入库）
                      └─ Google Ads API

人类审批与审计 ────────────────────────┘（写操作前的独立关卡）
```

MCP transport 的授权与 Google Ads API 授权是两层不同控制：本机 `stdio` MCP 通常由宿主从受控环境变量取得凭据；HTTP MCP 则应实现 MCP 的 OAuth 授权发现和令牌受众校验。不要把 Google OAuth access token 透传给不受信任的 MCP server。参见 [MCP Authorization 规范](https://modelcontextprotocol.io/specification/2025-06-18/basic/authorization)。

## 本机实操流程：创建并连接到 Codex

以下是已采用的 **single-user + ADC + local stdio** 模式，适合开发/内部只读分析；它不等于所有部署都应使用该模式。

1. 在顶级 Google Ads manager account 的 API Center 申请 developer token；其访问级别决定生产账户与配额可用性。目标 client account 由 10 位 customer ID 标识。详见 [Google Ads Quick start](https://developers.google.com/google-ads/api/docs/get-started/make-first-call)。
2. 在 Google Cloud 项目配置 OAuth consent screen，创建 **Desktop app** OAuth client。将下载的 client JSON 保留在受限目录，绝不放入仓库。Google Ads scope 为 `https://www.googleapis.com/auth/adwords`。
3. 用该 OAuth client 只在本机生成 ADC。命令中的 `<oauth-client.json>` 是本机受限路径，切勿提交、截图或粘贴其内容：

   ```powershell
   gcloud auth application-default login `
     --client-id-file "<oauth-client.json>" `
     --scopes "https://www.googleapis.com/auth/adwords,https://www.googleapis.com/auth/cloud-platform"
   ```

   `cloud-platform` 是 `gcloud auth application-default login` 所需的基础 scope；`adwords` 使 ADC 可用于 Google Ads。ADC 与普通 `gcloud auth login` 凭据不同；Windows 下本地 ADC 位于当前用户的 `%APPDATA%\gcloud\application_default_credentials.json`。参见 [single-user OAuth 流程](https://developers.google.com/google-ads/api/docs/oauth/single-user-authentication) 与 [ADC 工作方式](https://cloud.google.com/docs/authentication/application-default-credentials)。
4. 在 Google Ads UI 中授予该授权身份目标账户（或其 manager account）的所需权限。若经 manager 访问，设置 `login-customer-id` 为**经理账户** ID；请求中的 operating customer 才是目标 client account。两个 ID 都不带连字符。参见 [API call structure](https://developers.google.com/google-ads/api/docs/concepts/call-structure)。
5. 将 developer token、manager/customer ID 等敏感配置保存到受保护存储。Windows 本机可用本目录的 DPAPI 脚本；团队/生产环境使用 Secret Manager。把 `config/mcp-server.example.json` 的 command/args 复制到 Codex 的 MCP 配置，并替换为实际 server 可执行文件路径。
6. 重启或重新连接 MCP server 后，**先做只读探针**：`list_accessible_customers`；成功后，再用最窄范围的账户基础信息 GAQL 查询。只记录成功/失败、账户数量和 API `request-id`，不将账户清单或令牌写入日志。

Google 官方要求每个 API 调用同时带 OAuth 2.0 凭据和 developer token；通过 manager account 访问 client account 时还须提供 `login-customer-id`。[Authorization and HTTP headers](https://developers.google.com/google-ads/api/rest/auth)

## 账户信息的加密与仓库卫生

Google 明确要求应用凭据不进入公开仓库，用户凭据应加密静态存储且不以明文传输；能用时应使用 Secret Manager。详见 [Credential management](https://developers.google.com/google-ads/api/docs/oauth/credential-management)。

本目录提供 Windows DPAPI 的最小本地方案：

```powershell
# 只在本机交互输入；Value 不会写入终端输出。
.\scripts\Save-GoogleAdsMcpSecret.ps1 -Name GOOGLE_ADS_DEVELOPER_TOKEN
.\scripts\Save-GoogleAdsMcpSecret.ps1 -Name GOOGLE_ADS_LOGIN_CUSTOMER_ID
.\scripts\Save-GoogleAdsMcpSecret.ps1 -Name GOOGLE_ADS_CLIENT_CUSTOMER_ID
```

它将 `SecureString` 用当前 Windows 用户的 DPAPI 密钥加密，保存到 `%LOCALAPPDATA%\AdMcpTool\google-ads-mcp.secrets.clixml`。`Start-GoogleAdsMcp.ps1` 仅在启动子进程的生命周期内解密并设置环境变量。此方式不可跨用户、跨主机或用于共享 CI；生产与多人场景请改用组织 Secret Manager / Vault，短期访问令牌优先于长效 refresh token。

下面这些内容必须是本机私有文件或密钥系统的条目：developer token、OAuth `client_secret`、refresh/access token、service-account JSON、ADC 文件、customer ID 映射、个人邮箱与导出的报表。`.gitignore` 已忽略本工具的 `secrets/` 与 `*.local.json` / `*.private.json`；提交前仍应运行敏感信息扫描。

## MCP 可实践范围

“API 可调用”不等于“Agent 获准执行”。MCP server 的实际 tool 名称和字段取决于所选实现；下表定义本工具建议的安全运行范围。

| 等级 | 可做的工作 | 最小控制 |
| --- | --- | --- |
| P0：默认允许 | 列出可访问账户；账户层级/状态探针；按日期、customer、campaign、ad group、keyword、search term、asset 等维度做**有界只读** GAQL 报告；故障诊断与草案建议。 | 只读 tool allowlist；必须限制 customer、日期、字段和行数；输出脱敏；记录 request-id。 |
| P1：建议与计划 | 预算/出价/结构/素材/负关键词的变更方案、影响预估、GAQL 预检和 diff。 | Agent 只能产出草案，不能调用 mutate。 |
| P2：受控写入 | 已批准的 campaign、ad group、asset、criterion、budget 等小范围 mutate；仅限 MCP server 显式实现的资源。 | 人类逐次确认；目标账户、资源名、操作数、前后值和回滚计划均需确认；执行后用只读查询核验。 |
| 禁止或另建专用流程 | 读取/导出凭据；账户权限和邀请；Customer Match、用户列表或离线转化的 PII 上传；账单/付款、账户预算、跨客户批量写入、无范围 GAQL、直接把 OAuth token 交给模型。 | 独立服务、数据保护评估、最小权限、专门审批与审计；默认不暴露给通用 Agent。 |

Google Ads API 配额与大小限制仍适用：错误请求也可能消耗配额；单次 mutate 上限为 10,000 operations，响应还受 gRPC 大小限制。不要让 Agent 无限制重试或并发修改同一对象。参见 [API limits and quotas](https://developers.google.com/google-ads/api/docs/best-practices/quotas)、[mutate best practices](https://developers.google.com/google-ads/api/docs/mutating/best-practices) 与 [API structure](https://developers.google.com/google-ads/api/docs/concepts/api-structure)。

## 验证顺序与故障分层

1. **MCP 进程层**：server 能启动、stdio 初始化成功、可列出 tools；此时不得打印环境变量。
2. **宿主审批层**：只读 tool 获准实际发送。审批中转拒绝或 503 只能证明该层阻断，不能证明 OAuth、developer token 或广告账户无效。
3. **Google API 认证/授权层**：运行 `list_accessible_customers`。再检查 `USER_PERMISSION_DENIED`、`DEVELOPER_TOKEN_NOT_APPROVED` 等 Google API 错误；保持 API `request-id` 供支持排查。
4. **业务查询层**：对单一脱敏测试账户，以短日期范围和少量字段运行 GAQL；确认 customer ID / `login-customer-id` 路径正确。
5. **写入层（如启用）**：先展示计划和差异，获得明确批准后再 mutate，随后读回核验。

本机曾出现“自动审批中转 503、请求未到达 Google Ads API”的情况。因此该类错误应归到第 2 层，而不是要求重做 OAuth 或更换账户；仅在第 3 层返回 Google Ads API 错误后，才按对应错误处理。Google 对常见授权错误和 `login-customer-id` 缺失的说明见 [Common errors](https://developers.google.com/google-ads/api/docs/get-started/common-errors)。

## 配置文件与脚本

- [`config/mcp-server.example.json`](./config/mcp-server.example.json)：可提交的 Codex/stdin MCP 配置结构示例。
- [`config/google-ads-mcp.env.example`](./config/google-ads-mcp.env.example)：仅列出变量名，不存放值。
- [`scripts/Save-GoogleAdsMcpSecret.ps1`](./scripts/Save-GoogleAdsMcpSecret.ps1)：以 Windows DPAPI 保存一项敏感值。
- [`scripts/Start-GoogleAdsMcp.ps1`](./scripts/Start-GoogleAdsMcp.ps1)：读取 DPAPI vault 并只为 MCP 子进程临时注入变量。

这些文件是接入模板，不能替代对所选 MCP server 的工具清单、源代码安全审查、版本锁定与许可审查。将远程 HTTP MCP 部署给多个用户时，按 MCP 授权规范实现 OAuth resource metadata、PKCE、令牌 audience validation 和 HTTPS，而不要复制本机 stdio 的环境变量方式。
