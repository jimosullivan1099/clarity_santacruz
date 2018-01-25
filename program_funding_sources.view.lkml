view: program_funding_sources {
  sql_table_name: program_funding_sources ;;

  dimension: id {
    primary_key: yes
    hidden: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension_group: added {
    hidden: yes
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.added_date ;;
  }

  dimension_group: end {
    description: "Grant End Date (HMIS Data Element 2.6.4)"
    type: time
    timeframes: [date, week, month]
    convert_tz: no
    sql: ${TABLE}.end_date ;;
  }

  dimension: funding_source {
    description: "Federal Partner Program and Components (HMIS Data Element 2.6.1)"
    sql: fn_getPicklistValueName('funding_source',${TABLE}.funding_source) ;;
  }

  dimension: non_federal_funding_source {
    description: "Non-Federal Funding Source"
    sql: fn_getPicklistValueName('funding_source_non_federal',${TABLE}.funding_source_non_federal) ;;
  }

  dimension: identifier {
    description: "Grant Identifier (HMIS Data Element 2.6.2)"
    type: string
    sql: ${TABLE}.identifier ;;
  }

  dimension: amount {
    description: "Funding Source Amount in Dollars"
    type: number
    sql: ${TABLE}.amount ;;
  }

  dimension_group: last_updated {
    hidden: yes
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.last_updated ;;
  }

  dimension: ref_program {
    hidden: yes
    type: number
    sql: ${TABLE}.ref_program ;;
  }

  dimension: ref_user {
    label: "User Creating"
    description: "User created the program funding source"
    sql: fn_getUserNameById(${TABLE}.ref_user) ;;
  }

  dimension: ref_user_updated {
    label: "User Updating"
    description: "User last updated the program funding source"
    sql: fn_getUserNameById(${TABLE}.ref_user_updated) ;;
  }

  dimension_group: start {
    description: "Grant Start Date (HMIS Data Element 2.6.3)"
    type: time
    timeframes: [date, week, month]
    convert_tz: no
    sql: ${TABLE}.start_date ;;
  }

  measure: count {
    description: "Count of program funding sources (Count program funding source ID)"
    type: count
    drill_fields: [id]
  }
}
