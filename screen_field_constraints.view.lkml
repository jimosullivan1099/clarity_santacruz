view: screen_field_constraints {
  sql_table_name: screen_field_constraints ;;

  dimension: id {
    primary_key: yes
    hidden: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: condition {
    case: {
      when: {sql: ${TABLE}.condition = 1 ;;
        label: "Equals"}
      when: {sql: ${TABLE}.condition = 2 ;;
        label: "Not Equals"}
      when: {sql: ${TABLE}.condition = 3 ;;
        label: "Greater Than"}
      when: {sql: ${TABLE}.condition = 4 ;;
        label: "Less Than"}
      else: ""
      }}

  dimension: external_id {
    hidden: yes
    type: string
    sql: ${TABLE}.external_id ;;
  }

  dimension: operation {
    hidden: yes
    type: yesno
    sql: ${TABLE}.operation ;;
  }

  dimension: ref_field {
    hidden: yes
    type: number
    sql: ${TABLE}.ref_field ;;
  }

  dimension: ref_field_condition {
    type: string
    sql: ${TABLE}.ref_field_condition ;;
  }

dimension: depends_on_field_name {
  type:  string

 sql: ${screen_field_dependent_on.display_name} ;;

}

  dimension: ref_prev_field {
   hidden:  yes
   type: number
    sql: ${TABLE}.ref_prev_field ;;
  }

  dimension: value {
    type: string
    sql: ${TABLE}.value ;;
  }

  measure: count {
    hidden: yes
    type: count
    drill_fields: [id]
  }
}
