view: score_ranges {
  sql_table_name: score_ranges ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: end {
    type: number
    sql: ${TABLE}.end ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: score_type {
    type: string
    sql: ${TABLE}.score_type ;;
  }

  dimension: start {
    type: number
    sql: ${TABLE}.start ;;
  }

  measure: count {
    type: count
    drill_fields: [id, name]
  }
}
