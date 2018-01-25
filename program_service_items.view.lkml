view: program_service_items {
  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: count_days {
    type: number
    sql: ${TABLE}.count_days ;;
  }

  dimension: ref_program {
    type: number
    sql: ${TABLE}.ref_program ;;
  }

  dimension: ref_service_item {
    type: number
    sql: ${TABLE}.ref_service_item ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
