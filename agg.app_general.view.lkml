view: agg_app_general {
  sql_table_name: agg.app_general ;;

#  dimension: dt {
#    primary_key: yes
#    type: date
#    sql: ${}${TABLE}.dt ;;
#  }

  dimension: period {
    type: string
    sql: ${TABLE}.period ;;
  }

  measure: unique_visitors {
    description: "Sum Unique App Visitors"
    type: sum
    sql: ${TABLE}.readers ;;
  }

  dimension_group: dt {
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
    datatype: date
    sql: ${TABLE}.dt ;;
  }
}
