view: import_program_mapping {

  derived_table: {
    sql: SELECT ref_program as program_id, pm.external_id,  fp.ref_file as import_id, external_name as external_program_name FROM clarity_sanmateo.import_program_map  pm INNER JOIN import_file_programs fp ON
      pm.external_id = fp.external_id;
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: program_id {
    type: number
    sql: ${TABLE}.program_id ;;
  }

  dimension: external_id {
    type: string
    sql: ${TABLE}.external_id ;;
  }

  dimension: import_id {
    type: number
    sql: ${TABLE}.import_id ;;
  }

  dimension: external_program_name {
    type: string
    sql: ${TABLE}.external_program_name ;;
  }

  set: detail {
    fields: [program_id, external_id, import_id, external_program_name]
  }
}
