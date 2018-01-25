view: zipcode {
  dimension: zipcode_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.zipcode_id ;;
  }

  dimension: city {
    sql: ${TABLE}.city ;;
  }

  dimension: dst {
    type: number
    sql: ${TABLE}.dst ;;
  }

  dimension: latitude {
    type: number
    sql: ${TABLE}.latitude ;;
  }

  dimension: longitude {
    type: number
    sql: ${TABLE}.longitude ;;
  }

  dimension: state {
    sql: ${TABLE}.state ;;
  }

  dimension: state_name {
    sql: ${TABLE}.state_name ;;
  }

  dimension: timezone {
    type: number
    sql: ${TABLE}.timezone ;;
  }

  dimension: zipcode {
    sql: ${TABLE}.zipcode ;;
  }

  measure: count {
    type: count
    drill_fields: [zipcode_id, state_name]
  }
}
