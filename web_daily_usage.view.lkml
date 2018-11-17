view: web_daily_usage {
  sql_table_name: agg.web_daily_usage ;;

  dimension: articles_read {
    type: number
    sql: ${TABLE}.articles_read ;;
  }

  dimension: bounce {
    type: number
    sql: ${TABLE}.bounce ;;
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

  dimension: completed_reading {
    type: number
    sql: ${TABLE}.completed_reading ;;
  }

  dimension: cta_click {
    type: number
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

  dimension: editors_choice_click {
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

  dimension: geo_city {
    type: string
    sql: ${TABLE}.geo_city ;;
  }

  dimension: geo_country {
    type: string
    sql: ${TABLE}.geo_country ;;
  }

  dimension: geo_latitude {
    type: number
    sql: ${TABLE}.geo_latitude ;;
  }

  dimension: geo_longitude {
    type: number
    sql: ${TABLE}.geo_longitude ;;
  }

  dimension: geo_timezone {
    type: string
    sql: ${TABLE}.geo_timezone ;;
  }

  dimension: go_click {
    type: number
    sql: ${TABLE}.go_click ;;
  }

  dimension: label_click {
    type: number
    sql: ${TABLE}.label_click ;;
  }

  dimension: link_click {
    type: number
    sql: ${TABLE}.link_click ;;
  }

  dimension: locations_click {
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

  dimension: page_view {
    type: number
    sql: ${TABLE}.page_view ;;
  }

  dimension: pages_viewed {
    type: number
    sql: ${TABLE}.pages_viewed ;;
  }

  dimension: platform {
    type: string
    sql: ${TABLE}.platform ;;
  }

  dimension: recommended_click {
    type: number
    sql: ${TABLE}.recommended_click ;;
  }

  dimension: related_click {
    type: number
    sql: ${TABLE}.related_click ;;
  }

  dimension: related_in_view {
    type: number
    sql: ${TABLE}.related_in_view ;;
  }

  dimension: search {
    type: number
    sql: ${TABLE}.search ;;
  }

  dimension: session_count {
    type: number
    sql: ${TABLE}.session_count ;;
  }

  dimension: session_length {
    type: number
    sql: ${TABLE}.session_length ;;
  }

  dimension: share_click {
    type: number
    sql: ${TABLE}.share_click ;;
  }

  dimension: share_email {
    type: number
    sql: ${TABLE}.share_email ;;
  }

  dimension: share_facebook {
    type: number
    sql: ${TABLE}.share_facebook ;;
  }

  dimension: share_pintrest {
    type: number
    sql: ${TABLE}.share_pintrest ;;
  }

  dimension: share_twitter {
    type: number
    sql: ${TABLE}.share_twitter ;;
  }

  dimension: share_whatsapp {
    type: number
    sql: ${TABLE}.share_whatsapp ;;
  }

  dimension: trending_click {
    type: number
    sql: ${TABLE}.trending_click ;;
  }

  dimension: user_agent {
    type: string
    sql: ${TABLE}.user_agent ;;
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


  measure: count_users {
    type: count_distinct
    sql: ${TABLE}.domain_userid ;;
  }

  measure: Time_On_Site {

    type: average
    value_format:"0.00"
    sql: ${TABLE}.session_length /60 ;;
  }

}
