view: client_services {
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

  dimension_group: end {
    type: time
    timeframes: [date, week, month]
    convert_tz: no
    sql: ${TABLE}.end_date ;;
  }

  #   - dimension: expamount
  #     type: number
  #     sql: ${TABLE}.expamount
  #

  dimension_group: updated {
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.last_updated ;;
  }

  #dimension: private
  #     type: yesno
  #     sql: ${TABLE}.private
  #
  dimension: ref_agency {
    hidden: yes
    type: number
    sql: ${TABLE}.ref_agency ;;
  }

  dimension: ref_client {
    hidden: yes
    type: number
    sql: ${TABLE}.ref_client ;;
  }

  #   - dimension: ref_department
  #     type: number
  #     sql: ${TABLE}.ref_department

  dimension: ref_service_item {
    hidden: yes
    type: number
    sql: ${TABLE}.ref_service_item ;;
  }

  dimension: deleted {
    hidden: yes
    type: number
    sql: ${TABLE}.deleted ;;
  }

  dimension: ref_user {
    label: "User Creating"
    sql: fn_getUserNameById(${TABLE}.ref_user) ;;
  }

  dimension: ref_user_updated {
    label: "User Updating"
    sql: fn_getUserNameById(${TABLE}.ref_user_updated) ;;
  }

  dimension_group: start {
    type: time
    timeframes: [date, week, month]
    convert_tz: no
    sql: ${TABLE}.start_date ;;
  }

  dimension: days_of_longterm_service {
    label: "Days of Service (long term)"
    bypass_suggest_restrictions: yes
    #X# Invalid LookML inside "dimension": {"suggest_dimension":null}
    type: number
    sql: DATEDIFF(COALESCE(${end_date},NOW()),${start_date}) ;;
  }


  dimension: account_option {
    label: "Vendor Account Option"
    sql: ${services.account_option} ;;

  }


  measure: count {
    type: count
  }
}
