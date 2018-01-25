view: program_sites {
  sql_table_name: program_sites ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: is_primary {
    description: "Principal Site (HMIS Data Element 2.8.1)"
    type: yesno
    sql: ${TABLE}.is_primary ;;
  }

  dimension: ref_program {
    type: number
    sql: ${TABLE}.ref_program ;;
  }

  dimension: ref_site {
    type: number
    sql: ${TABLE}.ref_site ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
