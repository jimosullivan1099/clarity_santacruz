view: referral_history {
  sql_table_name: referral_history ;;

  dimension: id {
    primary_key: yes
    hidden: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: activity_type {
    sql: fn_getPicklistValueName('referral_history_activity_types',${TABLE}.activity_type) ;;
  }

  measure: last_denied_date {
    type: date
    sql: (select MAX(date) from referral_history rh where fn_getPicklistValueName('referral_history_activity_types',rh.activity_type) = 'Program Denial' and rh.ref_referral = ${ref_referral})
      ;;
  }

  measure: last_added_to_queue_date {
    type: date
    sql: (select MAX(date) from referral_history rh where fn_getPicklistValueName('referral_history_activity_types',rh.activity_type) = 'Added to Queue' and rh.ref_referral = ${ref_referral})
      ;;
  }

  measure: last_program_referral_date {
    type: date
    sql: (select MAX(date) from referral_history rh where fn_getPicklistValueName('referral_history_activity_types',rh.activity_type) = 'Program Referral' and rh.ref_referral = ${ref_referral})
      ;;
  }

  measure: last_in_process_date {
    type: date
    sql: (select MAX(date) from referral_history rh where fn_getPicklistValueName('referral_history_activity_types',rh.activity_type) = 'In-Process' and rh.ref_referral = ${ref_referral})
      ;;
  }

  measure: last_reassigned_date {
    type: date
    sql: (select MAX(date) from referral_history rh where fn_getPicklistValueName('referral_history_activity_types',rh.activity_type) = 'Re-assigned to Queue' and rh.ref_referral = ${ref_referral})
      ;;
  }

  dimension_group: date {
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.date ;;
  }

  dimension: in_progress {
    type: yesno
    sql: ${TABLE}.in_progress ;;
  }

  dimension: ref_original {
    type: number
    sql: ${TABLE}.ref_original ;;
  }

  dimension: ref_program {
    hidden: yes
    type: number
    sql: ${TABLE}.ref_program ;;
  }

  dimension: ref_referral {
    hidden: yes
    type: number
    sql: ${TABLE}.ref_referral ;;
  }

  dimension: user {
    sql: fn_getUserNameById(${TABLE}.ref_user) ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
