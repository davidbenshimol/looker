view: monthly_unique_web_users {
  derived_table: {
    sql: -- raw sql results do not include filled-in values for 'agg_web_general.dt_month'


      SELECT
        TO_CHAR(DATE_TRUNC('month', agg_web_general.dt )-1, 'YYYY-MM') AS "agg_web_general.dt_month",
        COALESCE(SUM(CASE WHEN (agg_web_general.period = 'month') THEN agg_web_general.unique_visitors  ELSE NULL END), 0) AS "agg_web_general.unique_visitors"
      FROM agg.web_general  AS agg_web_general

      WHERE ((((agg_web_general.dt ) >= ((DATE(DATEADD(month,-11, DATE_TRUNC('month', DATE_TRUNC('day',CONVERT_TIMEZONE('Asia/Tel_Aviv', 'Europe/London', GETDATE()))) )))) AND (agg_web_general.dt ) < ((DATE(DATEADD(month,12, DATEADD(month,-11, DATE_TRUNC('month', DATE_TRUNC('day',CONVERT_TIMEZONE('Asia/Tel_Aviv', 'Europe/London', GETDATE()))) ) ))))))) AND (EXTRACT(DAY FROM CONVERT_TIMEZONE('Asia/Tel_Aviv', 'Europe/London', (DATE(agg_web_general.dt )))) = 1)
      GROUP BY DATE_TRUNC('month', agg_web_general.dt )
      ORDER BY 1
      LIMIT 50
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: agg_web_general_dt_month {
    type: string
    sql: ${TABLE}."agg_web_general.dt_month" ;;
  }

  dimension: agg_web_general_unique_visitors {
    type: number
    sql: ${TABLE}."agg_web_general.unique_visitors" ;;
  }

  set: detail {
    fields: [agg_web_general_dt_month, agg_web_general_unique_visitors]
  }
}
