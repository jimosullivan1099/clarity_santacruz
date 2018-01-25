view: import_enrollment_map {
  sql_table_name:import_enrollment_map ;;
  view_label: "Enrollment_Mapping"

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

  dimension: ref_enrollment {
    label: "Enrollment Id"
    type: number
    value_format_name: id
    sql: ${TABLE}.ref_enrollment ;;
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
    drill_fields: [id, ref_enrollment, external_id]
  }
}
