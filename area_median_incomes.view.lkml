view: area_median_incomes {
  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: income_amount {
    type: number
    sql: ${TABLE}.income_amount ;;
  }

  dimension: persons_count {
    type: number
    sql: ${TABLE}.persons_count ;;
  }

  dimension: ref_county {
    type: number
    sql: ${TABLE}.ref_county ;;
  }

  dimension: ref_income_type {
    type: number
    sql: ${TABLE}.ref_income_type ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
