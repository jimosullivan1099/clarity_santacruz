view: department_program {
  sql_table_name: department_program ;;

  dimension: id {
    hidden: yes
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension_group: added {
    hidden: yes
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.added_date ;;
  }

  dimension_group: last_updated {
    hidden: yes
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.last_updated ;;
  }

  dimension: ref_department {
    hidden: yes
    type: number
    sql: ${TABLE}.ref_department ;;
  }

  dimension: name {
    label: "Program Department Name"
    type: string
    sql: (select name from department where id = ${TABLE}.ref_department) ;;
  }

  dimension: ref_program {
    hidden: yes
    type: number
    sql: ${TABLE}.ref_program ;;
  }

  dimension: ref_user_updated {
    hidden: yes
    type: number
    sql: ${TABLE}.ref_user_updated ;;
  }

  measure: count {
    label: "Program Department Count"
    type: count
    drill_fields: [id]
  }
}
