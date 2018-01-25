view: client_service_programs {
  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: ref_agency {
    type: number
    sql: ${TABLE}.ref_agency ;;
  }

  dimension: ref_client_program {
    type: number
    sql: ${TABLE}.ref_client_program ;;
  }

  dimension: ref_client_service {
    type: number
    sql: ${TABLE}.ref_client_service ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
