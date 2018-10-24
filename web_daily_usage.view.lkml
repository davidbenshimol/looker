view: web_daily_usage {
  sql_table_name: agg.web_daily_usage ;;

  filter: previous_period_filter {
    type: date
    description: "Use this filter for period analysis"
  }

  # For Amazon Redshift
  # ${created_raw} is the timestamp dimension we are building our reporting period off of
  dimension: previous_period {
    type: string
    description: "The reporting period as selected by the Previous Period Filter"
    sql:
      CASE
        WHEN {% date_start previous_period_filter %} is not null AND {% date_end previous_period_filter %} is not null /* date ranges or in the past x days */
          THEN
            CASE
              WHEN ${dt_raw} >=  {% date_start previous_period_filter %}
                AND ${dt_raw} <= {% date_end previous_period_filter %}
                THEN 'This Period'
              WHEN ${dt_raw} >= DATEADD(day,-1*DATEDIFF(day,{% date_start previous_period_filter %}, {% date_end previous_period_filter %} ) + 1, DATEADD(day,-1,{% date_start previous_period_filter %} ) )
                AND ${dt_raw} <= DATEADD(day,-1,{% date_start previous_period_filter %} )
                THEN 'Previous Period'
            END
          END ;;
  }

  measure: count_domain_userid {
    label: "Num Distinct Users"
    type: count_distinct
    sql: ${TABLE}.domain_userid ;;
  }

  measure: page_view {
    label: "Sum Page Views"
    type: sum
    sql: ${TABLE}.page_view ;;
    drill_fields: [dt_date,page_view]
  }

  measure: pages_viewed {
    label: "Num Distinct Pages"
    type: sum
    sql: ${TABLE}.pages_viewed ;;
  }

  measure: sum_session_count {
    label: "Num Sessions"
    type: sum
    value_format_name: decimal_0
    sql: ${TABLE}.session_count ;;
    drill_fields: [dt_raw,sum_session_count]
  }

  measure: sum_session_length {
    label: "Session Length"
    type: sum
    value_format_name: decimal_1
    sql: ${TABLE}.session_length ;;
  }

  measure: sum_bounce {
    label: "Sum Bounce"
    type: sum
    value_format_name: decimal_1
    sql: ${TABLE}.bounce ;;
  }

  measure: avg_time_page {
    description: "Avg Time on Page"
    type: number
    value_format_name: decimal_1
    sql: ${sum_session_length} / nullif(${sum_session_count},0) / 60.00 ;;
  }

  measure: bounce_rate {
    description: "Bounce Rate"
    type: number
    value_format_name: decimal_1
    sql: ${sum_bounce} / nullif(${sum_session_count},0) / 60.00 ;;
  }

  measure: video_complete {
    type: sum
    sql: ${TABLE}.video_complete ;;
  }

  measure: video_pause {
    type: sum
    sql: ${TABLE}.video_pause ;;
  }

  measure: video_play {
    type: sum
    sql: ${TABLE}.video_play ;;
  }

  measure: articles_read {
    type: sum
    sql: ${TABLE}.articles_read ;;
  }

  dimension: pv_location {
    type: location
    sql_latitude:${TABLE}.geo_latitude ;;
    sql_longitude:${TABLE}.geo_longitude ;;
  }

  dimension: geo_city {
    type: string
    sql: ${TABLE}.geo_city ;;
    drill_fields: [pv_location]
  }

  dimension: geo_country {
    map_layer_name: countries
    type: string
    sql: ${TABLE}.geo_country ;;
    drill_fields: [geo_city,pv_location]
  }

  dimension: geo_timezone {
    type: string
    sql: ${TABLE}.geo_timezone ;;
  }

  dimension: br_lang {
    type: string
    sql: ${TABLE}.br_lang ;;
  }

  dimension: br_name {
    type: string
    sql: ${TABLE}.br_name ;;
  }

  dimension: br_version {
    type: string
    sql: ${TABLE}.br_version ;;
  }

  measure: breadcrumb_click {
    type: sum
    sql: ${TABLE}.breadcrumb_click ;;
  }

  measure: completed_reading {
    type: sum
    sql: ${TABLE}.completed_reading ;;
  }

  measure: cta_click {
    type: sum
    sql: ${TABLE}.cta_click ;;
  }

  dimension: device_marketing_name {
    type: string
    sql: ${TABLE}.device_marketing_name ;;
  }

  dimension: domain_userid {
    type: string
    sql: ${TABLE}.domain_userid ;;
  }

  dimension: download_click {
    type: number
    sql: ${TABLE}.download_click ;;
  }

  dimension_group: dt {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.dt ;;
  }

  dimension: dvce_ismobile {
    type: yesno
    sql: ${TABLE}.dvce_ismobile ;;
  }

  dimension: dvce_type {
    type: string
    sql: ${TABLE}.dvce_type ;;
  }

  measure: editors_choice_click {
    type: number
    sql: ${TABLE}.editors_choice_click ;;
  }

  dimension: first_page {
    type: string
    sql: ${TABLE}.first_page ;;
  }

  dimension: first_page_type {
    type: string
    sql: ${TABLE}.first_page_type ;;
  }

  dimension: first_refr_host {
    type: string
    sql: ${TABLE}.first_refr_host ;;
  }

  dimension: first_refr_medium {
    type: string
    sql: ${TABLE}.first_refr_medium ;;
  }

  dimension: first_utm_campaign {
    type: string
    sql: ${TABLE}.first_utm_campaign ;;
  }

  dimension: first_utm_medium {
    type: string
    sql: ${TABLE}.first_utm_medium ;;
  }

  dimension: first_utm_source {
    type: string
    sql: ${TABLE}.first_utm_source ;;
  }

  measure: go_click {
    type: number
    sql: ${TABLE}.go_click ;;
  }

  measure: label_click {
    type: number
    sql: ${TABLE}.label_click ;;
  }

  measure: link_click {
    type: number
    sql: ${TABLE}.link_click ;;
  }

  measure: locations_click {
    type: number
    sql: ${TABLE}.locations_click ;;
  }

  dimension: os_family {
    type: string
    sql: ${TABLE}.os_family ;;
  }

  dimension: os_name {
    type: string
    sql: ${TABLE}.os_name ;;
  }

  dimension: platform {
    type: string
    sql: ${TABLE}.platform ;;
  }

  measure: recommended_click {
    type: number
    sql: ${TABLE}.recommended_click ;;
  }

  measure: related_click {
    type: number
    sql: ${TABLE}.related_click ;;
  }

  measure: related_in_view {
    type: number
    sql: ${TABLE}.related_in_view ;;
  }

  measure: search {
    type: number
    sql: ${TABLE}.search ;;
  }

  measure: share_click {
    type: number
    sql: ${TABLE}.share_click ;;
  }

  measure: share_email {
    type: number
    sql: ${TABLE}.share_email ;;
  }

  measure: share_facebook {
    type: number
    sql: ${TABLE}.share_facebook ;;
  }

  measure: share_pintrest {
    type: number
    sql: ${TABLE}.share_pintrest ;;
  }

  measure: share_twitter {
    type: number
    sql: ${TABLE}.share_twitter ;;
  }

  measure: share_whatsapp {
    type: number
    sql: ${TABLE}.share_whatsapp ;;
  }

  measure: trending_click {
    type: number
    sql: ${TABLE}.trending_click ;;
  }

  dimension: user_agent {
    type: string
    sql: ${TABLE}.user_agent ;;
  }

  measure: count {
    type: count
    drill_fields: [device_marketing_name, os_name, br_name]
  }
}
