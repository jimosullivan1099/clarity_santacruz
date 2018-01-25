view: assessment_measures {
  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: color {
    type: number
    sql: ${TABLE}.color ;;
  }

  dimension: ref_agency {
    type: number
    sql: ${TABLE}.ref_agency ;;
  }

  dimension: ref_assessment {
    type: number
    sql: ${TABLE}.ref_assessment ;;
  }

  dimension: ref_field {
    type: number
    sql: ${TABLE}.ref_field ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
