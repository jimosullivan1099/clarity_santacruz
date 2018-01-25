view: member_activity_logs {
  label: "Staff Activity Logs"
  sql_table_name: _logs ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension_group: date_in {
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.date_in ;;
  }

  dimension_group: date_out {
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.date_out ;;
  }

  dimension: error {
    hidden: yes
    type: string
    sql: ${TABLE}.error ;;
  }

  dimension: host {
    hidden: yes
    type: string
    sql: ${TABLE}.host ;;
  }

  dimension: ip {
    hidden: yes
    type: string
    sql: ${TABLE}.ip ;;
  }

  dimension: msg {
    hidden: yes
    type: string
    sql: ${TABLE}.msg ;;
  }

  dimension: ref_user {
    hidden: yes
    type: number
    sql: ${TABLE}.ref_user ;;
  }

  dimension: sid {
    hidden: yes
    type: string
    sql: ${TABLE}.sid ;;
  }

  dimension: type {
    hidden: yes
    type: string
    sql: ${TABLE}.type ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
