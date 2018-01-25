view: service_dates {
  label: "Service Attendance Dates"
  sql_table_name: client_service_dates
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

  dimension_group: date {
    type: time
    timeframes: [date, week, month, raw]
    convert_tz: no
    sql: ${TABLE}.date ;;
  }

  dimension_group: last_updated {
    hidden: yes
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.last_updated ;;
  }

  dimension: ref_client_service {
    hidden: yes
    type: number
    sql: ${TABLE}.ref_client_service ;;
  }

  dimension: ref_user {
    hidden: yes
    type: number
    sql: ${TABLE}.ref_user ;;
  }

  dimension: ref_user_updated {
    hidden: yes
    type: number
    sql: ${TABLE}.ref_user_updated ;;
  }

  dimension: time {
    hidden: yes
    sql: ${TABLE}.time ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
