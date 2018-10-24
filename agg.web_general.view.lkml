view: agg_web_general {
  sql_table_name: agg.web_general ;;

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
    description: "Sum Unique Visitors"
    type: sum
    filters: {
      field: period
      value: "month"

    }
    sql: ${TABLE}.unique_visitors ;;
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
