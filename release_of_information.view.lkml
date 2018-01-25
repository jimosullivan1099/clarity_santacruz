view: release_of_information {
  dimension: id {
    hidden: yes
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension_group: added {
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.added_date ;;
  }

  dimension: deleted {
    hidden: yes
    type: yesno
    sql: ${TABLE}.deleted ;;
  }

  dimension: documentation {
    sql: fn_getPicklistValueName('documentation',${TABLE}.documentation) ;;
  }

  dimension_group: end {
    type: time
    timeframes: [date, week, month]
    convert_tz: no
    sql: ${TABLE}.end_date ;;
  }

  dimension_group: last_updated {
    hidden: yes
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.last_updated ;;
  }

  dimension: location {
    sql: ${TABLE}.location ;;
  }

  dimension: permission {
    type: number
    sql: ${TABLE}.permission ;;
  }

  dimension: ref_agency {
    hidden: yes
    type: number
    sql: ${TABLE}.ref_agency ;;
  }

  dimension: agency {
    sql: ${roi_agencies.name} ;;
  }

  dimension: ref_agency_deleted {
    hidden: yes
    type: number
    sql: ${TABLE}.ref_agency_deleted ;;
  }

  dimension: ref_client {
    hidden: yes
    type: number
    sql: ${TABLE}.ref_client ;;
  }

  dimension: ref_file {
    hidden: yes
    type: number
    sql: ${TABLE}.ref_file ;;
  }

  dimension: ref_user {
    label: "User Creating"
    type: number
    sql: ${TABLE}.ref_user ;;
  }

  dimension: ref_user_updated {
    label: "User Updating"
    type: number
    sql: ${TABLE}.ref_user_updated ;;
  }

  dimension_group: start {
    type: time
    timeframes: [date, week, month]
    convert_tz: no
    sql: ${TABLE}.start_date ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
