---
name: search-ad-assets
description: Create search-ad text assets for Google Ads, Microsoft Advertising, and similar text Search platforms. Use when asked to write or refresh responsive search-ad headlines, descriptions, display paths, sitelinks, callouts, or structured snippets. Organize assets around keyword themes, the user's search trigger or intent, product proof, and a relevant call to action. Do not use for visual ad creative, bidding, campaign structure, or search-term mining.
---

# Search Ad Assets

## Scope

Use for text assets that appear with a Search query. Build assets by keyword theme and search intent, not as one generic list for an entire account.

Do not use this skill to choose keywords, add negatives, set bids, or create visual assets. Hand those tasks to keyword, search-term, campaign, or visual-creative skills.

## Gather inputs

Obtain the platform, market and language, landing page, conversion event, offer, approved claims, keyword themes, match-type context, search intent, brand constraints, and any current asset limits. Treat missing product proof or policy guidance as an open question.

## Build the message map

For each ad group or keyword theme, define:

| Element | Purpose |
| --- | --- |
| Keyword theme | Match the user's expressed need without keyword stuffing. |
| Trigger | Reflect the moment, urgency, pain point, or comparison intent behind the query. |
| Proof | State only an approved feature, offer, price, or differentiator. |
| CTA | Match the next action to the search intent and landing page. |

Use the map to create genuinely different headline and description combinations. Do not make superficial word swaps.

## Produce assets

1. Group output by keyword theme or ad group.
2. Label every headline and description with its primary role: `keyword`, `trigger`, `proof`, `CTA`, or `brand`.
3. Include display paths and eligible extensions—sitelinks, callouts, or structured snippets—only when the supplied platform and landing page support them.
4. Validate against the platform's current character limits and editorial policy before upload. Do not assume limits from another platform or locale.
5. Recommend pinning only where a legal, brand, or message-order requirement makes it necessary; otherwise preserve combination diversity.

## Output format

Return, for each keyword theme:

- Message map
- Headline table: asset, role, intended combination, optional pinning rationale
- Description table: asset, role, intended combination
- Display paths and extensions
- Compliance checks, unanswered questions, and launch checklist

Read [examples/example.md](examples/example.md) when a concrete output shape is helpful.

## Guardrails

- Do not invent prices, discounts, results, availability, reviews, or competitor claims.
- Do not repeat a keyword unnaturally merely to increase density.
- Keep the CTA consistent with the actual landing-page action.
- Flag regulated, comparative, and performance claims for legal or brand review.
