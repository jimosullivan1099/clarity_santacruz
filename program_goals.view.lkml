view: program_goals {
  sql_table_name: program_goals ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: ref_goal {
    type: number
    sql: ${TABLE}.ref_goal ;;
  }

  dimension: ref_program {
    type: number
    sql: ${TABLE}.ref_program ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
