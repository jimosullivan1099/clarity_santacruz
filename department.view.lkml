view: department {
  sql_table_name: department ;;

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

  dimension: clients {
    hidden: yes
    type: yesno
    sql: ${TABLE}.clients ;;
  }

  dimension: files {
    hidden: yes
    type: number
    sql: ${TABLE}.files ;;
  }

  dimension_group: last_updated {
    hidden: yes
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.last_updated ;;
  }

  dimension: messages {
    hidden: yes
    type: number
    sql: ${TABLE}.messages ;;
  }

  dimension: name {
    label: "Agency Department Name"
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: ref_agency {
    hidden: yes
    type: number
    sql: ${TABLE}.ref_agency ;;
  }

  dimension: ref_user_updated {
    hidden: yes
    type: number
    sql: ${TABLE}.ref_user_updated ;;
  }

  dimension: services {
    hidden: yes
    type: number
    sql: ${TABLE}.services ;;
  }

  measure: count {
    label: "Agency Department Count"
    type: count
    drill_fields: [id, name]
  }
}
