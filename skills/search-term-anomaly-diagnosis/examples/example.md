# Example: Search-Term Anomaly Diagnosis

All account names, search terms, and performance data below are fictional and supplied only to demonstrate the expected analysis format. No account changes are made.

## Input

- Account: `<account-id>`
- Scope: Search campaigns
- Product: FlowNote, a tool that turns pasted meeting notes into assigned tasks and due dates
- Current period: 1-7 June
- Baseline period: 25-31 May
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
| `free meeting minutes template` | $420 vs. $35 | $3.50 | 0 | - | Relevant but mismatched | Free-template research traffic reaches a trial-registration page | Review a template-led landing page or isolate the theme | Medium; demand may still convert later |
| `ai meeting notes tool` | $360 vs. $0 | $6.00 | 4 | $90 | Relevant but inefficient | Newly active AI-assistant intent has high CPC and weak trial conversion | Separate into an AI-notes ad group; check message and landing-page fit | Medium; preserve learning before excluding |
| `notion meeting notes alternative` | $290 vs. $40 | $5.80 | 1 | $290 | Competitor | Broader competitor matching expanded | Apply the account's competitor policy; isolate or exclude after review | High; false positives if comparison traffic is strategic |
| `meeting transcription jobs` | $180 vs. $15 | $4.50 | 0 | - | Irrelevant | Employment intent is outside the product scope | Propose an exact negative: `[meeting transcription jobs]` | Low; human approval required |
| `meeting action items` | $240 vs. $220 | $3.00 | 12 | $20 | Relevant | Persistent, efficient core intent | Retain; use as a control theme | Low |

### High-spend zero-conversion review queue

| Query | Spend | Clicks | Why it needs review | Proposed treatment |
| --- | ---: | ---: | --- | --- |
| `free meeting minutes template` | $420 | 120 | Substantial spend, but plausible product-adjacent intent | Route to a template-led experience or test a clearer qualification message |
| `meeting transcription jobs` | $180 | 40 | Clearly employment intent | Submit exact negative for approval |

### New-theme finding

`ai meeting notes tool` had no baseline spend and accounted for $360 in the current period. This is a newly active theme, not proof that it is irrelevant: isolate it first, then assess whether its high CPA persists with an AI-notes-specific message and landing page.

### Validation before action

- Confirm trial-registration tracking and attribution settings did not change between periods.
- Check impression share, bid strategy, and budget changes for the AI-notes and competitor ad groups.
- Confirm that the landing page supports both free-template and AI-notes use cases.
- Do not add any negatives or change bids without account-owner approval.
