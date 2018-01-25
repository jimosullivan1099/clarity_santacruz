view: service_time_tracking {
  sql_table_name: client_service_time_tracking
    ;;

  dimension: id {
    primary_key: yes
    hidden: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension_group: added {
    hidden: yes
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.added_date ;;
  }

  dimension_group: last_updated {
    hidden: yes
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.last_updated ;;
  }

  dimension: ref_client_service {
    hidden: yes
    sql: ${TABLE}.ref_client_service ;;
  }

  dimension: ref_date {
    hidden: yes
    type: number
    sql: ${TABLE}.ref_date ;;
  }

  dimension: ref_user_updated {
    hidden: yes
    type: number
    sql: ${TABLE}.ref_user_updated ;;
  }

  dimension: tracking_hour {
    type: number
    sql: ${TABLE}.tracking_hour ;;
  }

  dimension: tracking_minute {
    type: number
    sql: ${TABLE}.tracking_minute ;;
  }

  dimension: tracking_time {
    label: "Total Time in Minutes"
    type: number
    sql: coalesce(${tracking_hour},0) * 60 +  coalesce(${tracking_minute},0) ;;
  }

  measure: total_time_in_hours {
    type: sum
    value_format_name: decimal_2
    sql: ${tracking_time}/60 ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
