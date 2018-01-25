view: client_program_demographics {
  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension_group: added {
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.added_date ;;
  }

  dimension: benefit_snap {
    type: number
    sql: ${TABLE}.benefit_snap ;;
  }

  dimension: benefits_medicaid {
    type: number
    sql: ${TABLE}.benefits_medicaid ;;
  }

  dimension: benefits_medicare {
    type: number
    sql: ${TABLE}.benefits_medicare ;;
  }

  dimension: benefits_no_insurance {
    type: number
    sql: ${TABLE}.benefits_no_insurance ;;
  }

  dimension: benefits_noncash {
    type: number
    sql: ${TABLE}.benefits_noncash ;;
  }

  dimension: benefits_other {
    type: number
    sql: ${TABLE}.benefits_other ;;
  }

  dimension: benefits_other_source {
    sql: ${TABLE}.benefits_other_source ;;
  }

  dimension: benefits_private_insurance {
    type: number
    sql: ${TABLE}.benefits_private_insurance ;;
  }

  dimension: benefits_schip {
    type: number
    sql: ${TABLE}.benefits_schip ;;
  }

  dimension: benefits_section8 {
    description: "Retired HMIS Data Element"
    type: number
    sql: ${TABLE}.benefits_section8 ;;
  }

  dimension: benefits_tanf_childcare {
    type: number
    sql: ${TABLE}.benefits_tanf_childcare ;;
  }

  dimension: benefits_tanf_other {
    type: number
    sql: ${TABLE}.benefits_tanf_other ;;
  }

  dimension: benefits_tanf_transportation {
    type: number
    sql: ${TABLE}.benefits_tanf_transportation ;;
  }

  dimension: benefits_temp_rent {
    description: "Retired HMIS Data Element"
    type: number
    sql: ${TABLE}.benefits_temp_rent ;;
  }

  dimension: benefits_va_medical {
    type: number
    sql: ${TABLE}.benefits_va_medical ;;
  }

  dimension: benefits_wic {
    type: number
    sql: ${TABLE}.benefits_wic ;;
  }

  dimension: chronic_1 {
    type: number
    sql: ${TABLE}.chronic_1 ;;
  }

  dimension: chronic_2 {
    type: number
    sql: ${TABLE}.chronic_2 ;;
  }

  dimension: chronic_3 {
    type: number
    sql: ${TABLE}.chronic_3 ;;
  }

  dimension: chronic_4 {
    type: number
    sql: ${TABLE}.chronic_4 ;;
  }

  dimension: chronic_5 {
    type: number
    sql: ${TABLE}.chronic_5 ;;
  }

  dimension: chronic_homeless {
    type: number
    sql: ${TABLE}.chronic_homeless ;;
  }

  dimension: chronic_homeless_calculation {
    sql: CASE WHEN ${client_programs.head_of_household} = 1 AND ${TABLE}.disabled = 1 AND  ( ${TABLE}.chronic_1 = 1 OR  ${TABLE}.chronic_2 = 4) THEN 'Chronic Homeless'    ELSE 'Not Chronic Homeless'    END ;;
  }

  dimension: client_location {
    sql: ${TABLE}.client_location ;;
  }

  dimension: disabled {
    type: number
    sql: ${TABLE}.disabled ;;
  }

  dimension: exit_destination {
    type: number
    sql: ${TABLE}.exit_destination ;;
  }

  dimension: exit_destination_other {
    sql: ${TABLE}.exit_destination_other ;;
  }

  dimension: exit_reason {
    type: number
    sql: ${TABLE}.exit_reason ;;
  }

  dimension: gross_ann_hsld_income {
    type: number
    sql: ${TABLE}.gross_ann_hsld_income ;;
  }

  dimension: gross_ann_ind_income {
    type: number
    sql: ${TABLE}.gross_ann_ind_income ;;
  }

  dimension: health_chronic {
    type: number
    sql: ${TABLE}.health_chronic ;;
  }

  dimension: health_chronic_documented {
    type: number
    sql: ${TABLE}.health_chronic_documented ;;
  }

  dimension: health_chronic_longterm {
    type: number
    sql: ${TABLE}.health_chronic_longterm ;;
  }

  dimension: health_chronic_services {
    type: number
    sql: ${TABLE}.health_chronic_services ;;
  }

  dimension: health_dev_disability {
    type: number
    sql: ${TABLE}.health_dev_disability ;;
  }

  dimension: health_dev_disability_documented {
    type: number
    sql: ${TABLE}.health_dev_disability_documented ;;
  }

  dimension: health_dev_disability_independence {
    type: number
    sql: ${TABLE}.health_dev_disability_independence ;;
  }

  dimension: health_dev_disability_services {
    type: number
    sql: ${TABLE}.health_dev_disability_services ;;
  }

  dimension: health_dv {
    type: number
    sql: ${TABLE}.health_dv ;;
  }

  dimension: health_dv_occurred {
    type: number
    sql: ${TABLE}.health_dv_occurred ;;
  }

  dimension: health_dv_fleeing {
    sql: ${TABLE}.health_dv_fleeing ;;
  }

  dimension: health_general {
    type: number
    sql: ${TABLE}.health_general ;;
  }

  dimension: health_hiv {
    type: number
    sql: ${TABLE}.health_hiv ;;
  }

  dimension: health_hiv_documented {
    type: number
    sql: ${TABLE}.health_hiv_documented ;;
  }

  dimension: health_hiv_independence {
    type: number
    sql: ${TABLE}.health_hiv_independence ;;
  }

  dimension: health_hiv_services {
    type: number
    sql: ${TABLE}.health_hiv_services ;;
  }

  dimension: health_ins_cobra {
    type: number
    sql: ${TABLE}.health_ins_cobra ;;
  }

  dimension: health_ins_emp {
    type: number
    sql: ${TABLE}.health_ins_emp ;;
  }

  dimension: health_ins_ppay {
    type: number
    sql: ${TABLE}.health_ins_ppay ;;
  }

  dimension: health_ins_state {
    type: number
    sql: ${TABLE}.health_ins_state ;;
  }

  dimension: health_insurance {
    type: number
    sql: ${TABLE}.health_insurance ;;
  }

  dimension: health_mental {
    type: number
    sql: ${TABLE}.health_mental ;;
  }

  dimension: health_mental_confirmed {
    type: number
    sql: ${TABLE}.health_mental_confirmed ;;
  }

  dimension: health_mental_documented {
    type: number
    sql: ${TABLE}.health_mental_documented ;;
  }

  dimension: health_mental_longterm {
    type: number
    sql: ${TABLE}.health_mental_longterm ;;
  }

  dimension: health_mental_services {
    type: number
    sql: ${TABLE}.health_mental_services ;;
  }

  dimension: health_mental_smi {
    type: number
    sql: ${TABLE}.health_mental_smi ;;
  }

  dimension: health_phys_disability {
    type: number
    sql: ${TABLE}.health_phys_disability ;;
  }

  dimension: health_phys_disability_documented {
    type: number
    sql: ${TABLE}.health_phys_disability_documented ;;
  }

  dimension: health_phys_disability_longterm {
    type: number
    sql: ${TABLE}.health_phys_disability_longterm ;;
  }

  dimension: health_phys_disability_services {
    type: number
    sql: ${TABLE}.health_phys_disability_services ;;
  }

  dimension: health_pregnancy {
    type: number
    sql: ${TABLE}.health_pregnancy ;;
  }

  dimension_group: health_pregnancy {
    type: time
    timeframes: [date, week, month]
    convert_tz: no
    sql: ${TABLE}.health_pregnancy_date ;;
  }

  dimension: health_substance_abuse {
    type: number
    sql: ${TABLE}.health_substance_abuse ;;
  }

  dimension: health_substance_abuse_confirmed {
    type: number
    sql: ${TABLE}.health_substance_abuse_confirmed ;;
  }

  dimension: health_substance_abuse_documented {
    type: number
    sql: ${TABLE}.health_substance_abuse_documented ;;
  }

  dimension: health_substance_abuse_longterm {
    type: number
    sql: ${TABLE}.health_substance_abuse_longterm ;;
  }

  dimension: health_substance_abuse_services {
    type: number
    sql: ${TABLE}.health_substance_abuse_services ;;
  }

  dimension: housing_ass_exit {
    type: number
    sql: ${TABLE}.housing_ass_exit ;;
  }

  dimension: housing_ass_exit_1 {
    type: number
    sql: ${TABLE}.housing_ass_exit_1 ;;
  }

  dimension: housing_ass_exit_2 {
    type: number
    sql: ${TABLE}.housing_ass_exit_2 ;;
  }

  dimension: housing_status {
    type: number
    sql: ${TABLE}.housing_status ;;
  }

  dimension: income_cash {
    type: number
    sql: ${TABLE}.income_cash ;;
  }

  dimension: income_cash_is {
    type: number
    sql: ${TABLE}.income_cash_is ;;
  }

  dimension: income_childsupport {
    type: number
    sql: ${TABLE}.income_childsupport ;;
  }

  dimension: income_childsupport_is {
    type: number
    sql: ${TABLE}.income_childsupport_is ;;
  }

  dimension: income_earned {
    type: number
    sql: ${TABLE}.income_earned ;;
  }

  dimension: income_earned_is {
    type: number
    #     hidden: true
    sql: ${TABLE}.income_earned_is ;;
  }

  dimension: income_status {
    sql: CASE
      WHEN ${income_earned_is} = 1 THEN 'Has Income'
      WHEN ${income_earned_is} = 0 THEN 'No Income'
      ELSE 'Not Asked'
      END
       ;;
  }

  measure: count_with_income {
    type: count_distinct
    sql: ${ref_client} ;;

    filters: {
      field: income_status
      value: "Has Income"
    }
  }

  measure: count_asked_about_income {
    hidden: yes
    type: count_distinct
    sql: ${ref_client} ;;

    filters: {
      field: income_status
      value: "No Income,Has Income"
    }
  }

  measure: percent_with_income {
    type: number
    value_format: "%0.1f%"
    sql: 100.0 * ${count_with_income} / NULLIF(${count_asked_about_income},0) ;;
  }

  dimension: income_ga {
    type: number
    sql: ${TABLE}.income_ga ;;
  }

  dimension: income_ga_is {
    type: number
    sql: ${TABLE}.income_ga_is ;;
  }

  dimension: income_individual {
    type: number
    sql: ${TABLE}.income_individual ;;
  }

  dimension: income_other {
    type: number
    sql: ${TABLE}.income_other ;;
  }

  dimension: income_other_is {
    type: number
    sql: ${TABLE}.income_other_is ;;
  }

  dimension: income_other_source {
    sql: ${TABLE}.income_other_source ;;
  }

  dimension: income_private_disability {
    type: number
    sql: ${TABLE}.income_private_disability ;;
  }

  dimension: income_private_disability_is {
    type: number
    sql: ${TABLE}.income_private_disability_is ;;
  }

  dimension: income_private_pension {
    type: number
    sql: ${TABLE}.income_private_pension ;;
  }

  dimension: income_private_pension_is {
    type: number
    sql: ${TABLE}.income_private_pension_is ;;
  }

  dimension: income_spousal_support {
    type: number
    sql: ${TABLE}.income_spousal_support ;;
  }

  dimension: income_spousal_support_is {
    type: number
    sql: ${TABLE}.income_spousal_support_is ;;
  }

  dimension: income_ss_retirement {
    type: number
    sql: ${TABLE}.income_ss_retirement ;;
  }

  dimension: income_ss_retirement_is {
    type: number
    sql: ${TABLE}.income_ss_retirement_is ;;
  }

  dimension: income_ssdi {
    type: number
    sql: ${TABLE}.income_ssdi ;;
  }

  dimension: income_ssdi_is {
    type: number
    sql: ${TABLE}.income_ssdi_is ;;
  }

  dimension: income_ssi {
    type: number
    sql: ${TABLE}.income_ssi ;;
  }

  dimension: income_ssi_is {
    type: number
    sql: ${TABLE}.income_ssi_is ;;
  }

  dimension: income_tanf {
    type: number
    sql: ${TABLE}.income_tanf ;;
  }

  dimension: income_tanf_is {
    type: number
    sql: ${TABLE}.income_tanf_is ;;
  }

  dimension: income_unemployment {
    type: number
    sql: ${TABLE}.income_unemployment ;;
  }

  dimension: income_unemployment_is {
    type: number
    sql: ${TABLE}.income_unemployment_is ;;
  }

  dimension: income_vet_disability {
    type: number
    sql: ${TABLE}.income_vet_disability ;;
  }

  dimension: income_vet_disability_is {
    type: number
    sql: ${TABLE}.income_vet_disability_is ;;
  }

  dimension: income_vet_pension {
    type: number
    sql: ${TABLE}.income_vet_pension ;;
  }

  dimension: income_vet_pension_is {
    type: number
    sql: ${TABLE}.income_vet_pension_is ;;
  }

  dimension: income_workers_comp {
    type: number
    sql: ${TABLE}.income_workers_comp ;;
  }

  dimension: income_workers_comp_is {
    type: number
    sql: ${TABLE}.income_workers_comp_is ;;
  }

  dimension_group: last_updated {
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.last_updated ;;
  }

  dimension: marital_status {
    type: number
    sql: ${TABLE}.marital_status ;;
  }

  dimension_group: move_in {
    type: time
    timeframes: [date, week, month]
    convert_tz: no
    sql: ${TABLE}.move_in_date ;;
  }

  dimension: permanent_housing_is {
    type: number
    sql: ${TABLE}.permanent_housing_is ;;
  }

  dimension: prior_city {
    sql: ${TABLE}.prior_city ;;
  }

  dimension: prior_duration {
    type: number
    sql: ${TABLE}.prior_duration ;;
  }

  dimension: prior_residence {
    type: number
    sql: ${TABLE}.prior_residence ;;
  }

  dimension: prior_residence_other {
    sql: ${TABLE}.prior_residence_other ;;
  }

  dimension: prior_state {
    sql: ${TABLE}.prior_state ;;
  }

  dimension: prior_street_address {
    sql: ${TABLE}.prior_street_address ;;
  }

  dimension_group: program {
    type: time
    timeframes: [date, week, month]
    convert_tz: no
    sql: ${TABLE}.program_date ;;
  }

  dimension_group: program_entry {
    type: time
    timeframes: [date, week, month]
    convert_tz: no
    sql: ${TABLE}.program_entry ;;
  }

  dimension_group: program_exit {
    type: time
    timeframes: [date, week, month]
    convert_tz: no
    sql: ${TABLE}.program_exit ;;
  }

  dimension: ref_agency {
    type: number
    sql: ${TABLE}.ref_agency ;;
  }

  dimension: ref_client {
    type: number
    sql: ${TABLE}.ref_client ;;
  }

  dimension: ref_program {
    type: number
    sql: ${TABLE}.ref_program ;;
  }

  dimension: ref_user {
    type: number
    sql: ${TABLE}.ref_user ;;
  }

  dimension: ref_user_updated {
    type: number
    sql: ${TABLE}.ref_user_updated ;;
  }

  dimension: screen_type {
    type: number
    sql: ${TABLE}.screen_type ;;
  }

  dimension: screen_type_text {
    sql: CASE
      WHEN ${screen_type} = 2 THEN '1 - Enrollment'
      WHEN ${screen_type} = 3 THEN '2 - Update'
      WHEN ${screen_type} = 4 THEN '4 - Exit'
      WHEN ${screen_type} = 5 THEN '3 - Annual Assessment'
      END
       ;;
  }

  dimension: ssvf_targeting_field_20 {
    label: "HP Applicant Total Points (integer)"
    type: number
    sql: ${TABLE}.ssvf_targeting_field_20 ;;
  }

  dimension: ssvf_targeting_field_21 {
    label: "Grantee Targeting Threshold Score (integer)"
    type: number
    sql: ${TABLE}.ssvf_targeting_field_21 ;;
  }

  dimension: zipcode {
    type: zipcode
    sql: ${TABLE}.zipcode ;;
  }

  dimension: zipcode_quality {
    type: number
    sql: ${TABLE}.zipcode_quality ;;
  }

  measure: count {
    type: count
   # drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------

}
