view: client_program_screening_base {
  derived_table: {
    sql: SELECT
        cpd.ref_client
        ,cpd.ref_program
        ,min(
          case when cpd.screen_type = 2
          then cpd.id end)
          AS first_entry_screen_id

        ,max(
          case when cpd.screen_type IN (3,6)
          then cpd.id end)
          AS last_update_screen_id

        ,max(
          case when cpd.screen_type = 4
          then cpd.id end)
          AS last_exit_screen_id

        ,max(
          case when cpd.screen_type = 6
          then cpd.id end)
          AS last_annual_screen_id

        ,max(
          case when cpd.screen_type = 5
          then cpd.id end)
          AS followup_screen_id

      FROM
      client_program_demographics cpd
      INNER JOIN client_programs cp on cpd.ref_program = cp.id
      INNER JOIN (select ref_client, ref_program, cpd.screen_type, id, max(added_date) as added_date from client_program_demographics cpd group by 1,2,3) det
        on cpd.ref_client = det.ref_client and cpd.ref_program = det. ref_program and cpd.added_date = det.added_date
      WHERE
      (cp.deleted is NULL or cp.deleted = 0)
      AND (cpd.deleted is NULL or cpd.deleted = 0) AND cpd.program_date is not NULL

      GROUP BY 1,2
       ;;
    persist_for: "2 hour"
    indexes: ["ref_program", "last_exit_screen_id"]
  }

  #   - filter: start
  #     type: time
  #     timeframes: [date]



  dimension: ref_client {
    hidden: yes
    type: number
    sql: ${TABLE}.ref_client ;;
  }

  dimension: ref_program {
    hidden: yes
    type: number
    sql: ${TABLE}.ref_program ;;
  }

  dimension: first_entry_screen_id {
    type: number
    hidden: yes
    sql: ${TABLE}.first_entry_screen_id ;;
  }

  dimension: last_exit_screen_id {
    type: number
    hidden: yes
    sql: ${TABLE}.last_exit_screen_id ;;
  }

  dimension: last_update_screen_id {
    type: number
    hidden: yes
    sql: ${TABLE}.last_update_screen_id ;;
  }

  dimension: last_annual_screen_id {
    type: number
    hidden: yes
    sql: ${TABLE}.last_annual_screen_id ;;
  }

  dimension: followup_screen_id {
    type: number
    hidden: yes
    sql: ${TABLE}.followup_screen_id ;;
  }

  dimension: last_screening_to_analyze {
    type: number
    hidden: yes
    sql: COALESCE(${followup_screen_id},${last_exit_screen_id},${last_update_screen_id}) ;;
  }

  set: detail {
    fields: [
      ref_client,
      ref_program,
      last_exit_screen_id,
      last_annual_screen_id
    ]
  }
}
