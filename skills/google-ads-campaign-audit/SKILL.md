---
name: google-ads-campaign-audit
description: Audit Google Ads campaign performance for a specific day or date range, producing read-only campaign tables and diagnosis for registrations, trials, payments, spend, CPC, and volume changes. Use only for Google Ads campaign-level performance review, not for search-term mining or direct account changes.
---

# Google Ads Campaign Audit

Use this skill when the user asks to review Google Ads campaign performance for a specific day or period, such as checking yesterday's campaign conversions, diagnosing registration or trial changes, comparing spend shifts, or turning campaign data into a compact table and action list.

This skill is read-only. Do not change budgets, bids, targeting, exclusions, assets, or statuses unless the user separately asks for an implementation action and confirms the exact target.

## Input

Ask for or infer the minimum needed context:

- Google Ads customer account or workspace-defined default account.
- Date range and comparison baseline. Convert relative dates into concrete dates.
- Business goal and primary conversion definitions, such as registration, trial, payment, or revenue.
- Target CPA, cost per trial, ROAS, or other decision threshold if available.
- Any known tracking, landing-page, offer, budget, or campaign changes during the period.

If the user only says "yesterday", use the previous local calendar date and compare it with the prior 7 days when data is available. For a multi-day range, compare with the immediately preceding period of equal length unless the user names another baseline.

## Sensitive Data Handling

Keep credentials and private account data out of the repository and out of examples.

- Never print, store, or commit developer tokens, OAuth client secrets, access tokens, refresh tokens, service-account JSON, ADC files, cookies, device codes, customer PII, audience lists, or raw exported reports.
- For connected-account work, use the account ID only when required by the authorized tool call. In user-facing or shareable output, prefer an alias such as `account_alpha` unless the user explicitly needs the ID.
- Treat campaign names, ad group names, final URLs, search terms, countries, and conversion-action names as potentially sensitive. For public examples, replace them with stable aliases or fictional product names.
- If a local export must be saved during analysis, place it outside the repository or in an ignored private path, and encrypt it with the user's approved local secret manager or vault. Do not commit encrypted exports either; commit only anonymized examples or templates.
- Round or bucket low-volume metrics in public examples when exact values could reveal customer activity. Keep exact values only in the private analysis response when they are necessary for the user's decision.

Examples in this skill use fictional data only. See [examples/example.md](examples/example.md).

## Required Data

Pull campaign-level Google Ads data for the requested period and baseline where authorized:

- Campaign summary: campaign ID, campaign name, campaign status, advertising channel type, spend, impressions, clicks, CTR, average CPC, conversions, conversion value, all conversions, and all conversion value.
- Conversion-action split where available: conversion action name, all conversions, conversion value, conversions, and conversions value.
- Search campaign context when relevant: search impression share, budget-lost impression share, rank-lost impression share, and top impression share.
- Drilldowns only when needed to explain an anomaly: country, device, network, landing page/final URL, asset, ad group, keyword, search term, listing group, audience, or change history.

Do not blend Google Ads uploaded conversions with CRM or warehouse attribution data into a single rate unless the source, attribution window, and denominator are explicitly aligned.

## Diagnosis Logic

Use this priority order:

1. Payment and mature revenue are final business metrics when available.
2. Trial is a key mid-funnel diagnostic metric.
3. Registration shows front-funnel volume and acquisition cost.
4. Web events such as page views, login, download, or early engagement are supporting signals only.

Distinguish between:

- Volume decline: spend, impressions, clicks, or impression share fell.
- Cost pressure: CPC, rank-lost impression share, or auction competition rose.
- Traffic-quality issue: clicks or registrations rose while trials or payments did not.
- Funnel or tracking issue: multiple campaigns or channels lose the same downstream event at once.
- Immature cohort: payment or revenue window is too recent to judge.

For PMax or broad automation, do not recommend scaling only because it produced cheap registrations. Check trial, payment, asset/final URL fit, geography, and audience-signal quality before proposing budget shifts.

## Output

Start with the outcome, not the query process. Return:

1. Account-level summary for the requested period and baseline: spend, clicks, registrations, trials, payment or revenue if available, and CPA or cost per trial where meaningful.
2. Campaign table with campaign alias/name, channel, spend, clicks, registrations, trials, payment or revenue if available, cost per registration, cost per trial, and short judgment.
3. What changed: spend, click, registration, trial, CPC, impression-share, and whether the issue is volume, cost pressure, traffic quality, funnel/tracking, or immature payment data.
4. Prioritized recommendations with evidence, risk level, and whether each item is review-only or requires account approval.

Prefer compact Chinese tables when the user writes in Chinese. Use dollar amounts converted from micros. Round percentages to one decimal point and currency to two decimals unless finer precision materially changes the decision.

## Guardrails

- Do not mutate the account from this skill alone.
- Do not call a conversion problem "tracking broken" unless multiple independent signals support that diagnosis.
- Do not attribute performance change to competition if search impression share and CPC are stable.
- Do not use low-spend tests as performance verdicts; frame them as delivery diagnostics.
- Do not expose sensitive data in examples, commits, screenshots, logs, or public issue text.
