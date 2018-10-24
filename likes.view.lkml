view: likes {
  sql_table_name: kg.likes ;;

  dimension_group: creation {
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
    sql: ${TABLE}.creation_time ;;
  }

  dimension: kg_id {
    type: string
    sql: ${TABLE}.kg_id ;;
  }

  dimension: like_status {
    type: number
    sql: ${TABLE}.like_status ;;
  }

  dimension: node_type {
    type: number
    sql: ${TABLE}.node_type ;;
  }

  dimension_group: update {
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
    sql: ${TABLE}.update_time ;;
  }

  dimension: user_id {
    type: number
    sql: ${TABLE}.user_id ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
