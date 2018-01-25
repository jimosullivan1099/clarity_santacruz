view: programs_eligibility_requirements {
  sql_table_name: programs_eligibility_requirements ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: condition {
    type: string
    sql: ${TABLE}.`condition` ;;
  }

  dimension: operation {
    type: string
    sql: ${TABLE}.operation ;;
  }

  dimension: post_bracket {
    type: string
    sql: ${TABLE}.post_bracket ;;
  }

  dimension: pre_bracket {
    type: string
    sql: ${TABLE}.pre_bracket ;;
  }

  dimension: ref_field {
    type: number
    sql: ${TABLE}.ref_field ;;
  }

  dimension: ref_income_type {
    type: number
    sql: ${TABLE}.ref_income_type ;;
  }

  dimension: ref_program {
    type: number
    sql: ${TABLE}.ref_program ;;
  }

  dimension: ref_requirement {
    type: number
    sql: ${TABLE}.ref_requirement ;;
  }

  dimension: sort {
    type: number
    sql: ${TABLE}.sort ;;
  }

  dimension: value {
    type: string
    sql: ${TABLE}.value ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
