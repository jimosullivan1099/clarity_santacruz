view: referral_notes {
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

  dimension: deleted {
    type: number
    sql: ${TABLE}.deleted ;;
  }

  dimension_group: last_updated {
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.last_updated ;;
  }

  dimension: ref_agency_deleted {
    type: number
    sql: ${TABLE}.ref_agency_deleted ;;
  }

  dimension: ref_message {
    type: number
    sql: ${TABLE}.ref_message ;;
  }

  dimension: ref_referral {
    type: number
    sql: ${TABLE}.ref_referral ;;
  }

  dimension: ref_user {
    type: number
    sql: ${TABLE}.ref_user ;;
  }

  dimension: ref_user_updated {
    type: number
    sql: ${TABLE}.ref_user_updated ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
