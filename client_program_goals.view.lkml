view: client_program_goals {
  sql_table_name: client_program_goals ;;

  dimension: id {
    hidden: yes
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension_group: date {
    label: "Date Achieved"
    type: time
    timeframes: [date, week, month]
    convert_tz: no
    sql: ${TABLE}.date ;;
  }

  dimension: ref_agency {
    hidden: yes
    type: number
    sql: ${TABLE}.ref_agency ;;
  }

  dimension: ref_client_program {
    hidden: yes
    type: number
    sql: ${TABLE}.ref_client_program ;;
  }

  dimension: ref_goal {
    hidden: yes
    type: number
    sql: ${TABLE}.ref_goal ;;
  }

  dimension: status {
    case: {
      when: {
        sql: ${TABLE}.status = 1 ;;
        label: "Achieved"
      }

      when: {
        sql: ${TABLE}.status = 0 ;;
        label: "Not Achieved"
      }
    }
  }

  dimension: goal_name {
    sql: ${goals.name} ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
