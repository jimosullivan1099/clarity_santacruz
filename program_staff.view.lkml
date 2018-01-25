view: program_staff {
  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: ref_program {
    hidden: yes
    type: number
    sql: ${TABLE}.ref_program ;;
  }

  dimension: ref_user {
    hidden: yes
    type: number
    sql: ${TABLE}.ref_user ;;
  }

  dimension: program_user {
    label: "Responsible Staff"
    type: string
    sql: fn_getUserNameById(${TABLE}.ref_user) ;;
  }

  measure: count {
    hidden: yes
    type: count
    drill_fields: [id]
  }

  dimension: departments {
    label: "Department"
    type: number
    sql: ${TABLE}.departments ;;
  }
}
