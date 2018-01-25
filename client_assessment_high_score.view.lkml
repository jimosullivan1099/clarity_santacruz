view: client_assessment_high_score {
  derived_table: {
    sql: select cad.ref_assessment as 'assessment_type',cas.ref_assessment , cas.score, cad.ref_client from  client_assessment_scores cas INNER JOIN client_assessment_demographics cad on cas.ref_assessment = cad.id inner join (
        select cad.ref_client, cad.ref_assessment, max(score) as maxscore from client_assessment_scores cas INNER JOIN client_assessment_demographics cad on cas.ref_assessment = cad.id group by 1,2) ma
        ON cad.ref_client = ma.ref_client AND cad.ref_assessment = ma.ref_assessment and cas.score = ma.maxscore group by 4,1

       ;;
    indexes: ["ref_client", "ref_assessment"]
  }

  dimension: ref_client {
    type: number
    sql: ${TABLE}.ref_client ;;
  }

  dimension: assessment_type {
    type: number
    sql: ${TABLE}.assessment_type ;;
  }

  dimension: ref_assessment {
    type: number
    sql: ${TABLE}.ref_assessment ;;
  }

  dimension: score {
    type: number
    sql: ${TABLE}.score ;;
  }



}
