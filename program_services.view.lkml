view: program_services {
  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: ref_program {
    type: number
    sql: ${TABLE}.ref_program ;;
  }

  dimension: ref_service {
    type: number
    sql: ${TABLE}.ref_service ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
