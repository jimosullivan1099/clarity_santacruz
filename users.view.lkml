view: users {
  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: activation_code {
    sql: ${TABLE}.activation_code ;;
  }

  dimension_group: added {
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.added_date ;;
  }

  dimension: attempts {
    type: number
    sql: ${TABLE}.attempts ;;
  }

  dimension_group: date {
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.date ;;
  }

  dimension: deleted {
    type: yesno
    sql: ${TABLE}.deleted ;;
  }

  dimension: email {
    sql: ${TABLE}.email ;;
  }

  dimension_group: last_updated {
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.last_updated ;;
  }

  dimension_group: last_visited {
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.last_visited_date ;;
  }

  dimension_group: locked_since {
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.locked_since ;;
  }

  dimension: name {
    sql: ${TABLE}.name ;;
  }

  dimension: password {
    sql: ${TABLE}.password ;;
  }

  dimension: ref_user_group {
    type: number
    sql: ${TABLE}.ref_user_group ;;
  }

  dimension: ref_user_status {
    type: number
    sql: ${TABLE}.ref_user_status ;;
  }

  dimension: user_status {
    case: {
      when: {
        sql: ${ref_user_status} = 1 ;;
        label: "Active"
      }

      when: {
        sql: ${ref_user_status} = 2 ;;
        label: "Inactive"
      }

      when: {
        sql: ${ref_user_status} = 3 ;;
        label: "Locked"
      }
    }
  }

  dimension: ref_user_updated {
    type: number
    sql: ${TABLE}.ref_user_updated ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      id,
      name,
      rpt_apr_list.count,
      rpt_apr_oct2014_list.count,
      rpt_apr_oct2014_report.count,
      rpt_apr_report.count,
      rpt_caper_list.count,
      rpt_clienthistorical_report.count,
      rpt_empedu_report.count,
      rpt_gaps_analysis.count,
      rpt_outcomes.count,
      rpt_performance_measures.count,
      rpt_qpr_list.count,
      rpt_qpr_report.count,
      rpt_writing_temporary_table_common.count,
      _auth_assignment.count
    ]
  }
}
