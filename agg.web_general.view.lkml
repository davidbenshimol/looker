view: agg_web_general {
  sql_table_name: agg.web_general ;;

#  dimension: dt {
#    primary_key: yes
#    type: date
#    sql: ${}${TABLE}.dt ;;
#  }
 dimension: Prev_Day {
   type: date
  sql:  ${TABLE}.dt -1;;
 }


  dimension: period {
    type: string
    sql: ${TABLE}.period ;;
  }

  dimension:is_last_day_of_month {

    type: yesno
    sql: EXTRACT( day from DATEADD(day,1,${dt_date})+1 ) = 1 ;;
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
