view: last_custom {
  sql_table_name: client_program_custom
    ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }



  dimension: ref_client_program_demographics {
    hidden: yes
    type: number
    sql: ${TABLE}.ref_client_program_demographics ;;
  }


  measure: count {
    type: count

  }

set: last_custom_fields {
  fields: [id]
}
}
