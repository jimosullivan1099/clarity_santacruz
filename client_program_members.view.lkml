view: client_program_members {
  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: ref_client_program {
    type: number
    sql: ${TABLE}.ref_client_program ;;
  }

  dimension: ref_member {
    type: number
    sql: ${TABLE}.ref_member ;;
  }

  dimension: ref_member_program {
    type: number
    sql: ${TABLE}.ref_member_program ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
