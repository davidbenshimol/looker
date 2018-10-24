view: page_actions {
  sql_table_name: agg.page_actions ;;

  dimension: primary_key {
    primary_key: yes
    sql: ${dt_raw} || ${post_id} ;;
  }

  measure: page_view {
    description: "Sum Page Views"
    type: sum
    sql: ${TABLE}.page_view ;;
  }

  measure: average_page_view {
    description: "Average Page Views"
    type: average
    sql: ${TABLE}.page_view ;;
  }

  dimension: months_since_article_published {
    type: number
    sql: DATEDIFF(month,${articles.post_date},${dt_date}) ;;
  }

  measure: page_view_users {
    type: sum
    sql: ${TABLE}.page_view_users ;;
  }

  dimension: app_id {
    type: string
    sql: ${TABLE}.app_id ;;
  }

  dimension: bounce {
    type: number
    sql: ${TABLE}.bounce ;;
  }

  dimension: bounce_users {
    type: number
    sql: ${TABLE}.bounce_users ;;
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

  dimension: breadcrumb_click {
    type: number
    sql: ${TABLE}.breadcrumb_click ;;
  }

  dimension: breadcrumb_click_users {
    type: number
    sql: ${TABLE}.breadcrumb_click_users ;;
  }

  dimension: completed_reading {
    type: number
    sql: ${TABLE}.completed_reading ;;
  }

  dimension: cta_click {
    type: number
    sql: ${TABLE}.cta_click ;;
  }

  dimension: cta_click_users {
    type: number
    sql: ${TABLE}.cta_click_users ;;
  }

  dimension: device_marketing_name {
    type: string
    sql: ${TABLE}.device_marketing_name ;;
  }

  dimension: download_click {
    type: number
    sql: ${TABLE}.download_click ;;
  }

  dimension: download_click_users {
    type: number
    sql: ${TABLE}.download_click_users ;;
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
    type: number
    sql: ${TABLE}.dvce_ismobile ;;
  }

  dimension: dvce_type {
    type: string
    sql: ${TABLE}.dvce_type ;;
  }

  dimension: editors_choice_click {
    type: number
    sql: ${TABLE}.editors_choice_click ;;
  }

  dimension: exit {
    type: number
    sql: ${TABLE}.exit ;;
  }

  dimension: exit_users {
    type: number
    sql: ${TABLE}.exit_users ;;
  }

  dimension: geo_city {
    type: string
    sql: ${TABLE}.geo_city ;;
  }

  dimension: geo_country {
    type: string
    sql: ${TABLE}.geo_country ;;
  }

  dimension: geo_timezone {
    type: string
    sql: ${TABLE}.geo_timezone ;;
  }

  dimension: go_click {
    type: number
    sql: ${TABLE}.go_click ;;
  }

  dimension: go_click_users {
    type: number
    sql: ${TABLE}.go_click_users ;;
  }

  dimension: label_click {
    type: number
    sql: ${TABLE}.label_click ;;
  }

  dimension: label_click_users {
    type: number
    sql: ${TABLE}.label_click_users ;;
  }

  dimension: link_click {
    type: number
    sql: ${TABLE}.link_click ;;
  }

  dimension: link_click_users {
    type: number
    sql: ${TABLE}.link_click_users ;;
  }

  dimension: locations_click {
    type: number
    sql: ${TABLE}.locations_click ;;
  }

  dimension: locations_click_users {
    type: number
    sql: ${TABLE}.locations_click_users ;;
  }

  dimension: mkt_campaign {
    type: string
    sql: ${TABLE}.mkt_campaign ;;
  }

  dimension: mkt_medium {
    type: string
    sql: ${TABLE}.mkt_medium ;;
  }

  dimension: mkt_source {
    type: string
    sql: ${TABLE}.mkt_source ;;
  }

  dimension: os_family {
    type: string
    sql: ${TABLE}.os_family ;;
  }

  dimension: os_name {
    type: string
    sql: ${TABLE}.os_name ;;
  }

  dimension: page {
    type: string
    sql: ${TABLE}.page ;;
  }

  dimension: page_refr_medium {
    type: string
    sql: ${TABLE}.page_refr_medium ;;
  }

  dimension: page_refr_urlhost {
    type: string
    sql: ${TABLE}.page_refr_urlhost ;;
  }

  dimension: page_type {
    type: string
    sql: ${TABLE}.page_type ;;
  }

  dimension: page_utm_campaign {
    type: string
    sql: ${TABLE}.page_utm_campaign ;;
  }

  dimension: page_utm_medium {
    type: string
    sql: ${TABLE}.page_utm_medium ;;
  }

  dimension: page_utm_source {
    type: string
    sql: ${TABLE}.page_utm_source ;;
  }

  dimension: platform {
    type: string
    sql: ${TABLE}.platform ;;
  }

  dimension: post_id {
    type: number
    sql: ${TABLE}.post_id ;;
  }

  dimension: recommended_click {
    type: number
    sql: ${TABLE}.recommended_click ;;
  }

  dimension: refr_medium {
    type: string
    sql: ${TABLE}.refr_medium ;;
  }

  dimension: refr_urlhost {
    type: string
    sql: ${TABLE}.refr_urlhost ;;
  }

  dimension: related_click {
    type: number
    sql: ${TABLE}.related_click ;;
  }

  dimension: related_click_users {
    type: number
    sql: ${TABLE}.related_click_users ;;
  }

  dimension: related_in_view {
    type: number
    sql: ${TABLE}.related_in_view ;;
  }

  dimension: session_first_page {
    type: number
    sql: ${TABLE}.session_first_page ;;
  }

  dimension: sessions {
    type: number
    sql: ${TABLE}.sessions ;;
  }

  dimension: share_click {
    type: number
    sql: ${TABLE}.share_click ;;
  }

  dimension: share_click_users {
    type: number
    sql: ${TABLE}.share_click_users ;;
  }

  dimension: share_email {
    type: number
    sql: ${TABLE}.share_email ;;
  }

  dimension: share_email_users {
    type: number
    sql: ${TABLE}.share_email_users ;;
  }

  dimension: share_facebook {
    type: number
    sql: ${TABLE}.share_facebook ;;
  }

  dimension: share_facebook_users {
    type: number
    sql: ${TABLE}.share_facebook_users ;;
  }

  dimension: share_pintrest {
    type: number
    sql: ${TABLE}.share_pintrest ;;
  }

  dimension: share_pintrest_users {
    type: number
    sql: ${TABLE}.share_pintrest_users ;;
  }

  dimension: share_twitter {
    type: number
    sql: ${TABLE}.share_twitter ;;
  }

  dimension: share_twitter_users {
    type: number
    sql: ${TABLE}.share_twitter_users ;;
  }

  dimension: share_whatsapp {
    type: number
    sql: ${TABLE}.share_whatsapp ;;
  }

  dimension: share_whatsapp_users {
    type: number
    sql: ${TABLE}.share_whatsapp_users ;;
  }

  dimension: total_visit_time {
    type: number
    sql: ${TABLE}.total_visit_time ;;
  }

  dimension: trending_click {
    type: number
    sql: ${TABLE}.trending_click ;;
  }

  dimension: user_age {
    type: number
    sql: ${TABLE}.user_age ;;
  }

  dimension: user_age_tiered {
    type: tier
    tiers: [10,15,25,30,35,40,45,50,55,60]
    style: integer
    sql: ${user_age} ;;
  }

  dimension: video_complete {
    type: number
    sql: ${TABLE}.video_complete ;;
  }

  dimension: video_pause {
    type: number
    sql: ${TABLE}.video_pause ;;
  }

  dimension: video_play {
    type: number
    sql: ${TABLE}.video_play ;;
  }

  measure: count {
    type: count
    drill_fields: [device_marketing_name, os_name, br_name]
  }
}
