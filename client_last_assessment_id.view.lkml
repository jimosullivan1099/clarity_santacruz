view: client_last_assessment_id {
  derived_table: {
    sql: select cad.ref_client, cad.ref_assessment, id from client_assessment_demographics cad INNER JOIN (
      select ref_client, ref_assessment, max(id) as maxid from client_assessment_demographics where deleted is null
            group by 1,2) la on cad.ref_client = la.ref_client and cad.ref_assessment=la.ref_assessment and la.maxid = cad.id
 ;;
    indexes: ["id", "ref_assessment"]
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

  set: detail {
    fields: [ref_client, ref_assessment, id]
  }
}
