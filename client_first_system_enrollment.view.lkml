view: client_first_system_enrollment {
  derived_table: {
    sql: select cp.id, cp.ref_client, cp.ref_program from client_programs cp INNER JOIN
      (select  ref_client, min(start_date) as last_start from client_programs where deleted is null group by 1) latest_cp
      ON cp.ref_client = latest_cp.ref_client  and cp.start_date = latest_cp.last_start  where deleted is null
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

  dimension: ref_client {
    type: number
    sql: ${TABLE}.ref_client ;;
  }

  dimension: ref_program {
    type: number
    sql: ${TABLE}.ref_program ;;
  }

  set: detail {
    fields: [id, ref_client, ref_program]
  }
}
