view: client_groups {
  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension_group: date_created {
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.date_created ;;
  }

  dimension: ref_client {
    type: number
    sql: ${TABLE}.ref_client ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
