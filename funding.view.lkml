view: funding {
  sql_table_name: funding ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension_group: added {
    hidden: yes
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.added_date ;;
  }

  dimension: amount {
    label: "Fund Amount"
    type: number
    sql: ${TABLE}.amount ;;
    value_format_name: usd
  }

  dimension_group: last_updated {
    hidden: yes
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.last_updated ;;
  }

  dimension: name {
    label: "Fund Name"
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: ref_agency {
    hidden: yes
    type: number
    sql: ${TABLE}.ref_agency ;;
  }

  dimension: ref_funding {
    hidden: yes
    type: number
    sql: ${TABLE}.ref_funding ;;
  }

  dimension: ref_user_updated {
    hidden: yes
    type: number
    sql: ${TABLE}.ref_user_updated ;;
  }

  dimension: status {
    label: "Fund Active"

    case: {
      when: {
        sql: ${TABLE}.status = 1 ;;
        label: "Active"
      }

      when: {
        sql: ${TABLE}.status = 2 ;;
        label: "Inactive"
      }
    }
  }

  measure: count {
    type: count
    drill_fields: [id, name]
  }
}
