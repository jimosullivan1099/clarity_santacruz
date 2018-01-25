view: screens {
  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: eligibility_engine {
    type: yesno
    sql: ${TABLE}.eligibility_engine ;;
  }

  dimension: external_id {
    sql: ${TABLE}.external_id ;;
  }

  dimension_group: last_update {
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.last_update ;;
  }

  dimension: name {
    sql: ${TABLE}.name ;;
  }

  dimension_group: publish {
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.publish_date ;;
  }

  dimension: published {
    type: yesno
    sql: ${TABLE}.published ;;
  }

  dimension: ref_agency {
    type: number
    sql: ${TABLE}.ref_agency ;;
  }

  dimension: ref_processor {
    type: number
    sql: ${TABLE}.ref_processor ;;
  }

  dimension: ref_user {
    type: number
    sql: ${TABLE}.ref_user ;;
  }

  dimension: status {
    type: yesno
    sql: ${TABLE}.status ;;
  }

  dimension: type {
    type: number
    #sql: ${TABLE}.type ;;
    sql: fn_getPicklistValueName('screen_types',${TABLE}.type) ;;
  }


  measure: count {
    type: count
    drill_fields: [id, name]
  }
}
