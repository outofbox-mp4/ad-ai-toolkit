# Example: Search-Term Anomaly Diagnosis

All account names, search terms, and performance data below are fictional and supplied only to demonstrate the expected analysis format. No account changes are made.

## Input

- Account: `<account-id>`
- Scope: Search campaigns
- Current period: 1–7 June
- Baseline period: 25–31 May
- Conversion: trial registration
- Target CPA: $30
- Reported anomaly: CPA increased while conversion volume fell

## Output

### Observed anomaly

| Metric | Current | Baseline | Change | Interpretation |
| --- | ---: | ---: | ---: | --- |
| Spend | $2,400 | $2,100 | +14% | More budget entered the auction |
| Trial registrations | 60 | 84 | -29% | Conversion volume declined |
| CPA | $40 | $25 | +60% | Above the $30 target |
| CPC | $4.00 | $3.00 | +33% | Auction cost contributed to deterioration |

### Search-term drivers

| Theme/query | Current vs. baseline spend | Current CPC | Current conversions | Current CPA | Classification | Root-cause hypothesis | Recommended action | Risk / reviewer |
| --- | --- | ---: | ---: | ---: | --- | --- | --- | --- |
| `free email finder` | $420 vs. $35 | $3.50 | 0 | — | Relevant but mismatched | Free-tool research traffic now reaches a trial page | Review a dedicated free-tool landing page or isolate the theme | Medium; demand may still convert later |
| `email lookup api` | $360 vs. $0 | $6.00 | 4 | $90 | Relevant but inefficient | New API intent has high CPC and weak trial conversion | Separate into an API ad group; check offer and landing-page fit | Medium; preserve learning before excluding |
| `competitor-x alternative` | $290 vs. $40 | $5.80 | 1 | $290 | Competitor | Broader competitor matching expanded | Apply the account's competitor policy; isolate or exclude after review | High; false positives if comparison traffic is strategic |
| `celebrity email address` | $180 vs. $15 | $4.50 | 0 | — | Irrelevant | Personal-contact intent is outside the product scope | Propose an exact negative: `[celebrity email address]` | Low; human approval required |
| `business email finder` | $240 vs. $220 | $3.00 | 12 | $20 | Relevant | Persistent, efficient core intent | Retain; use as a control theme | Low |

### High-spend zero-conversion review queue

| Query | Spend | Clicks | Why it needs review | Proposed treatment |
| --- | ---: | ---: | --- | --- |
| `free email finder` | $420 | 120 | Substantial spend, but plausible product-adjacent intent | Route to a dedicated experience or test a clearer qualification message |
| `celebrity email address` | $180 | 40 | Clearly personal-contact intent | Submit exact negative for approval |

### New-theme finding

`email lookup api` had no baseline spend and accounted for $360 in the current period. This is a newly active theme, not proof that it is irrelevant: isolate it first, then assess whether its high CPA persists with an API-specific message and landing page.

### Validation before action

- Confirm trial-registration tracking and attribution settings did not change between periods.
- Check impression share, bid strategy, and budget changes for the API and competitor ad groups.
- Confirm that the landing page supports both free-tool and API use cases.
- Do not add any negatives or change bids without account-owner approval.
