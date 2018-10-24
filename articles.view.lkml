view: articles {
  sql_table_name: wordpress.articles ;;

  measure: count_post_id {
    type: count_distinct
    sql: ${TABLE}.post_id ;;
  }

  dimension: article_type {
    type: string
    sql: ${TABLE}.article_type ;;
    drill_fields: [post_category,post_name]
  }

  dimension: author_id {
    type: number
    sql: ${TABLE}.author_id ;;
  }

  dimension: comment_status {
    type: string
    sql: ${TABLE}.comment_status ;;
  }

  dimension: description {
    type: string
    sql: ${TABLE}.description ;;
  }

  dimension: guid {
    type: string
    sql: ${TABLE}.guid ;;
  }

  dimension: menu_order {
    type: number
    sql: ${TABLE}.menu_order ;;
  }

  dimension: parent {
    type: number
    sql: ${TABLE}.parent ;;
  }

  dimension: ping_status {
    type: string
    sql: ${TABLE}.ping_status ;;
  }

  dimension: post_category {
    type: string
    sql: ${TABLE}.post_category ;;
    drill_fields: [post_name]
  }

  dimension: post_content_filtered {
    type: string
    sql: ${TABLE}.post_content_filtered ;;
  }

  dimension: months_since_published {
    type: number
    sql: DATEDIFF(month,${post_date},CURRENT_DATE) ;;
  }

  dimension_group: post {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.post_date ;;
  }

  dimension_group: post_date_gmt {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.post_date_gmt ;;
  }

  dimension: post_excerpt {
    type: string
    sql: ${TABLE}.post_excerpt ;;
  }

  dimension: post_id {
    type: number
    sql: ${TABLE}.post_id ;;
  }

  dimension: post_mime_type {
    type: string
    sql: ${TABLE}.post_mime_type ;;
  }

  dimension_group: post_modified {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.post_modified ;;
  }

  dimension_group: post_modified_gmt {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.post_modified_gmt ;;
  }

  dimension: post_name {
    type: string
    sql: ${TABLE}.post_name ;;
    link: {
      url: "/dashboards/4?Post%20Name={{value}}"
      label: "Post Detail for {{value}}"
    }
  }

  filter: post_selector {
    type: string
    suggest_dimension: post_name
  }

  dimension: post_benchmark {
    type: string
    sql: case when ( {% condition post_selector %} ${post_name} {% endcondition %}) then ${post_name} else 'Benchmark' end  ;;
  }

  dimension: post_parent {
    type: number
    sql: ${TABLE}.post_parent ;;
  }

  dimension: post_status {
    type: string
    sql: ${TABLE}.post_status ;;
  }

  dimension: post_title {
    type: string
    sql: ${TABLE}.post_title ;;
  }

  dimension: post_type {
    type: string
    sql: ${TABLE}.post_type ;;
  }

  dimension: taxonomy {
    type: string
    sql: ${TABLE}.taxonomy ;;
  }

  dimension: term_group {
    type: number
    sql: ${TABLE}.term_group ;;
  }

  dimension: term_id {
    type: number
    sql: ${TABLE}.term_id ;;
  }

  dimension: term_name {
    type: string
    sql: REPLACE(${TABLE}.term_name,'&amp;','&') ;;
  }

  dimension: term_order {
    type: number
    sql: ${TABLE}.term_order ;;
  }

  dimension: term_taxonomy_id {
    type: number
    sql: ${TABLE}.term_taxonomy_id ;;
  }

  measure: count {
    type: count
    drill_fields: [term_name, post_name]
  }
}
