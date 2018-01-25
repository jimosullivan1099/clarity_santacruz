view: import_file_service_items {
  sql_table_name: clarity_nevada.import_file_service_items ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: external_id {
    type: string
    sql: ${TABLE}.external_id ;;
  }

  dimension: external_name {
    type: string
    sql: ${TABLE}.external_name ;;
  }

  dimension: external_organization_id {
    type: string
    sql: ${TABLE}.external_organization_id ;;
  }

  dimension: external_project_id {
    type: string
    sql: ${TABLE}.external_project_id ;;
  }

  dimension: external_record_type {
    type: number
    sql: ${TABLE}.external_record_type ;;
  }

  dimension: external_sub_type_provided {
    type: string
    sql: ${TABLE}.external_sub_type_provided ;;
  }

  dimension: external_type_provided {
    type: number
    sql: ${TABLE}.external_type_provided ;;
  }

  dimension: ref_file {
    type: number
    sql: ${TABLE}.ref_file ;;
  }

  dimension: ref_source {
    type: number
    sql: ${TABLE}.ref_source ;;
  }

  measure: count {
    type: count
    drill_fields: [id, external_name]
  }
}
