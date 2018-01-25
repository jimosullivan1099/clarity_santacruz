view: program_inventory_history {
  sql_table_name: program_inventory_history ;;

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

  dimension: availability {
    type: number
    sql: ${TABLE}.availability ;;
  }

  dimension: bed_inventory {
    type: number
    sql: ${TABLE}.bed_inventory ;;
  }

  dimension: between_18_24 {
    type: number
    sql: ${TABLE}.between_18_24 ;;
  }

  dimension: chronic_inventory {
    type: number
    sql: ${TABLE}.chronic_inventory ;;
  }

  dimension: coc {
    type: string
    sql: ${TABLE}.coc ;;
  }

  dimension: deleted {
    type: yesno
    sql: ${TABLE}.deleted ;;
  }

  dimension_group: end {
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
    sql: ${TABLE}.end_date ;;
  }

  dimension_group: information {
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
    sql: ${TABLE}.information_date ;;
  }

  dimension: is_between_18_24 {
    type: yesno
    sql: ${TABLE}.is_between_18_24 ;;
  }

  dimension: is_chronic {
    type: yesno
    sql: ${TABLE}.is_chronic ;;
  }

  dimension: is_hmis_participating {
    type: yesno
    sql: ${TABLE}.is_hmis_participating ;;
  }

  dimension: is_under_18 {
    type: yesno
    sql: ${TABLE}.is_under_18 ;;
  }

  dimension: is_under_24 {
    type: yesno
    sql: ${TABLE}.is_under_24 ;;
  }

  dimension: is_veteran {
    type: yesno
    sql: ${TABLE}.is_veteran ;;
  }

  dimension: is_youth {
    type: yesno
    sql: ${TABLE}.is_youth ;;
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

  dimension: participating_beds {
    type: number
    sql: ${TABLE}.participating_beds ;;
  }

  dimension: ref_agency_deleted {
    type: number
    sql: ${TABLE}.ref_agency_deleted ;;
  }

  dimension: ref_bed_type {
    type: number
    sql: ${TABLE}.ref_bed_type ;;
  }

  dimension: ref_household_type {
    type: number
    sql: ${TABLE}.ref_household_type ;;
  }

  dimension: ref_program_inventory {
    type: number
    sql: ${TABLE}.ref_program_inventory ;;
  }

  dimension: ref_user_updated {
    type: number
    sql: ${TABLE}.ref_user_updated ;;
  }

  dimension_group: start {
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
    sql: ${TABLE}.start_date ;;
  }

  dimension: under_18 {
    type: number
    sql: ${TABLE}.under_18 ;;
  }

  dimension: under_24 {
    type: number
    sql: ${TABLE}.under_24 ;;
  }

  dimension: unit_inventory {
    type: number
    sql: ${TABLE}.unit_inventory ;;
  }

  dimension: veteran_inventory {
    type: number
    sql: ${TABLE}.veteran_inventory ;;
  }

  dimension: youth_inventory {
    type: number
    sql: ${TABLE}.youth_inventory ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
