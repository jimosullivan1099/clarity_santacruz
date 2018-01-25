view: client_service_accounts {
  sql_table_name: client_service_accounts ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: account_type {
    type: yesno
    sql: ${TABLE}.account_type ;;
  }

  dimension: ref_account {
    type: number
    sql: ${TABLE}.ref_account ;;
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
