view: import_file_programs {
  sql_table_name: import_file_programs ;;

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
