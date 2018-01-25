view: sharing_group {
  sql_table_name: sharing_group ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: clients {
    type: yesno
    sql: ${TABLE}.clients ;;
  }

  dimension: files {
    type: number
    sql: ${TABLE}.files ;;
  }

  dimension: location {
    type: number
    sql: ${TABLE}.location ;;
  }

  dimension: messages {
    type: number
    sql: ${TABLE}.messages ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: services {
    type: number
    sql: ${TABLE}.services ;;
  }

  measure: count {
    type: count
    drill_fields: [id, name]
  }
}
