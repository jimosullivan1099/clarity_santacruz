view: client_program_staff {
  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: private {
    type: yesno
    sql: ${TABLE}.private ;;
  }

  dimension: ref_client_program {
    type: number
    sql: ${TABLE}.ref_client_program ;;
  }

  dimension: ref_user {
    type: number
    sql: ${TABLE}.ref_user ;;
  }

  dimension: warning_days {
    type: number
    sql: ${TABLE}.warning_days ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
