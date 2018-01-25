view: program_coc {
  sql_table_name: program_coc ;;

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

  dimension: coc {
    type: string
    sql: ${TABLE}.coc ;;
  }

  dimension: deleted {
    type: yesno
    sql: ${TABLE}.deleted ;;
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

  dimension: ref_agency_deleted {
    hidden:  yes
    type: number
    sql: ${TABLE}.ref_agency_deleted ;;
  }

  dimension: ref_program {
   hidden:  yes
   type: number
    sql: ${TABLE}.ref_program ;;
  }

  dimension: ref_user_updated {
    hidden:  yes
    type: number
    sql: ${TABLE}.ref_user_updated ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
