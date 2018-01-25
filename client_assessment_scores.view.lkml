view: client_assessment_scores {
  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: detail {
    hidden: yes
    sql: ${TABLE}.detail ;;
  }

  dimension: ref_assessment {
    hidden: yes
    type: number
    sql: ${TABLE}.ref_assessment ;;
  }

  dimension: score {
    type: number
    sql: ${TABLE}.score ;;
  }

  dimension: score_type {
    sql: ${TABLE}.score_type ;;
  }

  dimension: a {
    sql: COLUMN_GET(${TABLE}.detail,'a' as INT) ;;
  }

  dimension: b {
    sql: COLUMN_GET(${TABLE}.detail,'b' as INT) ;;
  }

  dimension: c {
    sql: COLUMN_GET(${TABLE}.detail,'c' as INT) ;;
  }

  dimension: d {
    sql: COLUMN_GET(${TABLE}.detail,'d' as INT) ;;
  }

  dimension: e {
    sql: COLUMN_GET(${TABLE}.detail,'e' as INT) ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
