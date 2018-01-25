view: client_addresses {
  dimension: id {
    primary_key: yes
    hidden: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension_group: added {
    type: time
    hidden: yes
    timeframes: [time, date, week, month]
    sql: ${TABLE}.added_date ;;
  }

  dimension: address1 {
    sql: ${TABLE}.address1 ;;
  }

  dimension: address2 {
    sql: ${TABLE}.address2 ;;
  }

  dimension: city {
    sql: ${TABLE}.city ;;
  }

  dimension: email {
    sql: ${TABLE}.email ;;
  }

  dimension_group: last_updated {
    hidden: yes
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.last_updated ;;
  }

  dimension: name {
    sql: ${TABLE}.name ;;
  }

  dimension: phone1 {
    sql: ${TABLE}.phone1 ;;
  }

  dimension: phone2 {
    sql: ${TABLE}.phone2 ;;
  }

  dimension: private {
    type: yesno
    sql: ${TABLE}.private ;;
  }

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

  dimension: ref_type {
    label: "Address Type"
    sql: fn_getPicklistValueName('address_types',${TABLE}.ref_type) ;;
  }

  dimension: ref_user {
    hidden: yes
    type: number
    sql: ${TABLE}.ref_user ;;
  }

  dimension: deleted {
    hidden: yes
    type: number
    sql: ${TABLE}.deleted ;;
  }

  dimension: ref_user_updated {
    hidden: yes
    type: number
    sql: ${TABLE}.ref_user_updated ;;
  }

  dimension: state {
    sql: ${TABLE}.state ;;
  }

  dimension: status {
    type: yesno
    sql: ${TABLE}.status ;;
  }

  dimension: zipcode {
    type: zipcode
    sql: ${TABLE}.zipcode ;;
  }

  dimension: location {
    type: location
    sql_latitude: ${TABLE}.latitude ;;
    sql_longitude: ${TABLE}.longitude ;;
  }

  dimension: latitude {
    type: string
    sql_latitude: ${TABLE}.latitude ;;
  }

  dimension: longitude {
    type: string
    sql_longitude: ${TABLE}.longitude ;;
  }

  measure: count {
    type: count
    drill_fields: [id, name]
  }
}
