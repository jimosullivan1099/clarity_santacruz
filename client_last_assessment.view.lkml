view: client_last_assessment {
  derived_table: {
    sql: select cad.ref_client, cad.ref_assessment, id, cad.assessment_date from client_assessment_demographics cad INNER JOIN (
      select ref_client, ref_assessment, max(assessment_date) as last_assessment_date from client_assessment_demographics where deleted is NULL
            group by 1,2) la on cad.ref_client = la.ref_client and cad.ref_assessment=la.ref_assessment and cad.assessment_date = la.last_assessment_date
       ;;
    indexes: ["id"]
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: ref_client {
    type: number
    sql: ${TABLE}.ref_client ;;
  }

  dimension: ref_assessment {
    type: number
    sql: ${TABLE}.ref_assessment ;;
  }

  dimension: id {
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension_group: assessment_date {
    type: time
    sql: ${TABLE}.assessment_date ;;
  }

  set: detail {
    fields: [ref_client, ref_assessment, id, assessment_date_time]
  }
}
