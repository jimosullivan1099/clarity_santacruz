view: import_rejected_clients_log {
  sql_table_name: clarity_nevada.import_rejected_clients_log ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension_group: client_dob {
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
    sql: ${TABLE}.client_dob ;;
  }

  dimension: client_first_name {
    type: string
    sql: ${TABLE}.client_first_name ;;
  }

  dimension: client_id {
    type: number
    sql: ${TABLE}.client_id ;;
  }

  dimension: client_last_name {
    type: string
    sql: ${TABLE}.client_last_name ;;
  }

  dimension: client_ssn {
    type: string
    sql: ${TABLE}.client_ssn ;;
  }

  dimension: client_unique_identifier {
    type: string
    sql: ${TABLE}.client_unique_identifier ;;
  }

  dimension: ref_file {
    type: number
    sql: ${TABLE}.ref_file ;;
  }

  dimension: rejected_reason {
    type: number
    sql: ${TABLE}.rejected_reason ;;
  }

  measure: count {
    type: count
    drill_fields: [id, client_last_name, client_first_name]
  }
}
