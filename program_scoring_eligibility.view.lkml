view: program_scoring_eligibility {
  derived_table: {
    sql: SELECT ap.name,   low.ref_program, low.value + 1 as 'low score', high.value - 1 as 'high score'
      from eligibility_requirements er LEFT OUTER JOIN
      programs_eligibility_requirements low on low.ref_requirement = er.id and low.condition = '>' and low.ref_field < 0
      LEFT OUTER JOIN programs_eligibility_requirements high on low.ref_requirement = high.ref_requirement and
      low.ref_program = high.ref_program  and high.condition = '<' and high.ref_field < 0
      INNER JOIN assessment_processors ap ON ap.id = low.ref_assessment_processor
      where (low.ref_field < 0 or high.ref_field < 0)
      order by low.ref_program;
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: ref_program {
    hidden: yes
    type: number
    sql: ${TABLE}.ref_program ;;
  }

  dimension: low_score {
    type: number
    label: "low score"
    sql: ${TABLE}.`low score` ;;
  }

  dimension: high_score {
    type: number
    label: "high score"
    sql: ${TABLE}.`high score` ;;
  }

  set: detail {
    fields: [name, ref_program,low_score, high_score]
  }
}
