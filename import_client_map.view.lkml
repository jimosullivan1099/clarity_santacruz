view: import_client_map {
  sql_table_name: import_client_map ;;
   view_label: "Client_Mapping"
  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: external_id {
    type: string
    sql: ${TABLE}.external_id ;;
  }

  dimension: import_id {
    hidden: yes
    type: number
    sql: ${TABLE}.import_id ;;
  }

  dimension: ref_client {
    label: "Client Id"
    type: number
    value_format_name: id
    sql: ${TABLE}.ref_client ;;
  }

  dimension: ref_file {
    hidden: yes
    type: number
    sql: ${TABLE}.ref_file ;;
  }

  dimension: ref_source {
    hidden:  yes
    type: number
    sql: ${TABLE}.ref_source ;;
  }

  measure: count {
    type: count
    drill_fields: [id, ref_client, external_id]
  }
}
