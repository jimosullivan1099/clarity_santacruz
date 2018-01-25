view: counties {
  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: code {
    type: number
    sql: ${TABLE}.code ;;
  }

  dimension_group: last_updated {
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.last_updated ;;
  }

  dimension: name {
    sql: ${TABLE}.name ;;
  }

  dimension: ref_state {
    label: "StateID"
    type: number
    sql: ${TABLE}.ref_state ;;
  }

  measure: count {
    type: count
    drill_fields: [id, name]
  }
}
