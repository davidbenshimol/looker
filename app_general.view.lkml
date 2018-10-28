view: app_general {
  sql_table_name: agg.app_general ;;

  dimension: active_users {
    type: number
    sql: ${TABLE}.active_users ;;
  }

  dimension: app_opens {
    type: number
    sql: ${TABLE}.app_opens ;;
  }

  dimension: bookmarks {
    type: number
    sql: ${TABLE}.bookmarks ;;
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

  dimension: install_referrer {
    type: string
    sql: ${TABLE}.install_referrer ;;
  }

  dimension: installs {
    type: number
    sql: ${TABLE}.installs ;;
  }

  dimension: os_type {
    type: string
    sql: ${TABLE}.os_type ;;
  }

  dimension: os_version {
    type: string
    sql: ${TABLE}.os_version ;;
  }

  dimension: page_views {
    type: number
    sql: ${TABLE}.page_views ;;
  }

  dimension: period {
    type: string
    sql: ${TABLE}.period ;;
  }

  dimension: push {
    type: number
    sql: ${TABLE}.push ;;
  }

  dimension: push_taps {
    type: number
    sql: ${TABLE}.push_taps ;;
  }

  dimension: pushes {
    type: number
    sql: ${TABLE}.pushes ;;
  }

  dimension: readers {
    type: number
    sql: ${TABLE}.readers ;;
  }

  dimension: searchers {
    type: number
    sql: ${TABLE}.searchers ;;
  }

  dimension: searches {
    type: number
    sql: ${TABLE}.searches ;;
  }

  dimension: shares {
    type: number
    sql: ${TABLE}.shares ;;
  }

  dimension: signups {
    type: number
    sql: ${TABLE}.signups ;;
  }

  dimension: version_name {
    type: string
    sql: ${TABLE}.version_name ;;
  }

  measure: count {
    type: count
    drill_fields: [version_name]
  }

  measure: page_view_app {
    description: "# Page View"
    type: sum
    filters: {
      field: period
      value: "day"
    }
    sql: ${TABLE}.page_views ;;
}

  measure:  unique_users_in_last_24hrs {
    description: " unique users in last 24hrs"
    type: sum
    filters: {
      field: period
      value: "day"
    }
    sql: ${TABLE}.readers ;;
  }

  measure:  unique_users_in_last_30day {
    description: " unique users in last 30day"
    type: sum
    filters: {
      field: period
      value: "month"
    }
    sql: ${TABLE}.readers ;;
  }

  measure: DUVMUV {
    description: "DUV/MUV"
    type: number
    value_format: "0.0%"

    sql: 1.0*${unique_users_in_last_24hrs}/NULLIF(${unique_users_in_last_30day},0) ;;
  }




}
