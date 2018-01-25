view: referral_connections {
  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: ref_client_program {
    type: number
    sql: ${TABLE}.ref_client_program ;;
  }

  dimension: ref_referral {
    type: number
    sql: ${TABLE}.ref_referral ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
