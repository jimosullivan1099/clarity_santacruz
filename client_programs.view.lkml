view: enrollments {
  sql_table_name: client_programs
    ;;

  dimension: id {
    label: "Enrollment Id"
    description: "(HMIS Data Element 5.6)"
    primary_key: yes
    type: number
    value_format_name: id
    link: {
      label: "Clarity Program Enrollment"
      url: "https://{{ _user_attributes[\"site_name\"]] }}.clarityhs.com/clients/{{enrollments.ref_client._value}}/programs/{{ value }}"
    }

    link: {
      label: "Clarity Profile"
      url: "https://{{ _user_attributes[\"site_name\"]] }}.clarityhs.com/clients/{{enrollments.ref_client._value}}/profile"
    }

    sql: ${TABLE}.id ;;
  }

  filter: date_filter {
    label: "Reporting Period Filter"
    description: "([Project Exit Date] >= Reporting Period Filter start date OR is null) AND [Project Start Date] <= Reporting Period Filter end date. Requires two \"dates\" to set the filter"
    type: date
    sql: ${start_raw} < {% date_end date_filter %}
      AND (${end_raw} >= {% date_start date_filter %} OR ${end_raw} is NULL)
       ;;
  }

  dimension: is_latest_enrollment {
    group_label: "First/Last"
    label: "Is Latest Program Enrollment"
    type: yesno
    description: "This is the latest enrollment into this project (based on [Project Start Date])"
    sql: ${id} = ${client_last_program.id} ;;
  }

  dimension: is_latest_system_enrollment {
    group_label: "First/Last"
    label: "Is Latest System Enrollment"
    type: yesno
    description: "This is the latest enrollment system wide (based on entry date)"
    sql: ${id} = ${client_last_system_program_enrollment.id} ;;
  }

  dimension: is_first_enrollment {
    group_label: "First/Last"
    label: "Is First Program Enrollment"
    type: yesno
    description: "This is the first enrollment into this project (based on [Project Start Date])"
    sql: ${id} = ${client_first_program.id} ;;
  }

  dimension: is_first_system_enrollment {
    group_label: "First/Last"
    label: "Is First System Enrollment"
    type: yesno
    description: "This is the first enrollment system wide (based on entry date)"
    sql: ${id} = ${client_first_system_enrollment.id} ;;
  }

  dimension_group: added {
    label: "Date Created"
    description: "Date the Project Enrollment was created (HMIS Data Element 5.1)"
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.added_date ;;
  }

  dimension_group: end {
    label: "Project Exit"
    description: "Project Exit Date (HMIS Data Element 3.11)"
    type: time
    timeframes: [
      date,
      week,
      month,
      year,
      raw,
      quarter
    ]
    convert_tz: no
    sql: ${TABLE}.end_date ;;
  }

  dimension_group: end_date_or_today {
    label: "Exit Date Filter"
    type: time
    timeframes: [date]
    sql: COALESCE(${end_date},NOW()) ;;
  }

  dimension_group: last_updated {
    label: "Date Updated"
    description: "Date the Project Enrollment was last updated (HMIS Data Element 5.2)"
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.last_updated ;;
  }

  dimension: ref_agency {
    hidden: yes
    type: number
    value_format_name: id
    sql: ${TABLE}.ref_agency ;;
  }

  dimension: ref_client {
    hidden: yes
    label: "Personal Id"
    type: number
    value_format_name: id
    sql: ${TABLE}.ref_client ;;
  }



  dimension: ref_department {
    hidden: yes
    type: number
    sql: ${TABLE}.ref_department ;;
  }

  dimension: ref_head {
    hidden: yes
    type: number
    value_format_name: id
    sql: ${TABLE}.ref_head ;;
  }

  dimension: head_of_household {
    description: "If Relationship to Head of Household is Self, Yes. Else No. (HMIS Data Element 3.15)"
    type: yesno
    sql: ${TABLE}.ref_head = ${TABLE}.ref_client ;;
  }

  measure: count_households {
    description: "Number of households"
    type: count_distinct
    sql: ${ref_client} ;;
    drill_fields: [
      id,
      ref_household,
      clients.id,
      clients.full_name,
      start_date,
      end_date
    ]

    filters: {
      field: head_of_household
      value: "yes"
    }
  }

  measure: count_chronic_homeless_households {
    description: "Number of households where head of household is chronically homeless"
    type: count_distinct
    sql: ${ref_client} ;;

    filters: {
      field: head_of_household
      value: "yes"
    }

    filters: {
      field: entry_screen.chronic_homeless_calculation
      value: "Yes"
    }
  }

  dimension: ref_household {
    label: "Household Id"
    description: "Household ID unique to Project Enrollment (HMIS Data Element 3.14)"
    type: number
    value_format_name: id
    sql: ${TABLE}.ref_household ;;
  }

  dimension: ref_program {
    label: "Project Id"
    description: "Project or Program for the enrollment (HMIS Data Element 5.05)"
    type: number
    value_format_name: id
    sql: ${TABLE}.ref_program ;;
  }

  dimension: ref_user {
    label: "User Creating"
    description: "User which created the enrollment record"
    sql: fn_getUserNameById(${TABLE}.ref_user) ;;
  }

  dimension: assigned_staff {
    description: "User currently assigned to the enrollment"
    sql: CONCAT(${members.first_name},' ',${members.last_name}) ;;
  }

  dimension: private {
    description: "Is this enrollment private?"
    type: yesno
    sql: ${client_program_staff.private} ;;

  }

  dimension: ref_user_updated {
    label: "User Updating"
    description: "User who created &/or updated the enrollment record (HMIS Data Element 5.7)"
    sql: fn_getUserNameById(${TABLE}.ref_user_updated) ;;
  }

  dimension_group: start {
    label: "Project Start"
    description: "Project Start (HMIS Data Element 3.10)"
    type: time
    timeframes: [
      date,
      week,
      month,
      year,
      raw,
      quarter
    ]
    convert_tz: no
    sql: ${TABLE}.start_date ;;
  }

  dimension: days_since_start {
    label: "Days in Project"
    description: "Number of days between [Project Start] and [Project Exit]. If not exited, current date"
    bypass_suggest_restrictions: yes
    #X# Invalid LookML inside "dimension": {"suggest_dimension":null}
    type: number
    value_format_name: id
    sql: DATEDIFF(COALESCE(${end_date},NOW()),${start_date}) ;;
  }

  dimension: days_since_start_tier {
    label: "Days in Project Tier"
    description: "Tiers: Number of days between [Project Start] and [Project Exit]. If not exited, current date"
    type: tier
    style: integer
    tiers: [
      0,
      3,
      7,
      30,
      90,
      180,
      365,
      730,
      10000
    ]
    sql: ${days_since_start} ;;
  }

  dimension: days_in_project_during_reporting_period {
    label: "Days in Project During the Reporting Period"
    description: "Number of days the client was enrolled in the project during the reporting period."
    type: number
    value_format_name: id
    sql: DATEDIFF(LEAST(COALESCE(${end_date},NOW()),{% date_end date_filter %}),GREATEST(${start_date},{% date_start date_filter %} )) ;;
  }

  measure: total_days_in_project_during_reporting_period {
    label: "Total Days in Project During the Reporting Period"
    description: "Sum of \"Days in Project During the Reporting Period.\""
    type: sum
    sql: ${days_in_project_during_reporting_period} ;;
  }

  measure: average_duration {
    label: "Average Days in Project"
    description: "Average: Number of days between [Project Start] and [Project Exit]. If not exited, current date"
    type: average
    sql: ${days_since_start} ;;
  }

  measure: last_exit {
    label: "Last Exit"
    description: "Latest (maximum) exit date"
    type: date
    sql: CASE
      WHEN MAX( COALESCE(${end_date},'2099-12-31')) = '2099-12-31' THEN
      NULL
      ELSE MAX( COALESCE(${end_date},'2099-12-31'))
      END
       ;;
  }

  measure: last_entry {
    label: "Last Project Start"
    description: "Latest (maximum) [Project Start Date]"
    type: date
    sql: MAX(${start_date}) ;;
  }

  dimension: still_in_program {
    label: "Active in Project"
    description: "Client has not exited the project"
    type: yesno
    sql: (${end_date} IS NULL and ${start_date} is not null) ;;  # added start date in filter to handle left joins
  }

  dimension: last_exit_desination {
    hidden: yes
    label: "Last Exit Destination"
    sql: ${last_exit_screen.exit_destination} ;;
  }

  dimension: last_exit_destination_text {
    label: "Last Exit Destination"
    description: "Expected living situation following project exit (HMIS Data Element 3.12)"
    suggestions: [
      "Client doesn't know",
      "Client refused",
      "Data not collected",
      "Deceased",
      "Emergency Shelter, including hotel or motel paid for with voucher",
      "Foster care home or foster care group home",
      "Hospital or other residential non-psychiatric medical facility",
      "Hotel or motel paid for without emergency shelter voucher",
      "Jail, prison or juvenile detention facility",
      "Long-term care facility or nursing home",
      "Moved from one HOPWA funded project to HOPWA PH",
      "No exit interview completed",
      "Other",
      "Owned by client, no ongoing housing subsidy",
      "Owned by client, with ongoing housing subsidy",
      "Permanent housing for formerly homeless persons",
      "Place not meant for habitation",
      "Psychiatric hospital or other psychiatric facility",
      "Rental by client, no ongoing housing subsidy",
      "Rental by client, with GPD TIP housing subsidy",
      "Rental by client, with other ongoing housing subsidy",
      "Rental by client, with VASH housing subsidy",
      "Residential project or halfway house with no homeless criteria",
      "Safe Haven",
      "Staying or living with family, permanent tenure",
      "Staying or living with family, temporary tenure",
      "Staying or living with friends, permanent tenure",
      "Staying or living with friends, temporary tenure",
      "Substance abuse treatment facility or detox center",
      "Transitional housing for homeless persons"
    ]
    sql: fn_getPicklistValueName('exit_destination',${last_exit_desination}) ;;
  }


  dimension: status {
    hidden: yes
    type: number
    value_format_name: id
    sql: ${TABLE}.status ;;
  }

  dimension: deleted {
    hidden: yes
    type: number
    value_format_name: id
    sql: ${TABLE}.deleted ;;
  }

  dimension: type {
    hidden: yes
    type: number
    value_format_name: id
    sql: ${TABLE}.type ;;
  }

  #  - dimension: enrollment_type
  #   label: 'Individual or Family '
  #    type: string
  #    bypass_suggest_restrictions: true
  #    sql_case:
  #            Individual: ${type} = 1
  #            Family: ${type} = 2
  #            else: unknown

  dimension: family_or_individual {
    label: "Individual or Family"
    description: "If count of household members in enrollment = 1, Individual. If count >1, Family. Else Unknown"
    type: string

    case: {
      when: {
        sql: ${household_entry_screen.total_household_clients} = 1 ;;
        label: "Individual"
      }

      when: {
        sql: ${household_entry_screen.total_household_clients} > 1 ;;
        label: "Family"
      }

      else: "Unknown"
    }
  }

  measure: count {
    description: "Number of Enrollments"
    type: count
  }
}
