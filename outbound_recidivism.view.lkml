view: outbound_recidivism {
  derived_table: {
    #    sql_trigger_value: SELECT CURRENT_DATE()
    indexes: ["screen_id", "client_id"]
    sql: select
         cpd.id AS screen_id
        ,cpd.ref_client AS client_id
        ,cpd.ref_program AS program_id
        ,cpd.added_date AS screen_add_date
        ,cp.end_date AS cp_end_date
        ,count(subsequent_entries.id) * 1.0 AS subsequent_entries_number
        ,sum(CASE WHEN subsequent_programs.ref_category IN (1,2,4,13)  THEN 1.0 END) AS subsequent_entries_without_stable_housing
        ,sum(CASE WHEN subsequent_programs.id = cp.ref_program THEN 1.0 END) AS subsequent_entries_in_same_program
        ,min(subsequent_entries_cp.start_date) AS next_entry_date
        ,min(CASE WHEN subsequent_programs.ref_category IN (1,2,4,13) THEN subsequent_entries_cp.start_date END ) AS next_entry_date_without_stable_housing

      from client_program_demographics cpd

      inner join client_programs cp
          on cpd.ref_program = cp.id

      left join client_program_demographics subsequent_entries
          on cpd.ref_client = subsequent_entries.ref_client
          and subsequent_entries.screen_type = 2

      left join client_programs subsequent_entries_cp
          on subsequent_entries.ref_program = subsequent_entries_cp.id
      left join programs subsequent_programs
          on subsequent_programs.id = subsequent_entries_cp.ref_program
      where
            cpd.screen_type = 4 and cpd.exit_destination in (10,11,19,20,21,22,23,26,28,3,29,24,25,31)
        and cp.end_date < subsequent_entries_cp.start_date

      group by 1,2,3,4,5
      order by cpd.id, cpd.added_date
       ;;
  }

  dimension: screen_id {
    primary_key: yes
    type: number
    hidden: yes
    sql: ${TABLE}.screen_id ;;
  }

  dimension: client_id {
    type: number
    hidden: yes
    sql: ${TABLE}.client_id ;;
  }

  dimension: program_id {
    type: number
    hidden: yes
    sql: ${TABLE}.program_id ;;
  }

  dimension: housing_status {
    type: number
    hidden: yes
    sql: ${TABLE}.housing_status ;;
  }

  dimension_group: screen_add_date {
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.screen_add_date ;;
  }

  dimension_group: cp_end {
    hidden: yes
    type: time
    timeframes: [date]
    sql: ${TABLE}.cp_end_date ;;
  }

  measure: count {
    type: count
    hidden: yes
  #  drill_fields: [detail*]
  }

  measure: distinct_client_count {
    type: count_distinct
    sql: ${client_id} ;;
    hidden: yes
  }

  dimension: appears_again {
    type: yesno
    sql: ${subsequent_entries_number} > 0 ;;
  }

  dimension: appears_again_without_stable_housing {
    type: yesno
    sql: ${subsequent_entries_without_stable_housing} > 0 ;;
  }

  measure: count_exits_appears_again {
    type: count

    filters: {
      field: appears_again
      value: "Yes"
    }
  }

  measure: count_exits_appears_again_without_stable_housing {
    type: count

    filters: {
      field: appears_again_without_stable_housing
      value: "Yes"
    }
  }

  measure: percent_exits_appears_again {
    type: number
    value_format_name: percent_1
    sql: 100.0 * ${count_exits_appears_again} / NULLIF(${last_screen.count},0) ;;
  }

  measure: percent_exits_appears_again_without_stable_housing {
    type: number
    value_format_name: percent_1
    sql: 100.0 * ${count_exits_appears_again_without_stable_housing} / NULLIF(${last_screen.count},0) ;;
  }

  measure: count_clients_appears_again {
    type: count_distinct
    sql: ${client_id} ;;

    filters: {
      field: appears_again
      value: "Yes"
    }
  }

  measure: count_clients_appears_again_without_stable_housing {
    type: count_distinct
    sql: ${client_id} ;;
    drill_fields: [
      clients.id,
      clients.full_name,
      clients.birth_date,
      programs.name,
      client_programs.end_date,
      last_screen.housing_status_text,
      next_entry_without_stable_housing_date
    ]

    filters: {
      field: appears_again_without_stable_housing
      value: "Yes"
    }
  }

  measure: percent_clients_appears_again {
    type: number
    value_format_name: percent_1
    sql: 100.0 * ${count_clients_appears_again} / NULLIF(${clients.count},0) ;;
  }

  measure: percent_clients_appears_again_without_stable_housing {
    type: number
    value_format_name: percent_1
    drill_fields: [programs.name, last_screen.housing_status_text, clients.count, count_clients_appears_again_without_stable_housing]
    sql: 100.0 * ${count_clients_appears_again_without_stable_housing} / nullif(${clients.count},0) ;;
  }

  dimension: subsequent_entries_number {
    type: number
    sql: ${TABLE}.subsequent_entries_number ;;
  }

  dimension: subsequent_entries_in_same_program {
    type: number
    sql: ${TABLE}.subsequent_entries_in_same_program ;;
  }

  dimension: subsequent_entries_without_stable_housing {
    type: number
    sql: ${TABLE}.subsequent_entries_without_stable_housing ;;
  }

  dimension_group: next_entry {
    type: time
    timeframes: [date]
    sql: ${TABLE}.next_entry_date ;;
  }

  dimension_group: next_entry_without_stable_housing {
    type: time
    timeframes: [date]
    sql: ${TABLE}.next_entry_date_without_stable_housing ;;
  }

  dimension: days_until_next_entry {
    type: number
    sql: DATEDIFF(${next_entry_date}, ${cp_end_date}) ;;
  }

  dimension: days_until_next_entry_without_stable_housing {
    type: number
    sql: DATEDIFF(${next_entry_without_stable_housing_date}, ${cp_end_date}) ;;
  }

  measure: average_days_until_next_entry {
    type: average
    sql: ${days_until_next_entry} ;;
  }

  measure: average_days_until_next_entry_without_stable_housing {
    type: average
    sql: ${days_until_next_entry_without_stable_housing} ;;
  }


}
