view: vendor_files {
  sql_table_name: vendor_files ;;

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

  dimension: custom_file_name {
    type: string
    sql: ${TABLE}.custom_file_name ;;
  }

  dimension: extension {
    type: string
    sql: ${TABLE}.extension ;;
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

  dimension: ref_file_name {
    type: number
    sql: ${TABLE}.ref_file_name ;;
  }

  dimension: ref_type {
    type: number
    sql: ${TABLE}.ref_type ;;
  }

  dimension: ref_user {
    type: number
    sql: ${TABLE}.ref_user ;;
  }

  dimension: ref_user_updated {
    type: number
    sql: ${TABLE}.ref_user_updated ;;
  }

  dimension: ref_vendor {
    type: number
    sql: ${TABLE}.ref_vendor ;;
  }

  dimension: version {
    type: number
    sql: ${TABLE}.version ;;
  }

  measure: count {
    type: count
    drill_fields: [id, ref_file_name, custom_file_name]
  }
}
