view: import_program_map {
  sql_table_name: clarity_nevada.import_program_map ;;

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
    type: number
    sql: ${TABLE}.import_id ;;
  }

  dimension: ref_file {
    type: number
    sql: ${TABLE}.ref_file ;;
  }

  dimension: ref_program {
    type: number
    sql: ${TABLE}.ref_program ;;
  }

  dimension: ref_source {
    type: number
    sql: ${TABLE}.ref_source ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
