view: custom_score_ranges {
  derived_table: {
    sql: select cas.ref_assessment as id, cas.ref_assessment, cas.score_type, name, cas.score, start, end from client_assessment_scores cas
      inner join score_ranges sr on cas.score_type = sr.score_type
      where cas.score >= sr.start and cas.score <=sr.end
       ;;
  indexes: ["id"]
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: id {
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: ref_assessment {
    type: number
    sql: ${TABLE}.ref_assessment ;;
  }

  dimension: score_type {
    type: string
    sql: ${TABLE}.score_type ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: score {
    type: number
    sql: ${TABLE}.score ;;
  }

  dimension: start {
    type: number
    sql: ${TABLE}.start ;;
  }

  dimension: end {
    type: number
    sql: ${TABLE}.end ;;
  }

  set: detail {
    fields: [
      id,
      ref_assessment,
      score_type,
      name,
      score,
      start,
      end
    ]
  }
}
