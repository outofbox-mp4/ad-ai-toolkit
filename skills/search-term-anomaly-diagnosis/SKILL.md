---
name: search-term-anomaly-diagnosis
description: Diagnose whether search queries are driving abnormal spend, CPC, CPA, or a conversion decline. Use when spend or CPC spikes, CPA exceeds target, or conversions fall and a search-term report is needed to identify irrelevant, mismatched-intent, high-spend zero-conversion, competitor, or low-data queries. Do not use for routine keyword expansion or to make direct negative-keyword changes.
---

# Search-Term Anomaly Diagnosis

## Frame the anomaly

Confirm the metric that changed, its magnitude, target or acceptable range, affected campaign or ad group, current period, baseline period, currency, conversion definition, and tracking changes. Obtain query, match type, campaign, ad group, spend, clicks, conversions, conversion value, and date where available.

Do not attribute an account-level anomaly to search terms until the comparison period and conversion tracking are comparable.

## Isolate material queries

Prioritize queries that plausibly explain the anomaly:

1. High spend with zero conversions.
2. CPA materially above target or baseline.
3. CPC or spend that rose sharply versus the baseline.
4. New queries, themes, or match types that gained volume in the anomaly period.

Do not use total cost alone: a query can be costly yet still valuable if conversion quality supports it.

## Classify and diagnose

Classify each material query as one of:

- **Irrelevant:** a clear candidate for a precise negative after human review.
- **Relevant but mismatched:** valid demand sent to the wrong ad group, message, or landing page.
- **Competitor:** retain, isolate, or exclude according to the account's competitor policy.
- **Relevant but inefficient:** investigate auction pressure, offer, creative, landing-page, or conversion-tracking causes before excluding.
- **Insufficient data:** keep in a review queue; do not label as waste solely because it has zero conversions.

Compare the anomaly period with the baseline. Distinguish a query that newly consumed spend from a persistent query whose CPC, conversion rate, or conversion tracking changed.

## Output

Return:

1. The observed anomaly and its scope.
2. A driver table with `theme/query`, `current vs baseline spend`, `CPC`, `conversions`, `CPA`, `classification`, `root-cause hypothesis`, `recommended action`, `risk`, and `reviewer`.
3. A separate list of high-spend zero-conversion queries, ordered by cost.
4. Exact, phrase, or broad negative-keyword candidates only where relevance is clearly absent; include false-positive risk.
5. Tracking, landing-page, campaign-structure, or auction checks needed to confirm the hypothesis.

## Prompt examples

The examples below use placeholders only. Replace them with the minimum necessary, authorized account context; do not include credentials, customer personal data, or unredacted exports.

### Analyze a connected account

```text
Use $search-term-anomaly-diagnosis to investigate a CPA anomaly for account <account-id>.
Compare <current-period> with <baseline-period>. Target CPA is <target-cpa>;
the conversion is <conversion-definition>. Identify high-spend zero-conversion
queries, anomalous CPC or CPA terms, and new query themes. Do not modify the account.
```

### Analyze an uploaded report

```text
Use $search-term-anomaly-diagnosis on this anonymized search-term report.
Current-period CPA changed from <baseline-cpa> to <current-cpa>; conversion means
<conversion-definition>. Classify anomaly-driving terms, state the evidence and
root-cause hypothesis, and propose review-only negative-keyword candidates.
```

## Guardrails

- Never add negatives automatically; show exact proposed terms and match levels for approval.
- Do not treat a zero-conversion query with little spend or few clicks as evidence of irrelevance.
- Do not label a relevant high-CPA query as waste before checking conversion definition, landing-page fit, and tracking.
- Do not use sensitive personal attributes to infer intent or targeting.
