view: import_file_analysis_results {
 # sql_table_name: import_file_analysis_results ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: adult_clients_count {
    type: number
    sql: ${TABLE}.adult_clients_count ;;
  }

  dimension: child_clients_count {
    type: number
    sql: ${TABLE}.child_clients_count ;;
  }

  dimension: clients_count {
    type: number
    sql: ${TABLE}.clients_count ;;
  }

  dimension: clients_with_missed_dob_count {
    type: number
    sql: ${TABLE}.clients_with_missed_dob_count ;;
  }

  dimension: program_enrollments_count {
    type: number
    sql: ${TABLE}.program_enrollments_count ;;
  }

  dimension: program_exits_count {
    type: number
    sql: ${TABLE}.program_exits_count ;;
  }

  dimension: program_statuses_count {
    type: number
    sql: ${TABLE}.program_statuses_count ;;
  }

  dimension: programs_count {
    type: number
    sql: ${TABLE}.programs_count ;;
  }

  dimension: ref_file {
    hidden: yes
    type: number
    sql: ${TABLE}.ref_file ;;
  }

  dimension: services_count {
    type: number
    sql: ${TABLE}.services_count ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
