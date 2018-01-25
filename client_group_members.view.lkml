view: client_group_members {
  dimension: id {
    primary_key: yes
    hidden: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension_group: end {
    type: time
    hidden: yes
    timeframes: [date, week, month]
    convert_tz: no
    sql: ${TABLE}.end_date ;;
  }

  dimension: ref_client {
    type: number
    hidden: yes
    sql: ${TABLE}.ref_client ;;
  }

  dimension: ref_group {
    label: "Global Household ID (Profile Household)"
    description: "ID that joins together clients as a household. This is not an HMIS data element"
    type: number
    value_format_name: id
    sql: ${TABLE}.ref_group ;;
  }

  dimension: ref_type {
    hidden: yes
    type: number
    sql: ${TABLE}.ref_type ;;
  }

  dimension_group: start {
    type: time
    timeframes: [date, week, month]
    hidden: yes
    convert_tz: no
    sql: ${TABLE}.start_date ;;
  }

  measure: count {
    label: "Number of Global Household IDs"
    description: "Distinct count of Global Household IDs"
    type: count_distinct
   # drill_fields: [detail*]
    sql: ${TABLE}.ref_group ;;
  }
}
