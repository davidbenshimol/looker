view: web_general {
  sql_table_name: agg.web_general ;;

  dimension: br_name {
    type: string
    sql: ${TABLE}.br_name ;;
  }

  dimension: cta_clicks {
    type: number
    sql: ${TABLE}.cta_clicks ;;
  }

  dimension: device_marketing_name {
    type: string
    sql: ${TABLE}.device_marketing_name ;;
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


  dimension: dvce_type {
    type: string
    sql: ${TABLE}.dvce_type ;;
  }

  dimension: geo_country {
    type: string
    sql: ${TABLE}.geo_country ;;
  }

  dimension: link_clicks {
    type: number
    sql: ${TABLE}.link_clicks ;;
  }

  dimension: new_user {
    type: number
    sql: ${TABLE}.new_user ;;
  }

  dimension: os_family {
    type: string
    sql: ${TABLE}.os_family ;;
  }

  dimension: os_name {
    type: string
    sql: ${TABLE}.os_name ;;
  }

  dimension: page_views {
    type: number
    sql: ${TABLE}.page_views ;;
  }

  dimension: period {
    type: string
    sql: ${TABLE}.period ;;
  }

  dimension: referrer {
    type: string
    sql: ${TABLE}.referrer ;;
  }

  dimension: related_clicks {
    type: number
    sql: ${TABLE}.related_clicks ;;
  }

  dimension: sessions {
    type: number
    sql: ${TABLE}.sessions ;;
  }

  dimension: share_clicks {
    type: number
    sql: ${TABLE}.share_clicks ;;
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

  dimension: time_spent {
    type: number
    sql: ${TABLE}.time_spent ;;
  }

  dimension: unique_visitors {
     type: number
     sql: ${TABLE}.unique_visitors ;;
   }

  dimension: users_shared {
    type: number
    sql: ${TABLE}.users_shared ;;
  }

  dimension: utm_medium {
    type: string
    sql: ${TABLE}.utm_medium ;;
  }

  dimension: utm_source {
    type: string
    sql: ${TABLE}.utm_source ;;
  }

  dimension: video_play {
    type: number
    sql: ${TABLE}.video_play ;;
  }

  dimension: dt {
    type: date
    sql: ${TABLE}.dt ;;
  }

  measure: count {
    type: count
    drill_fields: [device_marketing_name, os_name, br_name]
  }

  measure: unique_Monthly_visitors {
    description: "Sum Unique Monthly Visitors"
    type: sum
    filters: {
      field: period
      value: "month"
    }
    sql: ${TABLE}.unique_visitors ;;
  }
  measure: unique_Daily_visitors {
    description: "Sum Unique Daily Visitors"
    type: sum
    filters: {
      field: period
      value: "day"
    }
    sql: ${TABLE}.unique_visitors ;;
  }
  measure:  unique_users_in_last_24hrs {
    description: " unique users in last 24hrs"
    type: sum
    filters: {
      field: period
      value: "day"
    }
    sql: ${TABLE}.unique_visitors ;;
  }

  measure:  unique_users_in_last_30day {
    description: " unique users in last 30day"
    type: sum
    filters: {
      field: period
      value: "month"
    }
    sql: ${TABLE}.unique_visitors ;;
  }

  measure: DUVMUV {
    description: "DUV/MUV"
    type: number
    value_format: "0.0%"

    sql: 1.0*${unique_users_in_last_24hrs}/NULLIF(${unique_users_in_last_30day},0) ;;
  }

  measure: page_view {
    description: "# Page View"
    type: sum
    filters: {
      field: period
      value: "day"
    }
    sql: ${TABLE}.page_views ;;
  }



}
