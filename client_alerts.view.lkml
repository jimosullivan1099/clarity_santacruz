view: client_alerts {
  sql_table_name: client_alerts ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension_group: added {
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

  dimension: deleted {
    hidden: yes
    type: yesno
    sql: ${TABLE}.deleted ;;
  }

  dimension_group: expiration {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.expiration_date ;;
  }

  dimension_group: last_updated {
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

  dimension: note {
    type: string
    sql: replace(replace(${TABLE}.note,'<p>',''),'</p>','') ;;
  }

  dimension: private {
    hidden: yes
    type: yesno
    sql: ${TABLE}.private ;;
  }

  dimension: ref_agency {
    hidden: yes
    type: number
    sql: ${TABLE}.ref_agency ;;
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

  dimension: ref_user {
    type: number
    label: "User - Created"
    sql: fn_getUserNameById(${TABLE}.ref_user) ;;
  }

  dimension: ref_user_updated {
    type: number
    label: "User - Updated"
    sql: fn_getUserNameById(${TABLE}.ref_user_updated) ;;
  }

  dimension: title {
    type: string
    sql: ${TABLE}.title ;;
  }

  measure: count {
    hidden: yes
    type: count
    drill_fields: [id]
  }
}
