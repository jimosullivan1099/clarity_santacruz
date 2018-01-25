view: service_items_housing {
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

  dimension: availability {
    type: number
    sql: ${TABLE}.availability ;;
  }

  dimension: beds_with_children {
    type: number
    sql: ${TABLE}.beds_with_children ;;
  }

  dimension: beds_wo_children {
    type: number
    sql: ${TABLE}.beds_wo_children ;;
  }

  dimension: deleted {
    type: number
    sql: ${TABLE}.deleted ;;
  }

  dimension_group: information {
    type: time
    timeframes: [date, week, month]
    convert_tz: no
    sql: ${TABLE}.information_date ;;
  }

  dimension: inventory_type {
    bypass_suggest_restrictions: yes
    sql: fn_getPicklistValueName('inventory_type',${TABLE}.inventory_type) ;;
  }

  dimension_group: last_updated {
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.last_updated ;;
  }

  #   - dimension: program_warning
  #     type:number
  #     sql: ${TABLE}.program_warning
  #
  #   - dimension: ref_agency_deleted
  #     type:number
  #     sql: ${TABLE}.ref_agency_deleted

  dimension: ref_bed_type {
    label: "bed type"
    bypass_suggest_restrictions: yes
    sql: fn_getPicklistValueName('bed_types',${TABLE}.ref_bed_type) ;;
  }

  dimension: ref_household_type {
    label: "household type"
    bypass_suggest_restrictions: yes
    sql: fn_getPicklistValueName('household_types',${TABLE}.ref_household_type) ;;
  }

  dimension: ref_service_item {
    hidden: yes
    type: number
    sql: ${TABLE}.ref_service_item ;;
  }

  dimension: ref_service_type {
    hidden: yes
    type: number
    sql: ${TABLE}.ref_service_type ;;
  }

  #
  dimension: ref_user_updated {
    label: "User Updating"
    sql: fn_getUserNameById(${TABLE}.ref_user_updated) ;;
  }

  #   - dimension: reservation
  #     type:number
  #     sql: ${TABLE}.reservation
  #
  #   - dimension: reservation_term
  #     type:number
  #     sql: ${TABLE}.reservation_term
  #
  #   - dimension: reservation_type
  #     type:number
  #     sql: ${TABLE}.reservation_type

  dimension: units_with_children {
    type: number
    sql: ${TABLE}.units_with_children ;;
  }

  dimension: youth_inventory_type {
    hidden: yes
    type: number
    sql: ${TABLE}.youth_inventory_type ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
