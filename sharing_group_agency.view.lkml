view: sharing_group_agency {
  sql_table_name: sharing_group_agency ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension_group: added {
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.added_date ;;
  }

  dimension: clients {
    type: yesno
    sql: ${TABLE}.clients ;;
  }

  dimension: files {
    type: yesno
    sql: ${TABLE}.files ;;
  }

  dimension_group: last_updated {
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.last_updated ;;
  }

  dimension: location {
    type: yesno
    sql: ${TABLE}.location ;;
  }

  dimension: messages {
    type: yesno
    sql: ${TABLE}.messages ;;
  }

  dimension: ref_agency {
    type: number
    sql: ${TABLE}.ref_agency ;;
  }

  dimension: ref_sharing_group {
    type: number
    sql: ${TABLE}.ref_sharing_group ;;
  }

  dimension: ref_user_updated {
    type: number
    sql: ${TABLE}.ref_user_updated ;;
  }

  dimension: services {
    type: yesno
    sql: ${TABLE}.services ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
