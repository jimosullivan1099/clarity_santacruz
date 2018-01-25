view: import_file_service_id_to_item_map {
  sql_table_name: clarity_nevada.import_file_service_id_to_item_map ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: ref_file {
    type: number
    sql: ${TABLE}.ref_file ;;
  }

  dimension: ref_service_id {
    type: string
    sql: ${TABLE}.ref_service_id ;;
  }

  dimension: ref_service_item_id {
    type: string
    sql: ${TABLE}.ref_service_item_id ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
