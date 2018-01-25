view: client_service_notes {
  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: notes {
    sql: fn_getSkipAllContentTags(${TABLE}.notes) ;;
  }

  dimension: ref_client_service {
    type: number
    sql: ${TABLE}.ref_client_service ;;
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
