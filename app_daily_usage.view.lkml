view: app_daily_usage {
  sql_table_name: agg.app_daily_usage ;;

  dimension: app_install {
    type: number
    sql: ${TABLE}.app_install ;;
  }

  dimension: app_open {
    type: number
    sql: ${TABLE}.app_open ;;
  }

  dimension: article_open {
    type: number
    sql: ${TABLE}.article_open ;;
  }

  dimension: article_read {
    type: number
    sql: ${TABLE}.article_read ;;
  }

  dimension: bookmark_article {
    type: number
    sql: ${TABLE}.bookmark_article ;;
  }

  dimension: client_version {
    type: string
    sql: ${TABLE}.client_version ;;
  }

  dimension: device_manufacturer {
    type: string
    sql: ${TABLE}.device_manufacturer ;;
  }

  dimension: device_model {
    type: string
    sql: ${TABLE}.device_model ;;
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

  dimension: geo_region {
    type: string
    sql: ${TABLE}.geo_region ;;
  }

  dimension: install_referrer {
    type: string
    sql: ${TABLE}.install_referrer ;;
  }

  dimension: internal_user_id {
    type: string
    sql: ${TABLE}.internal_user_id ;;
  }

  dimension: os_type {
    type: string
    sql: ${TABLE}.os_type ;;
  }

  dimension: os_version {
    type: string
    sql: ${TABLE}.os_version ;;
  }

  dimension: page_view {
    type: number
    sql: ${TABLE}.page_view ;;
  }

  dimension: push {
    type: number
    sql: ${TABLE}.push ;;
  }

  dimension: push_share_tap {
    type: number
    sql: ${TABLE}.push_share_tap ;;
  }

  dimension: push_tap {
    type: number
    sql: ${TABLE}.push_tap ;;
  }

  dimension: pv_near_me_gps {
    type: number
    sql: ${TABLE}.pv_near_me_gps ;;
  }

  dimension: pv_near_me_permission {
    type: number
    sql: ${TABLE}.pv_near_me_permission ;;
  }

  dimension: pv_no_articles {
    type: number
    sql: ${TABLE}.pv_no_articles ;;
  }

  dimension: pv_no_articles_error {
    type: number
    sql: ${TABLE}.pv_no_articles_error ;;
  }

  dimension: pv_no_results {
    type: number
    sql: ${TABLE}.pv_no_results ;;
  }

  dimension: search {
    type: number
    sql: ${TABLE}.search ;;
  }

  dimension: session_count {
    type: number
    sql: ${TABLE}.session_count ;;
  }

  dimension: settings {
    type: number
    sql: ${TABLE}.settings ;;
  }

  dimension: share_article {
    type: number
    sql: ${TABLE}.share_article ;;
  }

  dimension: signup {
    type: number
    sql: ${TABLE}.signup ;;
  }

  dimension: splash_deep_link {
    type: number
    sql: ${TABLE}.splash_deep_link ;;
  }

  dimension: splash_facebook {
    type: number
    sql: ${TABLE}.splash_facebook ;;
  }

  dimension: splash_google {
    type: number
    sql: ${TABLE}.splash_google ;;
  }

  dimension: splash_page_view {
    type: number
    sql: ${TABLE}.splash_page_view ;;
  }

  dimension: splash_skip {
    type: number
    sql: ${TABLE}.splash_skip ;;
  }

  dimension: travel_dates_popup_cancel {
    type: number
    sql: ${TABLE}.travel_dates_popup_cancel ;;
  }

  dimension: travel_dates_popup_done {
    type: number
    sql: ${TABLE}.travel_dates_popup_done ;;
  }

  dimension: travel_popup_cancel {
    type: number
    sql: ${TABLE}.travel_popup_cancel ;;
  }

  dimension: travel_popup_enroll {
    type: number
    sql: ${TABLE}.travel_popup_enroll ;;
  }

  dimension: user_agent {
    type: string
    sql: ${TABLE}.user_agent ;;
  }

  dimension: user_id {
    type: string
    sql: ${TABLE}.user_id ;;
  }

  dimension: version_name {
    type: string
    sql: ${TABLE}.version_name ;;
  }
  measure: count_users {
    type: count_distinct
    sql: ${TABLE}.user_id ;;
  }


}
