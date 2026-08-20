# Google Ads Fields

## Campaign Audit Fields

| Area | Fields |
| --- | --- |
| Campaign | `campaign.id`, `campaign.name`, `campaign.status`, `campaign.advertising_channel_type` |
| Delivery | `metrics.impressions`, `metrics.clicks`, `metrics.ctr`, `metrics.average_cpc`, `metrics.cost_micros` |
| Conversions | `metrics.conversions`, `metrics.conversions_value`, `metrics.all_conversions`, `metrics.all_conversions_value` |
| Conversion split | `segments.conversion_action_name`, conversion metrics |
| Search context | `metrics.search_impression_share`, `metrics.search_budget_lost_impression_share`, `metrics.search_rank_lost_impression_share`, `metrics.search_top_impression_share` |
| Segments | `segments.date`, `segments.device`, `segments.geo_target_country`, `ad_group.id`, `ad_group.name`, keyword and search-term views where available |

## Handling

- Convert `cost_micros` to currency by dividing by 1,000,000.
- Keep account IDs and raw customer names out of public examples.
- Use aliases for public docs: `account_alpha`, `search_core`, `pmax_growth`.
- Do not commit GAQL exports or customer reports.
