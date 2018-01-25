view: service_items {
  dimension: id {
    hidden: yes
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  #   - dimension_group: added
  #     type: time
  #     timeframes: [time, date, week, month]
  #     sql: ${TABLE}.added_date

  #   - dimension: adjustable
  #     type: yesno
  #     sql: ${TABLE}.adjustable
  #
  #   - dimension: allow_groups
  #     type: yesno
  #     sql: ${TABLE}.allow_groups
  #
  #   - dimension: charge_attendance
  #     type:number
  #     sql: ${TABLE}.charge_attendance
  #
  #   - dimension: default_amount
  #     type: number
  #     sql: ${TABLE}.default_amount
  #
  dimension: end_availability {
    sql: ${TABLE}.end_availability ;;
  }

  #
  #   - dimension: expense_type
  #     type: yesno
  #     sql: ${TABLE}.expense_type
  #
  #   - dimension: geocode
  #     sql: ${TABLE}.geocode
  #
  #   - dimension: is_employment
  #     type: yesno
  #     sql: ${TABLE}.is_employment
  #
  #   - dimension: is_service
  #     type: yesno
  #     sql: ${TABLE}.is_service
  #
  #   - dimension_group: last_updated
  #     type: time
  #     timeframes: [time, date, week, month]
  #     sql: ${TABLE}.last_updated
  #
  dimension: name {
    bypass_suggest_restrictions: yes
    sql: ${TABLE}.name ;;
  }

  #
  #   - dimension: program_option
  #     type: yesno
  #     sql: ${TABLE}.program_option
  #
  #   - dimension: ref_charge_type
  #     type:number
  #     sql: ${TABLE}.ref_charge_type
  #
  dimension: ref_delivery_type {
    type: number
    sql: ${TABLE}.ref_delivery_type ;;
  }

  dimension: deleted {
    type: yesno
    sql: ${TABLE}.deleted ;;
  }

  #   - dimension: ref_funding
  #     type:number
  #     sql: ${TABLE}.ref_funding

  dimension: ref_service {
    hidden: yes
    type: number
    sql: ${TABLE}.ref_service ;;
  }

  #   - dimension: ref_user_updated
  #     type:number
  #     sql: ${TABLE}.ref_user_updated

  #   - dimension: si_cat1
  #     type:number
  #     sql: ${TABLE}.si_cat1
  #
  #   - dimension: si_cat2
  #     type:number
  #     sql: ${TABLE}.si_cat2
  #
  #   - dimension: si_cat3
  #     type:number
  #     sql: ${TABLE}.si_cat3

  dimension: start_availability {
    sql: ${TABLE}.start_availability ;;
  }
}
