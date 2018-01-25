view: client_assessments {
  sql_table_name: client_assessment_demographics
    ;;

  dimension: id {
    primary_key: yes
    label: "Assessment ID"
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension_group: added {
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.added_date ;;
  }

  dimension_group: updated {
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.last_updated ;;
  }

  dimension: assessment_name {
    sql: ${screens.name} ;;
  }

  dimension: assessment_score {
    type: number
    value_format: "0.##"
    sql: ${client_assessment_scores.score} ;;
  }

  dimension: custom_score_description {
    label: "Score Tier Description"
    description: "Score Range - Processor Specific"
    group_label: "Assessment Score Tiers (Per Processor)"
    type: string
    sql: ${custom_score_ranges.name} ;;
  }

  #dimension: custom_score_type {
  #  label: "Score Tier - Score Type"
  #  group_label: "Custom Assessment Score Tier"
  #  type: string
  #  sql: ${custom_score_ranges.score_type} ;;
  #}

  dimension: custom_score_start {
    label: "Score Range - Start"
    hidden:  yes
    description: "Score Range Start"
    group_label: "Assessment Score Tiers (Per Processor)"
    type: string
    sql: ${custom_score_ranges.start} ;;
  }

  dimension: custom_score_end {
    label: "Score Range - End"
    hidden:  yes
    description: "Score Range End"
    group_label: "Assessment Score Tiers (Per Processor)"
    type: string
    sql: ${custom_score_ranges.end} ;;
  }

  dimension: custom_score_range {
    label: "Score Tier"
    description: "Score Range"
    group_label: "Assessment Score Tiers (Per Processor)"
    type: string
    sql: CONCAT(${custom_score_ranges.start}, " - ", ${custom_score_end}) ;;
  }





  measure: count_assessment_score {
    description: "Count of Assessments with a Score"
    type: count

    filters: {
      field: assessment_score
      value: "NOT NULL"
    }
  }

  dimension: deleted {
    hidden: yes
    sql: ${TABLE}.deleted ;;
  }

  dimension: private {
    type: yesno
    description: "is this assessment private yes/no"
    sql: ${TABLE}.private ;;
  }

  dimension: sub_score_general {
    type: number
    group_label: "VI--SPDAT assessment_questions"
    sql: ${client_assessment_scores.e} ;;
  }

  dimension: sub_score_housing {
    type: number
    group_label: "VI--SPDAT assessment_questions"
    sql: ${client_assessment_scores.a} ;;
  }

  dimension: sub_score_risks {
    type: number
    group_label: "VI--SPDAT assessment_questions"
    sql: ${client_assessment_scores.b} ;;
  }

  dimension: sub_score_socilization {
    type: number
    label: "Sub Score Socialization"
    group_label: "VI--SPDAT assessment_questions"
    sql: ${client_assessment_scores.c} ;;
  }

  dimension: sub_score_wellness {
    type: number
    group_label: "VI--SPDAT assessment_questions"
    sql: ${client_assessment_scores.d} ;;
  }

  dimension: vi_spdat_q13_v2 {
    label: "Socialization - Basic Needs Self Care"
    group_label: "VI--SPDAT assessment_questions"
    sql: fn_getPicklistValueName('vi_spdat_q13_v2',${TABLE}.vi_spdat_q13_v2) ;;
  }

  dimension: vi_spdat_q15_v2 {
    label: "Wellness - Physical Health Reason Lose Housing"
    group_label: "VI--SPDAT assessment_questions"
    sql: fn_getPicklistValueName('vi_spdat_q15_v2',${TABLE}.vi_spdat_q15_v2) ;;
  }

  dimension: vi_spdat_q18_v2 {
    label: "Wellness - Physical Disability Limit Housing Options"
    group_label: "VI--SPDAT assessment_questions"
    sql: fn_getPicklistValueName('vi_spdat_q18_v2',${TABLE}.vi_spdat_q18_v2) ;;
  }

  dimension: vi_spdat_q23c_v2 {
    label: "Wellness - Learning disability, developmental disability, or other impairment"
    group_label: "VI--SPDAT assessment_questions"
    sql: fn_getPicklistValueName('vi_spdat_q23c_v2',${TABLE}.vi_spdat_q23c_v2) ;;
  }

  measure: assessment_score_average {
    description: "Mean average of the Assessment Score"
    type: average
    sql: ${client_assessment_scores.score} ;;
  }

  dimension: assessment_score_tier {
    type: tier
    style: integer
    tiers: [1, 5, 10, 21, 30]
    sql: ${assessment_score} ;;
  }


  dimension_group: assessment {
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.assessment_date ;;
  }

  measure: first_assessment {
    label: "First Assessment Date"
    description: "Earliest (minimum) Assessment Date"
    type: date
    sql: CASE
      WHEN Min(COALESCE(${assessment_date},'1900-01-01')) = '1900-01-01' THEN
      NULL
      ELSE Min(COALESCE(${assessment_date},'1900-01-01'))
      END
       ;;
  }

  measure: last_assessment_date {
    label: "Last Assessment Date"
    description: "Latest (maximum) Assessment date"
    type: date_time
    sql: MAX(${assessment_date}) ;;
  }

  measure: last_assessment_id {
    label: "Last Assessment ID"
    description: "Latest (maximum) Assessment ID"
    type: number
    sql: MAX(${id}) ;;
  }

  dimension: last_assessment_by_id {
    label: "Last Assessment ID"
    type: number
    sql: ${client_last_assessment_id.id} ;;
  }

  dimension: high_assessment_id_score {
    label: "Assessment by High Score"
    description: "Assessment ID by high score"
    type: number
    value_format_name: id
    sql: ${client_assessment_high_score.ref_assessment}  ;;
  }

  #measure: is_highest_assessment_score{
  #  label: "High Assessment Score ID"
  #  sql: ${client_assessment_high_score.ref_assessment} ;;
  #}

  #dimension: high_assessment_score {
  #  label: "Assessment by High Score - Score"
  #  description: "Assessment ID by high score"
  #  type: number
  #  value_format_name: id
  #  sql: ${client_assessment_high_score.score} ;;
  #}

  dimension: is_latest_assessment {
    label: "Is Latest Assessment"
    type: yesno
    description: "This is the latest assessment of its kind (based on date)"
    sql:  ${id} = ${client_last_assessment.id} ;;
  }

  #   - dimension: benefit_snap
  #     type:number
  #     sql: ${TABLE}.benefit_snap
  #
  #   - dimension: benefits_medicaid
  #     type:number
  #     sql: ${TABLE}.benefits_medicaid
  #
  dimension: benefits_medicare {
    label: "Insurance - Medicare"
    type: yesno
    group_label: "VI--SPDAT assessment_questions"
    sql: ${TABLE}.benefits_medicare ;;
  }

  #
  dimension: benefits_no_insurance {
    label: "Insurance - None"
    type: yesno
    group_label: "VI--SPDAT assessment_questions"
    sql: ${TABLE}.benefits_no_insurance ;;
  }

  dimension: other_health_insurance {
    label: "Insurance - Other"
    type: yesno
    group_label: "VI--SPDAT assessment_questions"
    sql: ${TABLE}.other_health_insurance ;;
  }

  #
  #   - dimension: benefits_noncash
  #     type:number
  #     sql: ${TABLE}.benefits_noncash
  #
  #   - dimension: benefits_other
  #     type:number
  #     sql: ${TABLE}.benefits_other
  #
  #   - dimension: benefits_other_source
  #     sql: ${TABLE}.benefits_other_source
  #
  dimension: benefits_private_insurance {
    label: "Insurance - Private Insurance"
    type: yesno
    group_label: "VI--SPDAT assessment_questions"
    sql: ${TABLE}.benefits_private_insurance ;;
  }

  #
  #   - dimension: benefits_schip
  #     type:number
  #     sql: ${TABLE}.benefits_schip
  #
  #   - dimension: benefits_section8
  #     type:number
  #     sql: ${TABLE}.benefits_section8
  #
  #   - dimension: benefits_tanf_childcare
  #     type:number
  #     sql: ${TABLE}.benefits_tanf_childcare
  #
  #   - dimension: benefits_tanf_other
  #     type:number
  #     sql: ${TABLE}.benefits_tanf_other
  #
  #   - dimension: benefits_tanf_transportation
  #     type:number
  #     sql: ${TABLE}.benefits_tanf_transportation
  #
  #   - dimension: benefits_temp_rent
  #     type:number
  #     sql: ${TABLE}.benefits_temp_rent
  #
  dimension: benefits_va_medical {
    label: "Insurance - VA Medical"
    type: yesno
    group_label: "VI--SPDAT assessment_questions"
    sql: ${TABLE}.benefits_va_medical ;;
  }

  #
  #   - dimension: benefits_wic
  #     type:number
  #     sql: ${TABLE}.benefits_wic
  #
  #   - dimension: birth_nation
  #     type:number
  #     sql: ${TABLE}.birth_nation
  #
  dimension: chronic_1 {
    type:number
    hidden: yes
    sql: ${TABLE}.chronic_1 ;;

  }

  dimension: chronic_1_text {
    label: "Continually Homeless for at Least One Year"
    description: "3.17 Length of Time on Street, in an Emergency Shelter, or Safe Haven Continually Homeless for at Least One Year"
    type:number
    sql: fn_getPicklistValueName('chronic_1',${chronic_1}) ;;
  }

  dimension: chronic_2 {
    hidden: yes
       type:number
       sql: ${TABLE}.chronic_2 ;;
  }

  dimension: chronic_2_text {
    label: "Times Homeless in the Past Three Years"
    description: "Regardless of where they stayed last night - Number of times the client has been on the streets, in ES, or SH in the past three years including today"
    type:number
    sql: fn_getPicklistValueName('chronic_2',${chronic_2}) ;;
  }
  dimension: chronic_3 {
    hidden: yes
       type:number
       sql: ${TABLE}.chronic_3 ;;
  }

  dimension: chronic_3_text {
    label: "Total Months Homeless in the Past Three years"
    description: "Total Number of Months Homeless in the Past Three years"
    type:number
    sql: fn_getPicklistValueName('chronic_3',${chronic_3}) ;;
  }
  dimension: chronic_4 {
    label: "Total Months Continuously Homeless Prior to Entry"
    type:number
    sql: ${TABLE}.chronic_4 ;;
  }

  dimension: chronic_5 {
    label: "Homeless Status Documented"
    type:number
    sql: ${TABLE}.chronic_5 ;;
  }


  dimension: chronic_6 {
    hidden: yes
    type:number
    sql: ${TABLE}.chronic_6 ;;
  }

  dimension: chronic_6_text {
    label: "On the night before - stayed on the streets, ES or Safe Haven"
    description: "On the night before entering the most recent type of residence, record whether the client stayed on the streets, ES or SH"
    type:number
    sql: fn_getPicklistValueName('chronic_6',${chronic_6}) ;;
  }

  dimension: chronic_7 {
    label: "Approximate Date Homelessness Started"
    description: "The approximate date the homeless situation began."
    type:date
    sql: ${TABLE}.chronic_7 ;;
  }


#  dimension: chronic_7_text {
#    label: "Approximate Date Homelessness Started"
#    description: "The approximate date the homeless situation began."
#    type:number
#    sql: fn_getPicklistValueName('chronic_7',${chronic_7}) ;;
#  }

  dimension: chronic_homeless {
    type:number
    sql: ${TABLE}.chronic_homeless ;;

  }

  dimension: citizen_status {
    label: "Background - Citizen Status"
    group_label: "VI--SPDAT assessment_questions"
    sql: fn_getPicklistValueName('citizen_status',${TABLE}.citizen_status) ;;
  }

  #
  #   - dimension: client_location
  #     sql: ${TABLE}.client_location
  #
  #   - dimension: deleted
  #     type: yesno
  #     sql: ${TABLE}.deleted
  #
  dimension: disabled {
    description: "Disabling Condition (HMIS Data Element 3.8)"
    type: yesno
    sql: ${TABLE}.disabled ;;
  }

  #
  #   - dimension: dob_quality
  #     type:number
  #     sql: ${TABLE}.dob_quality
  #
  #   - dimension: domain_01
  #     type:number
  #     sql: ${TABLE}.domain_01
  #
  #   - dimension: domain_02
  #     type:number
  #     sql: ${TABLE}.domain_02
  #
  #   - dimension: domain_03
  #     type:number
  #     sql: ${TABLE}.domain_03
  #
  #   - dimension: domain_04
  #     type:number
  #     sql: ${TABLE}.domain_04
  #
  #   - dimension: domain_05
  #     type:number
  #     sql: ${TABLE}.domain_05
  #
  #   - dimension: domain_06
  #     type:number
  #     sql: ${TABLE}.domain_06
  #
  #   - dimension: domain_07
  #     type:number
  #     sql: ${TABLE}.domain_07
  #
  #   - dimension: domain_08
  #     type:number
  #     sql: ${TABLE}.domain_08
  #
  #   - dimension: domain_09
  #     type:number
  #     sql: ${TABLE}.domain_09
  #
  #   - dimension: domain_10
  #     type:number
  #     sql: ${TABLE}.domain_10
  #
  #   - dimension: domain_11
  #     type:number
  #     sql: ${TABLE}.domain_11
  #
  #   - dimension: domain_12
  #     type:number
  #     sql: ${TABLE}.domain_12
  #
  #   - dimension: domain_13
  #     type:number
  #     sql: ${TABLE}.domain_13
  #
  #   - dimension: domain_14
  #     type:number
  #     sql: ${TABLE}.domain_14
  #
  #   - dimension: domain_15
  #     type:number
  #     sql: ${TABLE}.domain_15
  #
  #   - dimension: domain_16
  #     type:number
  #     sql: ${TABLE}.domain_16
  #
  #   - dimension: domain_17
  #     type:number
  #     sql: ${TABLE}.domain_17
  #
  #   - dimension: domain_18
  #     type:number
  #     sql: ${TABLE}.domain_18
  #
  #   - dimension: drivers_license
  #     sql: ${TABLE}.drivers_license
  #
    dimension: education_child_barriers {
      group_label: "Education - Child"
      type:number
      sql: ${TABLE}.education_child_barriers ;;
    }

    dimension: education_child_enrolled {
      group_label: "Education - Child"
      type:number
      sql: ${TABLE}.education_child_enrolled ;;
    }

    dimension_group: education_child_last {
      group_label: "Education - Child"
      type: time
      timeframes: [time, date, week, month]
      convert_tz: no
      sql: ${TABLE}.education_child_last_date ;;
    }

    dimension: education_child_liaison {
      group_label: "Education - Child"
      type:number
      sql: ${TABLE}.education_child_liaison ;;
    }

    dimension: education_child_school {
      group_label: "Education - Child"
      sql: ${TABLE}.education_child_school ;;
    }

    dimension: education_child_type {
      group_label: "Education - Child"
      type:number
      sql: ${TABLE}.education_child_type ;;
    }

    dimension: education_degree {
      type:number
      sql: ${TABLE}.education_degree ;;
    }
  #
    dimension: education_enrolled {
      type:number
      sql: ${TABLE}.education_enrolled ;;
    }
  #
  #   - dimension: education_level
  #     type:number
  #     sql: ${TABLE}.education_level
  #
    dimension: education_vocational {
      type:number
      sql: ${TABLE}.education_vocational ;;
    }

    dimension: employment_hours {
      label: "Hours Worked Last Week"
      type:number
      sql: ${TABLE}.employment_hours ;;
    }

  #   - dimension: employment_is
  #     type:number
  #     sql: ${TABLE}.employment_is
  #
    dimension: employment_seeking {
       type:number
       sql: ${TABLE}.employment_seeking ;;
    }
  #
  #   - dimension: employment_status
  #     type:number
  #     sql: ${TABLE}.employment_status
  #
    dimension: employment_tenure {
       type:number
       sql: ${TABLE}.employment_tenure ;;
    }

  #   - dimension: ethnicity
  #     type:number
  #     sql: ${TABLE}.ethnicity
  #
  #   - dimension: exit_destination
  #     type:number
  #     sql: ${TABLE}.exit_destination
  #
  #   - dimension: exit_destination_other
  #     sql: ${TABLE}.exit_destination_other
  #
  #   - dimension: exit_reason
  #     type:number
  #     sql: ${TABLE}.exit_reason
  #
  #   - dimension: gender
  #     type:number
  #     sql: ${TABLE}.gender
  #
  #   - dimension: gender_other
  #     sql: ${TABLE}.gender_other
  #
  #   - dimension: gross_ann_hsld_income
  #     type: number
  #     sql: ${TABLE}.gross_ann_hsld_income
  #
  #   - dimension: gross_ann_ind_income
  #     type: number
  #     sql: ${TABLE}.gross_ann_ind_income
  #
  #   - dimension: health_chronic
  #     type:number
  #     sql: ${TABLE}.health_chronic
  #
  #   - dimension: health_chronic_documented
  #     type:number
  #     sql: ${TABLE}.health_chronic_documented
  #
  #   - dimension: health_chronic_longterm
  #     type:number
  #     sql: ${TABLE}.health_chronic_longterm
  #
  #   - dimension: health_chronic_services
  #     type:number
  #     sql: ${TABLE}.health_chronic_services
  #
  #   - dimension: health_dev_disability
  #     type:number
  #     sql: ${TABLE}.health_dev_disability
  #
  dimension: health_dev_disability_documented {
    label: "Developmental Documented"
    hidden: yes
    group_label: "Disability Types"
    sql: fn_getPicklistValueName('health_dev_disability_documented',${TABLE}.health_dev_disability_documented) ;;
    }
  #
  dimension: health_dev_disability_independence {
    label: "Developmental Independence"
    group_label: "Disability Types"
    sql: fn_getPicklistValueName('health_dev_disability_independence',${TABLE}.health_dev_disability_independence) ;;
    }
  #
  dimension: health_dev_disability_services {
    label: "Developmental Services"
    hidden: yes
    group_label: "Disability Types"
    sql: fn_getPicklistValueName('health_dev_disability_services',${TABLE}.health_dev_disability_services) ;;
    }
  #
  #   - dimension: health_dv
  #     type:number
  #     sql: ${TABLE}.health_dv
  #
  #   - dimension: health_dv_occurred
  #     type:number
  #     sql: ${TABLE}.health_dv_occurred
  #
  #   - dimension: health_general
  #     type:number
  #     sql: ${TABLE}.health_general
  #
  #   - dimension: health_hiv
  #     type:number
  #     sql: ${TABLE}.health_hiv
  #
  #   - dimension: health_hiv_documented
  #     type:number
  #     sql: ${TABLE}.health_hiv_documented
  #
  #   - dimension: health_hiv_independence
  #     type:number
  #     sql: ${TABLE}.health_hiv_independence
  #
  #   - dimension: health_hiv_services
  #     type:number
  #     sql: ${TABLE}.health_hiv_services
  #
  #   - dimension: health_ins_cobra
  #     type:number
  #     sql: ${TABLE}.health_ins_cobra
  #
  #   - dimension: health_ins_emp
  #     type:number
  #     sql: ${TABLE}.health_ins_emp
  #
  #   - dimension: health_ins_ppay
  #     type:number
  #     sql: ${TABLE}.health_ins_ppay
  #
  #   - dimension: health_ins_state
  #     type:number
  #     sql: ${TABLE}.health_ins_state
  #
  #   - dimension: health_insurance
  #     type:number
  #     sql: ${TABLE}.health_insurance
  #

  #   - dimension: health_mental_confirmed
  #     type:number
  #     sql: ${TABLE}.health_mental_confirmed
  #
  dimension: health_mental_documented {
    group_label: "VI--SPDAT assessment_questions"
    hidden: yes
    sql: fn_getPicklistValueName('health_mental_documented',${TABLE}.health_mental_documented) ;;
  }

  #
  #   - dimension: health_mental_smi
  #     type:number
  #     sql: ${TABLE}.health_mental_smi
  #
  dimension: health_phys_disability {
    label: "Background - Physical Disability Limits Mobility"
    group_label: "VI--SPDAT assessment_questions"
    sql: fn_getPicklistValueName('health_phys_disability',${TABLE}.health_phys_disability) ;;
  }

  #
  #   - dimension: health_phys_disability_documented
  #     type:number
  #     sql: ${TABLE}.health_phys_disability_documented
  #

  #
  #   - dimension: health_pregnancy
  #     type:number
  #     sql: ${TABLE}.health_pregnancy
  #
  #   - dimension_group: health_pregnancy
  #     type: time
  #     timeframes: [date, week, month]
  #     convert_tz: false
  #     sql: ${TABLE}.health_pregnancy_date
  #

  #   - dimension: health_substance_abuse_confirmed
  #     type:number
  #     sql: ${TABLE}.health_substance_abuse_confirmed
  #
  dimension: health_substance_abuse_documented {
    group_label: "VI--SPDAT assessment_questions"
    hidden: yes
    sql: fn_getPicklistValueName('health_substance_abuse_documented',${TABLE}.health_substance_abuse_documented) ;;
  }

  #   - dimension: housing_ass_exit
  #     type:number
  #     sql: ${TABLE}.housing_ass_exit
  #
  #   - dimension: housing_ass_exit_1
  #     type:number
  #     sql: ${TABLE}.housing_ass_exit_1
  #
  #   - dimension: housing_ass_exit_2
  #     type:number
  #     sql: ${TABLE}.housing_ass_exit_2
  #
  #   - dimension: housing_status
  #     type:number
  #     sql: ${TABLE}.housing_status
  #
  #   - dimension: income_cash
  #     type: number
  #     sql: ${TABLE}.income_cash
  #
  #   - dimension: income_cash_is
  #     type:number
  #     sql: ${TABLE}.income_cash_is
  #
  #   - dimension: income_childsupport
  #     type: number
  #     sql: ${TABLE}.income_childsupport
  #
  #   - dimension: income_childsupport_is
  #     type:number
  #     sql: ${TABLE}.income_childsupport_is
  #
  #   - dimension: income_earned
  #     type: number
  #     sql: ${TABLE}.income_earned
  #
  #   - dimension: income_earned_is
  #     type:number
  #     sql: ${TABLE}.income_earned_is
  #
  #   - dimension: income_ga
  #     type: number
  #     sql: ${TABLE}.income_ga
  #
  #   - dimension: income_ga_is
  #     type:number
  #     sql: ${TABLE}.income_ga_is
  #
  #   - dimension: income_individual
  #     type: number
  #     sql: ${TABLE}.income_individual
  #
  #   - dimension: income_other
  #     type: number
  #     sql: ${TABLE}.income_other
  #
  #   - dimension: income_other_is
  #     type:number
  #     sql: ${TABLE}.income_other_is
  #
  #   - dimension: income_other_source
  #     sql: ${TABLE}.income_other_source
  #
  #   - dimension: income_private_disability
  #     type: number
  #     sql: ${TABLE}.income_private_disability
  #
  #   - dimension: income_private_disability_is
  #     type:number
  #     sql: ${TABLE}.income_private_disability_is
  #
  #   - dimension: income_private_pension
  #     type: number
  #     sql: ${TABLE}.income_private_pension
  #
  #   - dimension: income_private_pension_is
  #     type:number
  #     sql: ${TABLE}.income_private_pension_is
  #
  #   - dimension: income_spousal_support
  #     type: number
  #     sql: ${TABLE}.income_spousal_support
  #
  #   - dimension: income_spousal_support_is
  #     type:number
  #     sql: ${TABLE}.income_spousal_support_is
  #
  #   - dimension: income_ss_retirement
  #     type: number
  #     sql: ${TABLE}.income_ss_retirement
  #
  #   - dimension: income_ss_retirement_is
  #     type:number
  #     sql: ${TABLE}.income_ss_retirement_is
  #
  #   - dimension: income_ssdi
  #     type: number
  #     sql: ${TABLE}.income_ssdi
  #
  #   - dimension: income_ssdi_is
  #     type:number
  #     sql: ${TABLE}.income_ssdi_is
  #
  #   - dimension: income_ssi
  #     type: number
  #     sql: ${TABLE}.income_ssi
  #
  #   - dimension: income_ssi_is
  #     type:number
  #     sql: ${TABLE}.income_ssi_is
  #
  #   - dimension: income_tanf
  #     type: number
  #     sql: ${TABLE}.income_tanf
  #
  #   - dimension: income_tanf_is
  #     type:number
  #     sql: ${TABLE}.income_tanf_is
  #
  #   - dimension: income_unemployment
  #     type: number
  #     sql: ${TABLE}.income_unemployment
  #
  #   - dimension: income_unemployment_is
  #     type:number
  #     sql: ${TABLE}.income_unemployment_is
  #
  #   - dimension: income_vet_disability
  #     type: number
  #     sql: ${TABLE}.income_vet_disability
  #
  #   - dimension: income_vet_disability_is
  #     type:number
  #     sql: ${TABLE}.income_vet_disability_is
  #
  #   - dimension: income_vet_pension
  #     type: number
  #     sql: ${TABLE}.income_vet_pension
  #
  #   - dimension: income_vet_pension_is
  #     type:number
  #     sql: ${TABLE}.income_vet_pension_is
  #
  #   - dimension: income_workers_comp
  #     type: number
  #     sql: ${TABLE}.income_workers_comp
  #
  #   - dimension: income_workers_comp_is
  #     type:number
  #     sql: ${TABLE}.income_workers_comp_is
  #
  #   - dimension: jewish
  #     type:number
  #     sql: ${TABLE}.jewish
  #
  #   - dimension: jewish_affiliation
  #     type:number
  #     sql: ${TABLE}.jewish_affiliation
  #
  #   - dimension: jewish_rabbi
  #     sql: ${TABLE}.jewish_rabbi
  #
  #   - dimension: jewish_referred
  #     type:number
  #     sql: ${TABLE}.jewish_referred
  #
  #   - dimension_group: last_updated
  #     type: time
  #     timeframes: [time, date, week, month]
  #     sql: ${TABLE}.last_updated
  #
  #   - dimension: marital_status
  #     type:number
  #     sql: ${TABLE}.marital_status
  #
  #   - dimension_group: move_in
  #     type: time
  #     timeframes: [date, week, month]
  #     convert_tz: false
  #     sql: ${TABLE}.move_in_date
  #
  #   - dimension: name_middle
  #     sql: ${TABLE}.name_middle
  #
  #   - dimension: name_quality
  #     type:number
  #     sql: ${TABLE}.name_quality
  #
  #   - dimension: name_suffix
  #     type:number
  #     sql: ${TABLE}.name_suffix
  #
  #   - dimension: pantry_bags
  #     type:number
  #     sql: ${TABLE}.pantry_bags
  #
  #   - dimension: parental_status
  #     type:number
  #     sql: ${TABLE}.parental_status
  #
  #   - dimension: path_engagement
  #     type:number
  #     sql: ${TABLE}.path_engagement
  #
  #   - dimension_group: path_engagement
  #     type: time
  #     timeframes: [date, week, month]
  #     convert_tz: false
  #     sql: ${TABLE}.path_engagement_date
  #
  #   - dimension: path_not_enrolled_reason
  #     type:number
  #     sql: ${TABLE}.path_not_enrolled_reason
  #
  #   - dimension: path_status
  #     type:number
  #     sql: ${TABLE}.path_status
  #
  #   - dimension_group: path_status_determination
  #     type: time
  #     timeframes: [date, week, month]
  #     convert_tz: false
  #     sql: ${TABLE}.path_status_determination
  #
  #   - dimension: path_status_is
  #     type:number
  #     sql: ${TABLE}.path_status_is
  #
  dimension: permanent_housing_is {
    type:number
    sql: ${TABLE}.permanent_housing_is ;;
  }

  dimension: photo_auth {
    label: "Background - Photo Authorization"
    type: yesno
    group_label: "VI--SPDAT assessment_questions"
    sql: ${TABLE}.photo_auth ;;
  }

  #
  #   - dimension: previous_foster_care
  #     type:number
  #     sql: ${TABLE}.previous_foster_care
  #
  dimension: previous_jail {
    label: "Background - Jail Previous"
    group_label: "VI--SPDAT assessment_questions"
    sql: fn_getPicklistValueName('previous_jail',${TABLE}.previous_jail) ;;
  }

  #
  dimension: previous_prison {
    label: "Background - Prison Previous"
    group_label: "VI--SPDAT assessment_questions"
    sql: fn_getPicklistValueName('previous_prison',${TABLE}.previous_prison) ;;
  }

  #
  dimension: primary_language {
    label: "Background - Primary Language"
    group_label: "VI--SPDAT assessment_questions"
    sql: fn_getPicklistValueName('primary_language',${TABLE}.primary_language) ;;
  }

  #
  #   - dimension: prior_address_quality
  #     type:number
  #     sql: ${TABLE}.prior_address_quality
  #
  #   - dimension: prior_city
  #     sql: ${TABLE}.prior_city
  #


  #
  #   - dimension: prior_residence_other
  #     sql: ${TABLE}.prior_residence_other
  #
  #   - dimension: prior_state
  #     sql: ${TABLE}.prior_state
  #
  #   - dimension: prior_street_address
  #     sql: ${TABLE}.prior_street_address
  #
  #   - dimension_group: program_entry
  #     type: time
  #     timeframes: [date, week, month]
  #     convert_tz: false
  #     sql: ${TABLE}.program_entry
  #
  #   - dimension_group: program_exit
  #     type: time
  #     timeframes: [date, week, month]
  #     convert_tz: false
  #     sql: ${TABLE}.program_exit
  #
  #   - dimension: race
  #     type:number
  #     sql: ${TABLE}.race
  #
  dimension: ref_agency {
    hidden: yes
    type: number
    sql: ${TABLE}.ref_agency ;;
  }

  #
  #   - dimension: ref_agency_deleted
  #     type:number
  #     sql: ${TABLE}.ref_agency_deleted
  #
  dimension: ref_assessment {
    type: number
    hidden: yes
    sql: ${TABLE}.ref_assessment ;;
  }

  #
  dimension: ref_client {
    hidden: yes
    type: number
    sql: ${TABLE}.ref_client ;;
  }

  #
  dimension: ref_user {
    label: "User Creating"
    sql: fn_getUserNameById(${TABLE}.ref_user) ;;
  }

  dimension: ref_user_updated {
    label: "User Updating"
    sql: fn_getUserNameById(${TABLE}.ref_user_updated) ;;
  }

  #
  #   - dimension: rhy_bcp_is
  #     type:number
  #     sql: ${TABLE}.rhy_bcp_is
  #
  #   - dimension: rhy_completion_involuntary_reason
  #     type:number
  #     sql: ${TABLE}.rhy_completion_involuntary_reason
  #
  #   - dimension: rhy_completion_status
  #     type:number
  #     sql: ${TABLE}.rhy_completion_status
  #
  #   - dimension: rhy_completion_voluntary_reason
  #     type:number
  #     sql: ${TABLE}.rhy_completion_voluntary_reason
  #
  #   - dimension: rhy_crit_abuse_family
  #     type:number
  #     sql: ${TABLE}.rhy_crit_abuse_family
  #
  #   - dimension: rhy_crit_abuse_youth
  #     type:number
  #     sql: ${TABLE}.rhy_crit_abuse_youth
  #
  #   - dimension: rhy_crit_disability_mental_family
  #     type:number
  #     sql: ${TABLE}.rhy_crit_disability_mental_family
  #
  #   - dimension: rhy_crit_disability_mental_youth
  #     type:number
  #     sql: ${TABLE}.rhy_crit_disability_mental_youth
  #
  #   - dimension: rhy_crit_disability_physical_family
  #     type:number
  #     sql: ${TABLE}.rhy_crit_disability_physical_family
  #
  #   - dimension: rhy_crit_disability_physical_youth
  #     type:number
  #     sql: ${TABLE}.rhy_crit_disability_physical_youth
  #
  #   - dimension: rhy_crit_health_family
  #     type:number
  #     sql: ${TABLE}.rhy_crit_health_family
  #
  #   - dimension: rhy_crit_health_youth
  #     type:number
  #     sql: ${TABLE}.rhy_crit_health_youth
  #
  #   - dimension: rhy_crit_household
  #     type:number
  #     sql: ${TABLE}.rhy_crit_household
  #
  #   - dimension: rhy_crit_housing_family
  #     type:number
  #     sql: ${TABLE}.rhy_crit_housing_family
  #
  #   - dimension: rhy_crit_housing_youth
  #     type:number
  #     sql: ${TABLE}.rhy_crit_housing_youth
  #
  #   - dimension: rhy_crit_identity_family
  #     type:number
  #     sql: ${TABLE}.rhy_crit_identity_family
  #
  #   - dimension: rhy_crit_identity_youth
  #     type:number
  #     sql: ${TABLE}.rhy_crit_identity_youth
  #
  #   - dimension: rhy_crit_incarcerated_parent
  #     type:number
  #     sql: ${TABLE}.rhy_crit_incarcerated_parent
  #
  #   - dimension: rhy_crit_incarcerated_specify
  #     type:number
  #     sql: ${TABLE}.rhy_crit_incarcerated_specify
  #
  #   - dimension: rhy_crit_income_family
  #     type:number
  #     sql: ${TABLE}.rhy_crit_income_family
  #
  #   - dimension: rhy_crit_mental_family
  #     type:number
  #     sql: ${TABLE}.rhy_crit_mental_family
  #
  #   - dimension: rhy_crit_mental_youth
  #     type:number
  #     sql: ${TABLE}.rhy_crit_mental_youth
  #
  #   - dimension: rhy_crit_military_family
  #     type:number
  #     sql: ${TABLE}.rhy_crit_military_family
  #
  #   - dimension: rhy_crit_school_family
  #     type:number
  #     sql: ${TABLE}.rhy_crit_school_family
  #
  #   - dimension: rhy_crit_school_youth
  #     type:number
  #     sql: ${TABLE}.rhy_crit_school_youth
  #
  #   - dimension: rhy_crit_substance_family
  #     type:number
  #     sql: ${TABLE}.rhy_crit_substance_family
  #
  #   - dimension: rhy_crit_substance_youth
  #     type:number
  #     sql: ${TABLE}.rhy_crit_substance_youth
  #
  #   - dimension: rhy_crit_unemployment_family
  #     type:number
  #     sql: ${TABLE}.rhy_crit_unemployment_family
  #
  #   - dimension: rhy_crit_unemployment_youth
  #     type:number
  #     sql: ${TABLE}.rhy_crit_unemployment_youth
  #
  #   - dimension: rhy_dental_health
  #     type:number
  #     sql: ${TABLE}.rhy_dental_health
  #
  #   - dimension: rhy_education_level
  #     type:number
  #     sql: ${TABLE}.rhy_education_level
  #
  #   - dimension: rhy_employment_type
  #     type:number
  #     sql: ${TABLE}.rhy_employment_type
  #
  #   - dimension: rhy_exploitation
  #     type:number
  #     sql: ${TABLE}.rhy_exploitation
  #
  #   - dimension: rhy_exploitation_ask
  #     type:number
  #     sql: ${TABLE}.rhy_exploitation_ask
  #
  #   - dimension: rhy_exploitation_freq
  #     type:number
  #     sql: ${TABLE}.rhy_exploitation_freq
  #
  #   - dimension: rhy_family_reunification
  #     type:number
  #     sql: ${TABLE}.rhy_family_reunification
  #
  #   - dimension: rhy_former_justice
  #     type:number
  #     sql: ${TABLE}.rhy_former_justice
  #
  #   - dimension: rhy_foster_length_months
  #     type:number
  #     sql: ${TABLE}.rhy_foster_length_months
  #
  #   - dimension: rhy_foster_length_years
  #     type:number
  #     sql: ${TABLE}.rhy_foster_length_years
  #
  #   - dimension: rhy_fysb_youth
  #     type:number
  #     sql: ${TABLE}.rhy_fysb_youth
  #
  #   - dimension: rhy_justice_length_months
  #     type:number
  #     sql: ${TABLE}.rhy_justice_length_months
  #
  #   - dimension: rhy_justice_length_years
  #     type:number
  #     sql: ${TABLE}.rhy_justice_length_years
  #
  #   - dimension: rhy_mental_health
  #     type:number
  #     sql: ${TABLE}.rhy_mental_health
  #
  #   - dimension: rhy_no_svc_reason
  #     type:number
  #     sql: ${TABLE}.rhy_no_svc_reason
  #
  #   - dimension: rhy_reason_not_employed
  #     type:number
  #     sql: ${TABLE}.rhy_reason_not_employed
  #
  #   - dimension: rhy_referral_freq_approached
  #     type:number
  #     sql: ${TABLE}.rhy_referral_freq_approached
  #
  #   - dimension: rhy_referral_src
  #     type:number
  #     sql: ${TABLE}.rhy_referral_src
  #
  #   - dimension: rhy_school_status
  #     type:number
  #     sql: ${TABLE}.rhy_school_status
  #

  dimension: rhy_sexual_orientation {
    label: "Sexual Orientation"
    sql: fn_getPicklistValueName('rhy_sexual_orientation',${TABLE}.rhy_sexual_orientation) ;;
  }

  #
  #   - dimension_group: rhy_status_determination
  #     type: time
  #     timeframes: [date, week, month]
  #     convert_tz: false
  #     sql: ${TABLE}.rhy_status_determination
  #
  #   - dimension: rhy_transition_advice
  #     type:number
  #     sql: ${TABLE}.rhy_transition_advice
  #
  #   - dimension: rhy_transition_counseling
  #     type:number
  #     sql: ${TABLE}.rhy_transition_counseling
  #
  #   - dimension: rhy_transition_meeting
  #     type:number
  #     sql: ${TABLE}.rhy_transition_meeting
  #
  #   - dimension: rhy_transition_other
  #     type:number
  #     sql: ${TABLE}.rhy_transition_other
  #
  #   - dimension: rhy_transition_package
  #     type:number
  #     sql: ${TABLE}.rhy_transition_package
  #
  #   - dimension: rhy_transition_permanent
  #     type:number
  #     sql: ${TABLE}.rhy_transition_permanent
  #
  #   - dimension: rhy_transition_plan
  #     type:number
  #     sql: ${TABLE}.rhy_transition_plan
  #
  #   - dimension: rhy_transition_shelter
  #     type:number
  #     sql: ${TABLE}.rhy_transition_shelter
  #
  #   - dimension: rhy_transition_treatment
  #     type:number
  #     sql: ${TABLE}.rhy_transition_treatment
  #
  #   - dimension: soar_alj_attorney
  #     type:number
  #     sql: ${TABLE}.soar_alj_attorney
  #
  #   - dimension: soar_alj_exp_hearing
  #     type:number
  #     sql: ${TABLE}.soar_alj_exp_hearing
  #
  #   - dimension_group: soar_alj_hearing
  #     type: time
  #     timeframes: [date, week, month]
  #     convert_tz: false
  #     sql: ${TABLE}.soar_alj_hearing_date
  #
  #   - dimension: soar_alj_outcome
  #     type:number
  #     sql: ${TABLE}.soar_alj_outcome
  #
  #   - dimension: soar_alj_review_req
  #     type:number
  #     sql: ${TABLE}.soar_alj_review_req
  #
  #   - dimension: soar_appeal_filed
  #     type:number
  #     sql: ${TABLE}.soar_appeal_filed
  #
  #   - dimension: soar_appeal_level
  #     type:number
  #     sql: ${TABLE}.soar_appeal_level
  #
  #   - dimension: soar_connected
  #     type:number
  #     sql: ${TABLE}.soar_connected

  dimension: soar_connected {
    label: "Soar Connected"
    sql: ${TABLE}.soar_connected ;;
  }
  #
  #   - dimension_group: soar_consent_faxed
  #     type: time
  #     timeframes: [date, week, month]
  #     convert_tz: false
  #     sql: ${TABLE}.soar_consent_faxed
  #
  #   - dimension: soar_consult_exam
  #     type:number
  #     sql: ${TABLE}.soar_consult_exam
  #
  #   - dimension: soar_county
  #     sql: ${TABLE}.soar_county
  #
  #   - dimension: soar_decision_not_reason
  #     type:number
  #     sql: ${TABLE}.soar_decision_not_reason
  #
  #   - dimension: soar_decision_received
  #     type:number
  #     sql: ${TABLE}.soar_decision_received
  #
  #   - dimension: soar_denial_reason
  #     type:number
  #     sql: ${TABLE}.soar_denial_reason
  #
  #   - dimension: soar_ga_reimbursement
  #     type: number
  #     sql: ${TABLE}.soar_ga_reimbursement
  #
  #   - dimension: soar_hours
  #     type:number
  #     sql: ${TABLE}.soar_hours
  #
  #   - dimension_group: soar_housed
  #     type: time
  #     timeframes: [date, week, month]
  #     convert_tz: false
  #     sql: ${TABLE}.soar_housed
  #
  #   - dimension_group: soar_initial_decision
  #     type: time
  #     timeframes: [date, week, month]
  #     convert_tz: false
  #     sql: ${TABLE}.soar_initial_decision
  #
  #   - dimension: soar_initial_outcome
  #     type:number
  #     sql: ${TABLE}.soar_initial_outcome
  #
  #   - dimension: soar_med_cosign
  #     type:number
  #     sql: ${TABLE}.soar_med_cosign
  #
  #   - dimension: soar_med_records
  #     type:number
  #     sql: ${TABLE}.soar_med_records
  #
  #   - dimension: soar_med_summary
  #     type:number
  #     sql: ${TABLE}.soar_med_summary
  #
  #   - dimension: soar_medicaid_reimbursement
  #     type: number
  #     sql: ${TABLE}.soar_medicaid_reimbursement
  #
  #   - dimension: soar_medicare_reimbursement
  #     type: number
  #     sql: ${TABLE}.soar_medicare_reimbursement
  #
  #   - dimension: soar_not_submitted
  #     type:number
  #     sql: ${TABLE}.soar_not_submitted
  #
  #   - dimension: soar_not_submitted_reason
  #     type:number
  #     sql: ${TABLE}.soar_not_submitted_reason
  #
  #   - dimension: soar_path
  #     type:number
  #     sql: ${TABLE}.soar_path
  #
  #   - dimension: soar_payee_needed
  #     type:number
  #     sql: ${TABLE}.soar_payee_needed
  #
  #   - dimension: soar_payee_provided
  #     type:number
  #     sql: ${TABLE}.soar_payee_provided
  #
  #   - dimension: soar_pending_status
  #     type:number
  #     sql: ${TABLE}.soar_pending_status
  #
  #   - dimension: soar_quality_review
  #     type:number
  #     sql: ${TABLE}.soar_quality_review
  #
  #   - dimension: soar_reconsideration
  #     type:number
  #     sql: ${TABLE}.soar_reconsideration
  #
  #   - dimension_group: soar_reconsideration
  #     type: time
  #     timeframes: [date, week, month]
  #     convert_tz: false
  #     sql: ${TABLE}.soar_reconsideration_date
  #
  #   - dimension: soar_reconsideration_outcome
  #     type:number
  #     sql: ${TABLE}.soar_reconsideration_outcome
  #
  #   - dimension: soar_region
  #     sql: ${TABLE}.soar_region
  #
  #   - dimension: soar_ssa
  #     type:number
  #     sql: ${TABLE}.soar_ssa
  #
  #   - dimension: soar_ssa_form
  #     type:number
  #     sql: ${TABLE}.soar_ssa_form
  #
  #   - dimension: soar_ssdi_approved
  #     type:number
  #     sql: ${TABLE}.soar_ssdi_approved
  #
  #   - dimension_group: soar_ssi_app
  #     type: time
  #     timeframes: [date, week, month]
  #     convert_tz: false
  #     sql: ${TABLE}.soar_ssi_app
  #
  #   - dimension: soar_ssi_approved
  #     type:number
  #     sql: ${TABLE}.soar_ssi_approved
  #
  #   - dimension: soar_staff
  #     sql: ${TABLE}.soar_staff
  #
  #   - dimension: soar_staff_initiated
  #     type:number
  #     sql: ${TABLE}.soar_staff_initiated
  #
  #   - dimension: soar_staff_ssa
  #     type:number
  #     sql: ${TABLE}.soar_staff_ssa
  #
  #   - dimension: soar_trained
  #     type:number
  #     sql: ${TABLE}.soar_trained
  #
  #   - dimension: ssn_quality
  #     type:number
  #     sql: ${TABLE}.ssn_quality
  #
  #   - dimension: us_citizen
  #     type:number
  #     sql: ${TABLE}.us_citizen
  #

  dimension: veteran {
    label: "Veteran"
    group_label: "VI--SPDAT assessment_questions"
    sql: fn_getPicklistValueName('veteran',${TABLE}.veteran) ;;
  }

  #
  #   - dimension: veteran_branch
  #     type:number
  #     sql: ${TABLE}.veteran_branch
  #
  dimension: veteran_discharge {
    label: "Veteran Discharge"
    group_label: "VI--SPDAT assessment_questions"
    sql: fn_getPicklistValueName('veteran_discharge',${TABLE}.veteran_discharge) ;;
  }

  #
  #   - dimension: veteran_duration
  #     type:number
  #     sql: ${TABLE}.veteran_duration
  #
  #   - dimension: veteran_entered
  #     type:number
  #     sql: ${TABLE}.veteran_entered
  #
  dimension: veteran_era {
    label: "Veteran Era"
    group_label: "VI--SPDAT assessment_questions"
    sql: fn_getPicklistValueName('veteran_era',${TABLE}.veteran_era) ;;
  }

  #
  #   - dimension: veteran_fire
  #     type:number
  #     sql: ${TABLE}.veteran_fire
  #
  #   - dimension: veteran_separated
  #     type:number
  #     sql: ${TABLE}.veteran_separated
  #
  #   - dimension: veteran_theater_afg
  #     type:number
  #     sql: ${TABLE}.veteran_theater_afg
  #
  #   - dimension: veteran_theater_iraq1
  #     type:number
  #     sql: ${TABLE}.veteran_theater_iraq1
  #
  #   - dimension: veteran_theater_iraq2
  #     type:number
  #     sql: ${TABLE}.veteran_theater_iraq2
  #
  #   - dimension: veteran_theater_kw
  #     type:number
  #     sql: ${TABLE}.veteran_theater_kw
  #
  #   - dimension: veteran_theater_other
  #     type:number
  #     sql: ${TABLE}.veteran_theater_other
  #
  #   - dimension: veteran_theater_pg
  #     type:number
  #     sql: ${TABLE}.veteran_theater_pg
  #
  #   - dimension: veteran_theater_vw
  #     type:number
  #     sql: ${TABLE}.veteran_theater_vw
  #
  #   - dimension: veteran_theater_ww2
  #     type:number
  #     sql: ${TABLE}.veteran_theater_ww2
  #
  #   - dimension: veteran_warzone
  #     type:number
  #     sql: ${TABLE}.veteran_warzone
  #
  #   - dimension: veteran_warzone_duration
  #     type:number
  #     sql: ${TABLE}.veteran_warzone_duration
  #
  #   - dimension: veteran_warzone_is
  #     type:number
  #     sql: ${TABLE}.veteran_warzone_is

  #   - dimension_group: vi_f_spdat_child10_dob
  #     type: time
  #     timeframes: [date, week, month]
  #     convert_tz: false
  #     sql: ${TABLE}.vi_f_spdat_child10_dob
  #
   dimension: vi_f_spdat_child10_fullname {
       sql: ${TABLE}.vi_f_spdat_child10_fullname ;;
    }
  #
  #   - dimension_group: vi_f_spdat_child1_dob
  #     type: time
  #     timeframes: [date, week, month]
  #     convert_tz: false
  #     sql: ${TABLE}.vi_f_spdat_child1_dob
  #
      dimension: vi_f_spdat_child1_fullname {
        sql:  ${TABLE}.vi_f_spdat_child1_fullname ;;
      }


  #   - dimension_group: vi_f_spdat_child2_dob
  #     type: time
  #     timeframes: [date, week, month]
  #     convert_tz: false
  #     sql: ${TABLE}.vi_f_spdat_child2_dob
  #
   dimension: vi_f_spdat_child2_fullname {
       sql: ${TABLE}.vi_f_spdat_child2_fullname ;;
      }
  #
  #   - dimension_group: vi_f_spdat_child3_dob
  #     type: time
  #     timeframes: [date, week, month]
  #     convert_tz: false
  #     sql: ${TABLE}.vi_f_spdat_child3_dob
  #
   dimension: vi_f_spdat_child3_fullname {
       sql: ${TABLE}.vi_f_spdat_child3_fullname ;;
      }
  #
  #   - dimension_group: vi_f_spdat_child4_dob
  #     type: time
  #     timeframes: [date, week, month]
  #     convert_tz: false
  #     sql: ${TABLE}.vi_f_spdat_child4_dob
  #
   dimension: vi_f_spdat_child4_fullname {
       sql: ${TABLE}.vi_f_spdat_child4_fullname ;;
      }
  #
  #   - dimension_group: vi_f_spdat_child5_dob
  #     type: time
  #     timeframes: [date, week, month]
  #     convert_tz: false
  #     sql: ${TABLE}.vi_f_spdat_child5_dob
  #
   dimension: vi_f_spdat_child5_fullname {
       sql: ${TABLE}.vi_f_spdat_child5_fullname ;;
      }
  #
  #   - dimension_group: vi_f_spdat_child6_dob
  #     type: time
  #     timeframes: [date, week, month]
  #     convert_tz: false
  #     sql: ${TABLE}.vi_f_spdat_child6_dob
  #
   dimension: vi_f_spdat_child6_fullname {
       sql: ${TABLE}.vi_f_spdat_child6_fullname ;;
      }
  #
  #   - dimension_group: vi_f_spdat_child7_dob
  #     type: time
  #     timeframes: [date, week, month]
  #     convert_tz: false
  #     sql: ${TABLE}.vi_f_spdat_child7_dob
  #
   dimension: vi_f_spdat_child7_fullname {
       sql: ${TABLE}.vi_f_spdat_child7_fullname ;;
      }
  #
  #    dimension_group: vi_f_spdat_child8_dob {
  #     type: time
  #     timeframes: [date, week, month]
  #     convert_tz: no
  #     sql: ${TABLE}.vi_f_spdat_child8_dob ;;
  #}
   dimension: vi_f_spdat_child8_fullname {
       sql: ${TABLE}.vi_f_spdat_child8_fullname ;;
  }
  #   - dimension_group: vi_f_spdat_child9_dob
  #     type: time
  #     timeframes: [date, week, month]
  #     convert_tz: false
  #     sql: ${TABLE}.vi_f_spdat_child9_dob
  #
   dimension: vi_f_spdat_child9_fullname {
     sql: ${TABLE}.vi_f_spdat_child9_fullname ;;
    }
  #
  dimension: vi_f_spdat_children_num {
    label: "Background - Number of Children"
    group_label: "VI-FSPDAT assessment_questions"
    sql: fn_getPicklistValueName('vi_f_spdat_children_num',${TABLE}.vi_f_spdat_children_num) ;;
  }

  #
  dimension: vi_f_spdat_hh2_dob {
    label: "Background - 2nd HoH DoB"
    type: date
    group_label: "VI-FSPDAT assessment_questions"
    convert_tz: no
    sql: ${TABLE}.vi_f_spdat_hh2_dob ;;
  }

  #
   dimension: vi_f_spdat_hh2_fullname {
       sql: ${TABLE}.vi_f_spdat_hh2_fullname ;;
      }
  #
  dimension: vi_f_spdat_hh2_gender {
    label: "Background - 2nd HoH Gender"
    group_label: "VI-FSPDAT assessment_questions"
    sql: fn_getPicklistValueName('vi_f_spdat_hh2_gender',${TABLE}.vi_f_spdat_hh2_gender) ;;
  }

  #



  dimension: vi_f_spdat_child1_dob {
    type: date
    label: "Child  1 DoB"
    group_label: "VI-FSPDAT assessment_questions"
    sql: ${TABLE}.vi_f_spdat_child1_dob ;;
  }

  dimension: vi_f_spdat_child2_dob {
    type: date
    label: "Child  2 DoB"
    group_label: "VI-FSPDAT assessment_questions"
    sql: ${TABLE}.vi_f_spdat_child2_dob ;;
  }

  dimension: vi_f_spdat_child3_dob {
    type: date
    label: "Child  3 DoB"
    group_label: "VI-FSPDAT assessment_questions"
    sql: ${TABLE}.vi_f_spdat_child3_dob ;;
  }

  dimension: vi_f_spdat_child4_dob {
    type: date
    label: "Child  4 DoB"
    group_label: "VI-FSPDAT assessment_questions"
    sql: ${TABLE}.vi_f_spdat_child4_dob ;;
  }

  dimension: vi_f_spdat_child5_dob {
    type: date
    label: "Child  5 DoB"
    group_label: "VI-FSPDAT assessment_questions"
    sql: ${TABLE}.vi_f_spdat_child5_dob ;;
  }

  dimension: vi_f_spdat_child6_dob {
    type: date
    label: "Child  6 DoB"
    group_label: "VI-FSPDAT assessment_questions"
    sql: ${TABLE}.vi_f_spdat_child6_dob ;;
  }

  dimension: vi_f_spdat_child7_dob {
    type: date
    label: "Child  7 DoB"
    group_label: "VI-FSPDAT assessment_questions"
    sql: ${TABLE}.vi_f_spdat_child7_dob ;;
  }

  dimension: vi_f_spdat_child8_dob {
    type: date
    label: "Child  8 DoB"
    group_label: "VI-FSPDAT assessment_questions"
    sql: ${TABLE}.vi_f_spdat_child8_dob ;;
  }

  dimension: vi_f_spdat_child9_dob {
    type: date
    label: "Child  9 DoB"
    group_label: "VI-FSPDAT assessment_questions"
    sql: ${TABLE}.vi_f_spdat_child9_dob ;;
  }

  dimension: vi_f_spdat_child10_dob {
    type: date
    label: "Child 10 DoB"
    group_label: "VI-FSPDAT assessment_questions"
    sql: ${TABLE}.vi_f_spdat_child10_dob ;;
  }

  dimension: vi_f_spdat_pregnancy {
    label: "Wellness - Pregnancy Household"
    group_label: "VI-FSPDAT assessment_questions"
    sql: fn_getPicklistValueName('vi_f_spdat_pregnancy',${TABLE}.vi_f_spdat_pregnancy) ;;
  }

  dimension: vi_spdat_q23a_v2 {
    label: "Wellness - Mental Health Issue or Concern"
    group_label: "VI--SPDAT assessment_questions"
    sql: fn_getPicklistValueName('vi_spdat_q23a_v2',${TABLE}.vi_spdat_q23a_v2) ;;
  }

  dimension: vi_spdat_q23b_v2 {
    label: "Wellness - Head injury"
    group_label: "VI--SPDAT assessment_questions"
    sql: fn_getPicklistValueName('vi_spdat_q23b_v2',${TABLE}.vi_spdat_q23b_v2) ;;
  }

  dimension: vi_f_spdat_q28_v2 {
    label: "Wellness - Tri-morbidity of one household member"
    group_label: "VI-FSPDAT assessment_questions"
    sql: fn_getPicklistValueName('vi_f_spdat_q28_v2',${TABLE}.vi_f_spdat_q28_v2) ;;
  }

  dimension: vi_y_spdat_q1 {
    label: "Housing & Homelessness - Sleep Most Frequently - Youth"
    group_label: "VI-YSPDAT assessment_questions"
    sql: fn_getPicklistValueName('vi_y_spdat_q1',${TABLE}.vi_y_spdat_q1) ;;
  }

  dimension: vi_y_spdat_q15a {
    label: "Socialization - Homeless Because Ran Away"
    group_label: "VI-YSPDAT assessment_questions"
    sql: fn_getPicklistValueName('vi_y_spdat_q15a',${TABLE}.vi_y_spdat_q15a) ;;
  }

  dimension: vi_y_spdat_q15b {
    label: "Socialization - Homeless Because Religious/Cultural Differences"
    group_label: "VI-YSPDAT assessment_questions"
    sql: fn_getPicklistValueName('vi_y_spdat_q15b',${TABLE}.vi_y_spdat_q15b) ;;
  }

  dimension: vi_y_spdat_q15c {
    label: "Socialization - Homeless Because Family or Friends"
    group_label: "VI-YSPDAT assessment_questions"
    sql: fn_getPicklistValueName('vi_y_spdat_q15c',${TABLE}.vi_y_spdat_q15c) ;;
  }

  dimension: vi_y_spdat_q15d {
    label: "Socialization - Homeless Because Conflict Gender Id or Orientation"
    group_label: "VI-YSPDAT assessment_questions"
    sql: fn_getPicklistValueName('vi_y_spdat_q15d',${TABLE}.vi_y_spdat_q15d) ;;
  }

  dimension: vi_y_spdat_q15e {
    label: "Socialization - Homeless Because Violence at Home"
    group_label: "VI-YSPDAT assessment_questions"
    sql: fn_getPicklistValueName('vi_y_spdat_q15e',${TABLE}.vi_y_spdat_q15e) ;;
  }

  dimension: vi_y_spdat_q24 {
    label: "Wellness - Marijuana Use"
    group_label: "VI-YSPDAT assessment_questions"
    sql: fn_getPicklistValueName('vi_y_spdat_q24',${TABLE}.vi_y_spdat_q24) ;;
  }

  dimension: vi_spdat_q8 {
    label: "Risks - Attacked or Beaten since Homeless"
    group_label: "VI--SPDAT assessment_questions"
    sql: fn_getPicklistValueName('vi_spdat_q8',${TABLE}.vi_spdat_q8) ;;
  }

  dimension: vi_spdat_q9 {
    label: "Risks - Threatened to harm self or others in last year"
    group_label: "VI--SPDAT assessment_questions"
    sql: fn_getPicklistValueName('vi_spdat_q9',${TABLE}.vi_spdat_q9) ;;
  }

  dimension: vi_spdat_q24_v2 {
    label: "Wellness - Mental health or brain issues affect Housing"
    group_label: "VI--SPDAT assessment_questions"
    sql: fn_getPicklistValueName('vi_spdat_q24_v2',${TABLE}.vi_spdat_q24_v2) ;;
  }

  dimension: benefits_medicaid {
    label: "Insurance - Medicaid"
    type: yesno
    group_label: "VI--SPDAT assessment_questions"
    sql: ${TABLE}.benefits_medicaid ;;
  }

  dimension: previous_foster_care {
    label: "Background - Foster Care"
    group_label: "VI--SPDAT assessment_questions"
    sql: fn_getPicklistValueName('previous_foster_care',${TABLE}.previous_foster_care) ;;
  }

  dimension: income_individual {
    label: "Income - Total Monthly"
    type: number
    group_label: "VI--SPDAT assessment_questions"
    sql: ${TABLE}.income_individual ;;
  }

  dimension: vi_f_spdat_q32_v2 {
    label: "Family Unit - Children Removed from Family last 180 days"
    group_label: "VI-FSPDAT assessment_questions"
    sql: fn_getPicklistValueName('vi_f_spdat_q32_v2',${TABLE}.vi_f_spdat_q32_v2) ;;
  }

  dimension: vi_f_spdat_q33_v2 {
    label: "Family Unit - Legal Issues in Family"
    group_label: "VI-FSPDAT assessment_questions"
    sql: fn_getPicklistValueName('vi_f_spdat_q33_v2',${TABLE}.vi_f_spdat_q33_v2) ;;
  }

  dimension: vi_f_spdat_q34_v2 {
    label: "Family Unit - Children with other Family or Friends last 180 days"
    group_label: "VI-FSPDAT assessment_questions"
    sql: fn_getPicklistValueName('vi_f_spdat_q34_v2',${TABLE}.vi_f_spdat_q34_v2) ;;
  }

  dimension: vi_f_spdat_q35_v2 {
    label: "Family Unit - Child Trauma or Abuse last 180 days"
    group_label: "VI-FSPDAT assessment_questions"
    sql: fn_getPicklistValueName('vi_f_spdat_q35_v2',${TABLE}.vi_f_spdat_q35_v2) ;;
  }

  dimension: vi_f_spdat_q36_v2 {
    label: "Family Unit - Children Attend School"
    group_label: "VI-FSPDAT assessment_questions"
    sql: fn_getPicklistValueName('vi_f_spdat_q36_v2',${TABLE}.vi_f_spdat_q36_v2) ;;
  }

  dimension: vi_f_spdat_q37_v2 {
    label: "Family Unit - Household Change last 180 days"
    group_label: "VI-FSPDAT assessment_questions"
    sql: fn_getPicklistValueName('vi_f_spdat_q37_v2',${TABLE}.vi_f_spdat_q37_v2) ;;
  }

  dimension: vi_f_spdat_q38_v2 {
    label: "Family Unit - Household Changes Expected in next 180 days"
    group_label: "VI-FSPDAT assessment_questions"
    sql: fn_getPicklistValueName('vi_f_spdat_q38_v2',${TABLE}.vi_f_spdat_q38_v2) ;;
  }

  dimension: vi_f_spdat_q39_v2 {
    label: "Family Unit - Activities Planned Weekly"
    group_label: "VI-FSPDAT assessment_questions"
    sql: fn_getPicklistValueName('vi_f_spdat_q39_v2',${TABLE}.vi_f_spdat_q39_v2) ;;
  }

  dimension: vi_f_spdat_q40a_v2 {
    label: "Family Unit - Unsupervised Children Aged 13 or older"
    group_label: "VI-FSPDAT assessment_questions"
    sql: fn_getPicklistValueName('vi_f_spdat_q40a_v2',${TABLE}.vi_f_spdat_q40a_v2) ;;
  }

  dimension: vi_f_spdat_q40b_v2 {
    label: "Family Unit - Unsupervised Children Aged 12 or younger"
    group_label: "VI-FSPDAT assessment_questions"
    sql: fn_getPicklistValueName('vi_f_spdat_q40b_v2',${TABLE}.vi_f_spdat_q40b_v2) ;;
  }

  dimension: vi_f_spdat_q41_v2 {
    label: "Family Unit - Children Helping with Child Care"
    group_label: "VI-FSPDAT assessment_questions"
    sql: fn_getPicklistValueName('vi_f_spdat_q41_v2',${TABLE}.vi_f_spdat_q41_v2) ;;
  }

  dimension: vi_spdat_q1_v2 {
    label: "Housing & Homelessness - Sleep Most Frequently"
    group_label: "VI--SPDAT assessment_questions"
    sql: fn_getPicklistValueName('vi_spdat_q1_v2',${TABLE}.vi_spdat_q1_v2) ;;
  }

  dimension: vi_spdat_q14_v2 {
    label: "Socialization - Homelessness Caused by Relationship Issues"
    group_label: "VI--SPDAT assessment_questions"
    sql: fn_getPicklistValueName('vi_spdat_q14_v2',${TABLE}.vi_spdat_q14_v2) ;;
  }

  dimension: vi_spdat_q16_v2 {
    label: "Wellness - Chronic Health Issues"
    group_label: "VI--SPDAT assessment_questions"
    sql: fn_getPicklistValueName('vi_spdat_q16_v2',${TABLE}.vi_spdat_q16_v2) ;;
  }

  dimension: vi_spdat_q17_v2 {
    label: "Wellness - HIV/AIDS Program Interest"
    group_label: "VI--SPDAT assessment_questions"
    sql: fn_getPicklistValueName('vi_spdat_q17_v2',${TABLE}.vi_spdat_q17_v2) ;;
  }

  dimension: vi_spdat_q19_v2 {
    label: "Wellness - Avoid Medical Help"
    group_label: "VI--SPDAT assessment_questions"
    sql: fn_getPicklistValueName('vi_spdat_q19_v2',${TABLE}.vi_spdat_q19_v2) ;;
  }

  dimension: vi_spdat_q20_v2 {
    label: "Wellness - Pregnant"
    group_label: "VI--SPDAT assessment_questions"
    sql: fn_getPicklistValueName('vi_spdat_q20_v2',${TABLE}.vi_spdat_q20_v2) ;;
  }

  dimension: vi_spdat_q21_v2 {
    label: "Wellness - Drinking or Drug Use Cause Lose Housing"
    group_label: "VI--SPDAT assessment_questions"
    sql: fn_getPicklistValueName('vi_spdat_q21_v2',${TABLE}.vi_spdat_q21_v2) ;;
  }

  dimension: vi_spdat_q22_v2 {
    label: "Wellness - Drinking or Drug Use Make Difficult to Keep Housing"
    group_label: "VI--SPDAT assessment_questions"
    sql: fn_getPicklistValueName('vi_spdat_q22_v2',${TABLE}.vi_spdat_q22_v2) ;;
  }

  dimension: vi_spdat_q26_v2 {
    label: "Wellness - Medication Selling"
    group_label: "VI--SPDAT assessment_questions"
    sql: fn_getPicklistValueName('vi_spdat_q26_v2',${TABLE}.vi_spdat_q26_v2) ;;
  }

  dimension: vi_spdat_q4f_v2 {
    label: "Risks - Jail Past 6 months"
    group_label: "VI--SPDAT assessment_questions"
    sql: fn_getPicklistValueName('vi_spdat_q4f_v2',${TABLE}.vi_spdat_q4f_v2) ;;
  }

  #
  #   - dimension: vi_f_spdat_q41
  #     type:number
  #     sql: ${TABLE}.vi_f_spdat_q41
  #
  #   - dimension: vi_f_spdat_q50
  #     type:number
  #     sql: ${TABLE}.vi_f_spdat_q50
  #
  #   - dimension: vi_f_spdat_q53
  #     type:number
  #     sql: ${TABLE}.vi_f_spdat_q53
  #
  #   - dimension: vi_f_spdat_q54
  #     type:number
  #     sql: ${TABLE}.vi_f_spdat_q54
  #
  #   - dimension: vi_f_spdat_q55
  #     type:number
  #     sql: ${TABLE}.vi_f_spdat_q55
  #
  #   - dimension: vi_f_spdat_q56
  #     type:number
  #     sql: ${TABLE}.vi_f_spdat_q56
  #
  #   - dimension: vi_f_spdat_q57
  #     type:number
  #     sql: ${TABLE}.vi_f_spdat_q57
  #
  #   - dimension: vi_f_spdat_q58
  #     type:number
  #     sql: ${TABLE}.vi_f_spdat_q58
  #
  #   - dimension: vi_f_spdat_q59
  #     type:number
  #     sql: ${TABLE}.vi_f_spdat_q59
  #
  #   - dimension: vi_f_spdat_q60
  #     type:number
  #     sql: ${TABLE}.vi_f_spdat_q60
  #
  dimension: vi_f_spdat_second_hoh {
    label: "Background - 2nd HoH"
    type: yesno
    group_label: "VI-FSPDAT assessment_questions"
    sql: ${TABLE}.vi_f_spdat_second_hoh ;;
  }

  #
  dimension: vi_spdat_flwup_1 {
    label: "Background - Live Where Before Homeless"
    group_label: "VI--SPDAT assessment_questions"
    sql: fn_getPicklistValueName('vi_spdat_flwup_1',${TABLE}.vi_spdat_flwup_1) ;;
  }

  #
  dimension: vi_spdat_flwup_2 {
    label: "Background - Best Way to Find"
    group_label: "VI--SPDAT assessment_questions"
    sql: ${TABLE}.vi_spdat_flwup_2 ;;
  }

  #
  dimension: vi_spdat_q1 {
    label: "Housing & Homelessness - Time Since Stable Housing"
    group_label: "VI--SPDAT assessment_questions"
    sql: fn_getPicklistValueName('vi_spdat_q1',${TABLE}.vi_spdat_q1) ;;
  }

  #
  dimension: vi_spdat_q10 {
    label: "Risks - Legal Issues"
    group_label: "VI--SPDAT assessment_questions"
    sql: fn_getPicklistValueName('vi_spdat_q10',${TABLE}.vi_spdat_q10) ;;
  }

  #
  dimension: vi_spdat_q11 {
    label: "Risks - Forced or Tricked"
    group_label: "VI--SPDAT assessment_questions"
    sql: fn_getPicklistValueName('vi_spdat_q11',${TABLE}.vi_spdat_q11) ;;
  }

  #
  dimension: vi_spdat_q12 {
    label: "Risks - Risky Behavior"
    group_label: "VI--SPDAT assessment_questions"
    sql: fn_getPicklistValueName('vi_spdat_q12',${TABLE}.vi_spdat_q12) ;;
  }

  #
  #   - dimension: vi_spdat_q13
  #     type:number
  #     sql: ${TABLE}.vi_spdat_q13
  #
  dimension: vi_spdat_q14 {
    label: "Socialization - Owe Money"
    group_label: "VI--SPDAT assessment_questions"
    sql: fn_getPicklistValueName('vi_spdat_q14',${TABLE}.vi_spdat_q14) ;;
  }

  #
  dimension: vi_spdat_q15 {
    label: "Socialization - Regular Income"
    group_label: "VI--SPDAT assessment_questions"
    sql: fn_getPicklistValueName('vi_spdat_q15',${TABLE}.vi_spdat_q15) ;;
  }

  #
  #   - dimension: vi_spdat_q16
  #     type:number
  #     sql: ${TABLE}.vi_spdat_q16
  #
  dimension: vi_spdat_q17 {
    label: "Socialization - Planned Activities"
    group_label: "VI--SPDAT assessment_questions"
    sql: fn_getPicklistValueName('vi_spdat_q17',${TABLE}.vi_spdat_q17) ;;
  }

  #
  #   - dimension: vi_spdat_q18
  #     type:number
  #     sql: ${TABLE}.vi_spdat_q18
  #
  #   - dimension: vi_spdat_q19
  #     type:number
  #     sql: ${TABLE}.vi_spdat_q19
  #
  dimension: vi_spdat_q2 {
    label: "Housing & Homelessness - Times Homeless"
    group_label: "VI--SPDAT assessment_questions"
    sql: fn_getPicklistValueName('vi_spdat_q2',${TABLE}.vi_spdat_q2) ;;
  }

  #
  #   - dimension: vi_spdat_q20
  #     type:number
  #     sql: ${TABLE}.vi_spdat_q20
  #
  #   - dimension: vi_spdat_q21
  #     type:number
  #     sql: ${TABLE}.vi_spdat_q21
  #
  #   - dimension: vi_spdat_q22
  #     type:number
  #     sql: ${TABLE}.vi_spdat_q22
  #
  #   - dimension: vi_spdat_q23
  #     type:number
  #     sql: ${TABLE}.vi_spdat_q23
  #
  #   - dimension: vi_spdat_q24
  #     type:number
  #     sql: ${TABLE}.vi_spdat_q24
  #


  dimension: vi_spdat_q25 {
    label: "HIV+/AIDS"
    group_label: "VI--SPDAT assessment_questions"
    sql: fn_getPicklistValueName('vi_spdat_q25',${TABLE}.vi_spdat_q25) ;;
  }
  #
  #   - dimension: vi_spdat_q26
  #     type:number
  #     sql: ${TABLE}.vi_spdat_q26
  #
  #   - dimension: vi_spdat_q27
  #     type:number
  #     sql: ${TABLE}.vi_spdat_q27
  #
  #   - dimension: vi_spdat_q28
  #     type:number
  #     sql: ${TABLE}.vi_spdat_q28
  #
  #   - dimension: vi_spdat_q29
  #     type:number
  #     sql: ${TABLE}.vi_spdat_q29
  #
  dimension: vi_spdat_q3 {
    label: "Risks - Emergency Room Times"
    group_label: "VI--SPDAT assessment_questions"
    sql: fn_getPicklistValueName('vi_spdat_q3',${TABLE}.vi_spdat_q3) ;;
  }

  #
  #   - dimension: vi_spdat_q30
  #     type:number
  #     sql: ${TABLE}.vi_spdat_q30
  #
  #   - dimension: vi_spdat_q31
  #     type:number
  #     sql: ${TABLE}.vi_spdat_q31
  #
  #   - dimension: vi_spdat_q32
  #     type:number
  #     sql: ${TABLE}.vi_spdat_q32
  #
  #   - dimension: vi_spdat_q33
  #     type:number
  #     sql: ${TABLE}.vi_spdat_q33
  #
  #   - dimension: vi_spdat_q34
  #     type:number
  #     sql: ${TABLE}.vi_spdat_q34
  #
  #   - dimension: vi_spdat_q35
  #     type:number
  #     sql: ${TABLE}.vi_spdat_q35
  #
  #   - dimension: vi_spdat_q36
  #     type:number
  #     sql: ${TABLE}.vi_spdat_q36
  #
  #   - dimension: vi_spdat_q37
  #     type:number
  #     sql: ${TABLE}.vi_spdat_q37
  #
  #   - dimension: vi_spdat_q38
  #     type:number
  #     sql: ${TABLE}.vi_spdat_q38
  #
  #   - dimension: vi_spdat_q39
  #     type:number
  #     sql: ${TABLE}.vi_spdat_q39
  #
  dimension: vi_spdat_q4 {
    label: "Risks - Police Encounters Times"
    group_label: "VI--SPDAT assessment_questions"
    sql: fn_getPicklistValueName('vi_spdat_q4',${TABLE}.vi_spdat_q4) ;;
  }

  #
  #   - dimension: vi_spdat_q40
  #     type:number
  #     sql: ${TABLE}.vi_spdat_q40
  #
  #   - dimension: vi_spdat_q41
  #     type:number
  #     sql: ${TABLE}.vi_spdat_q41
  #
  #   - dimension: vi_spdat_q42
  #     type:number
  #     sql: ${TABLE}.vi_spdat_q42
  #
  #   - dimension: vi_spdat_q43
  #     type:number
  #     sql: ${TABLE}.vi_spdat_q43
  #
  #   - dimension: vi_spdat_q44
  #     type:number
  #     sql: ${TABLE}.vi_spdat_q44
  #
  #   - dimension: vi_spdat_q45
  #     type:number
  #     sql: ${TABLE}.vi_spdat_q45
  #
  #   - dimension: vi_spdat_q46
  #     type:number
  #     sql: ${TABLE}.vi_spdat_q46
  #
  #   - dimension: vi_spdat_q47
  #     type:number
  #     sql: ${TABLE}.vi_spdat_q47
  #
  #   - dimension: vi_spdat_q48
  #     type:number
  #     sql: ${TABLE}.vi_spdat_q48
  #
  dimension: vi_spdat_q49 {
    label: "Wellness - Medication Not Taken"
    group_label: "VI--SPDAT assessment_questions"
    sql: fn_getPicklistValueName('vi_spdat_q49',${TABLE}.vi_spdat_q49) ;;
  }

  #
  dimension: vi_spdat_q5 {
    label: "Wellness - Ambulance Times"
    group_label: "VI--SPDAT assessment_questions"
    sql: fn_getPicklistValueName('vi_spdat_q5',${TABLE}.vi_spdat_q5) ;;
  }

  #
  dimension: vi_spdat_q50 {
    label: "Wellness - Homelessness Caused by Abuse or Trauma"
    group_label: "VI--SPDAT assessment_questions"
    sql: fn_getPicklistValueName('vi_spdat_q50',${TABLE}.vi_spdat_q50) ;;
  }

  #
  dimension: vi_spdat_q6 {
    label: "Risks - Crisis Services Number of Times"
    group_label: "VI--SPDAT assessment_questions"
    sql: fn_getPicklistValueName('vi_spdat_q6',${TABLE}.vi_spdat_q6) ;;
  }

  #
  dimension: vi_spdat_q7 {
    label: "Risks - Hospitalization Number Times"
    group_label: "VI--SPDAT assessment_questions"
    sql: fn_getPicklistValueName('vi_spdat_q7',${TABLE}.vi_spdat_q7) ;;
  }

  #
  #   - dimension: vi_spdat_q8
  #     type:number
  #     sql: ${TABLE}.vi_spdat_q8
  #
  #   - dimension: vi_spdat_q9
  #     type:number
  #     sql: ${TABLE}.vi_spdat_q9

  #   - dimension: zipcode
  #     type: number
  #     sql: ${TABLE}.zipcode
  #
  #   - dimension: zipcode_quality
  #     type:number
  #     sql: ${TABLE}.zipcode_quality


  dimension: income_cash {
    hidden: yes
    type: number
    value_format_name: usd
    sql: ${TABLE}.income_cash ;;
  }

  dimension: income_cash_is {
    hidden: yes
    type: number
    sql: ${TABLE}.income_cash_is ;;
  }

  dimension: any_income {
    label: "_Income from any Source"
    group_label: "Income Sources and Amounts"

    case: {
      when: {
        sql: ${income_cash_is} = 0 ;;
        label: "No Income"
      }

      when: {
        sql: ${income_cash_is} = 1 ;;
        label: "Income"
      }

      else: "Unknown"
    }
  }

  dimension: income_childsupport {
    label: "Child Support Amount"
    type: number
    group_label: "Income Sources and Amounts"
    sql: ${TABLE}.income_childsupport ;;
  }

  dimension: income_childsupport_is {
    label: "Child Support"
    type: yesno
    group_label: "Income Sources and Amounts"
    sql: ${TABLE}.income_childsupport_is ;;
  }

  dimension: income_earned {
    label: "Income: Earned Income Amount"
    type: number
    hidden: yes
    sql: ${TABLE}.income_earned ;;
  }

  dimension: income_earned_tier {
    label: "Earned Income Tiers"
    type: tier
    style: integer
    tiers: [0, 100, 500, 1000, 5000]
    group_label: "Income Sources and Amounts"
    sql: ${income_earned} ;;
  }

  measure: average_income_earned {
    label: "Earned Income Average"
    # can be average, sum, min, max, count, count_distinct, or number
    type: average
    value_format_name: usd
    drill_fields: [detail*]
    group_label: "Income Sources and Amounts"
    sql: ${income_earned} ;;
  }

  measure: average_cash_income {
    label: "Average Cash Income"
    # can be average, sum, min, max, count, count_distinct, or number
    type: average
    value_format_name: usd
    group_label: "Income Sources and Amounts"
    sql: ${income_individual} ;;
  }

  measure: total_income_earned {
    label: "Earned Income Total"
    # can be average, sum, min, max, count, count_distinct, or number
    type: sum
    value_format_name: usd
    group_label: "Income Sources and Amounts"
    sql: ${income_earned} ;;
    drill_fields: [detail*]
  }

  dimension: income_earned_is {
    label: "Earned Income"
    type: yesno
    group_label: "Income Sources and Amounts"
    sql: ${TABLE}.income_earned_is ;;
  }

  measure: count_with_income {
    type: count_distinct
    group_label: "Income Sources and Amounts"
    sql: ${ref_client} ;;

    filters: {
      field: any_income
      value: "Income"
    }
  }

  measure: count_asked_about_income {
    hidden: yes
    type: count_distinct
    sql: ${ref_client} ;;

    filters: {
      field: any_income
      value: "No Income,Income"
    }
  }

  measure: percent_with_income {
    type: number
    value_format_name: percent_1
    group_label: "Income Sources and Amounts"
    sql: 100.0 * ${count_with_income} / NULLIF(${count_asked_about_income},0) ;;
  }

  dimension: income_ga {
    type: number
    hidden: yes
    label: "Income: General Assistance Amount"
    sql: ${TABLE}.income_ga ;;
  }

  dimension: income_ga_is {
    label: "General Assistance"
    type: yesno
    group_label: "Income Sources and Amounts"
    sql: ${TABLE}.income_ga_is ;;
  }

  measure: total_cash_income {
    # can be average, sum, min, max, count, count_distinct, or number
    type: sum
    value_format_name: usd
    group_label: "Income Sources and Amounts"
    sql: ${income_individual} ;;
  }

  dimension: income_other {
    value_format_name: usd
    type: number
    sql: ${TABLE}.income_other ;;
  }

  #
  dimension: income_other_is {
    group_label: "Income Sources and Amounts"
    type: yesno
    sql: ${TABLE}.income_other_is ;;
  }

  #
  #   - dimension: income_other_source
  #     sql: ${TABLE}.income_other_source

  dimension: income_private_disability {
    label: "Income: Private Disability Insurance"
    hidden: yes
    type: number
    sql: ${TABLE}.income_private_disability ;;
  }

  dimension: income_private_disability_is {
    label: "Private Disability Insurance"
    type: yesno
    group_label: "Income Sources and Amounts"
    sql: ${TABLE}.income_private_disability_is ;;
  }

  dimension: income_private_pension {
    hidden: yes
    type: number
    sql: ${TABLE}.income_private_pension ;;
  }

  dimension: income_private_pension_is {
    label: "Private Pension"
    type: yesno
    group_label: "Income Sources and Amounts"
    sql: ${TABLE}.income_private_pension_is ;;
  }

  dimension: income_spousal_support {
    hidden: yes
    type: number
    sql: ${TABLE}.income_spousal_support ;;
  }

  dimension: income_spousal_support_is {
    label: "Spousal Support"
    type: yesno
    group_label: "Income Sources and Amounts"
    sql: ${TABLE}.income_spousal_support_is ;;
  }

  dimension: income_ss_retirement {
    hidden: yes
    type: number
    sql: ${TABLE}.income_ss_retirement ;;
  }

  dimension: income_ss_retirement_is {
    label: "Soc Sec Retirement"
    type: yesno
    group_label: "Income Sources and Amounts"
    sql: ${TABLE}.income_ss_retirement_is ;;
  }

  dimension: income_ssdi {
    hidden: yes
    type: number
    sql: ${TABLE}.income_ssdi ;;
  }

  dimension: income_ssdi_is {
    label: "SSDI"
    type: yesno
    group_label: "Income Sources and Amounts"
    sql: ${TABLE}.income_ssdi_is ;;
  }

  dimension: income_ssi {
    hidden: yes
    type: number
    sql: ${TABLE}.income_ssi ;;
  }

  dimension: income_ssi_is {
    label: "SSI"
    type: yesno
    group_label: "Income Sources and Amounts"
    sql: ${TABLE}.income_ssi_is ;;
  }

  dimension: income_tanf {
    hidden: yes
    type: number
    sql: ${TABLE}.income_tanf ;;
  }

  dimension: income_tanf_is {
    label: "TANF"
    type: yesno
    group_label: "Income Sources and Amounts"
    sql: ${TABLE}.income_tanf_is ;;
  }

  dimension: income_unemployment {
    hidden: yes
    label: "Unemployment Amount"
    type: number
    sql: ${TABLE}.income_unemployment ;;
  }

  measure: total_unemployment_income {
    hidden: yes
    label: "Income: Total Unemployment Income"
    # can be average, sum, min, max, count, count_distinct, or number
    type: sum
    value_format_name: percent_1
    sql: ${income_unemployment} ;;
  }

  dimension: income_unemployment_is {
    label: "Unemployment Income"
    type: yesno
    group_label: "Income Sources and Amounts"
    sql: ${TABLE}.income_unemployment_is ;;
  }

  dimension: income_vet_disability {
    hidden: yes
    type: number
    sql: ${TABLE}.income_vet_disability ;;
  }

  dimension: income_vet_disability_is {
    label: "Veteran Disability"
    type: yesno
    group_label: "Income Sources and Amounts"
    sql: ${TABLE}.income_vet_disability_is ;;
  }

  dimension: income_vet_pension {
    hidden: yes
    type: number
    sql: ${TABLE}.income_vet_pension ;;
  }

  dimension: income_vet_pension_is {
    label: "Veteran Pension"
    type: yesno
    group_label: "Income Sources and Amounts"
    sql: ${TABLE}.income_vet_pension_is ;;
  }

  dimension: income_workers_comp {
    hidden: yes
    type: number
    sql: ${TABLE}.income_workers_comp ;;
  }

  measure: total_workers_comp_income {
    hidden: yes
    label: "Income: Total Unemployment Income"
    # can be average, sum, min, max, count, count_distinct, or number
    type: sum
    value_format_name: percent_1
    sql: ${income_workers_comp} ;;
  }

  dimension: income_workers_comp_is {
    label: "Workers Comp"
    type: yesno
    group_label: "Income Sources and Amounts"
    sql: ${TABLE}.income_workers_comp_is ;;
  }

  dimension: prior_duration_text {
    label: "Length of Stay at Prior Place"
    sql: fn_getPicklistValueName('prior_duration',${prior_duration}) ;;
  }

  dimension: prior_duration {
    #hidden: yes
    type: number
    sql: ${TABLE}.prior_duration ;;
  }

  dimension: prior_residence {
    #hidden: yes
    type: number
    sql: ${TABLE}.prior_residence ;;
  }

  dimension: prior_residence_other {
    sql: ${TABLE}.prior_residence_other ;;

  }

  dimension: th_ph_less_than_7_nights {
    hidden: yes
    type: number
    sql: ${TABLE}.th_ph_less_than_7_nights ;;
  }

  dimension: institutional_90_days {
    hidden: yes
    type: number
    sql: ${TABLE}.institutional_90_days ;;
  }

  dimension: prior_residence_text {
    label: "Residence Prior to Project Entry"
    sql: fn_getPicklistValueName('prior_residence',${prior_residence}) ;;
  }

  dimension: th_ph_less_than_7_nights_text {
    label: "Length of Stay Less Than 7 Nights"
    description: "Indicates if the client's stay was less than 7 nights in the type of housing situation they were previously residing in."
    sql: fn_getPicklistValueName('th_ph_less_than_7_nights',${th_ph_less_than_7_nights}) ;;
  }

  dimension: institutional_90_days_text {
    label: "Length of Stay Less Than 90 Days"
    description: "Indicates if the client's stay was less than 90 days in the type of housing situation they were previously residing in."
    sql: fn_getPicklistValueName('insitutional_90_days',${institutional_90_days}) ;;
  }

  dimension: health_mental {
    label: "Mental Health"
    group_label: "Disability Types"
    sql: fn_getPicklistValueName('health_mental',${TABLE}.health_mental) ;;
  }

  dimension: health_mental_services {
    label: "Mental Health Services"
    hidden: yes
    group_label: "Disability Types"
    sql: fn_getPicklistValueName('health_mental_services',${TABLE}.health_mental_services) ;;
  }

  dimension: health_mental_longterm {
    label: "Mental Health Longterm"
    group_label: "Disability Types"
    sql: fn_getPicklistValueName('health_mental_longterm',${TABLE}.health_mental_longterm) ;;
  }

  dimension: health_phys_disability_services {
    label: "Physical Services"
    hidden: yes
    group_label: "Disability Types"
    sql: fn_getPicklistValueName('health_phys_disability_services',${TABLE}.health_phys_disability_services) ;;
  }

  dimension: health_phys_disability_longterm {
    label: "Physical Longterm"
    group_label: "Disability Types"
    sql: fn_getPicklistValueName('health_phys_disability_longterm',${TABLE}.health_phys_disability_longterm) ;;
  }

  dimension: health_pregnancy {
    label: "Pregnancy Status"
    sql: fn_getPicklistValueName('health_pregnancy',${TABLE}.health_pregnancy) ;;
  }

  dimension: health_substance_abuse {
    label: "Substance Abuse"
    group_label: "Disability Types"
    sql: fn_getPicklistValueName('health_substance_abuse',${TABLE}.health_substance_abuse) ;;
  }

  dimension: health_substance_abuse_services {
    label: "Substance Abuse Services"
    hidden: yes
    group_label: "Disability Types"
    sql: fn_getPicklistValueName('health_substance_abuse_services',${TABLE}.health_substance_abuse_services) ;;
  }

  dimension: health_substance_abuse_longterm {
    label: "Substance Abuse Longterm"
    group_label: "Disability Types"
    sql: fn_getPicklistValueName('health_substance_abuse_longterm',${TABLE}.health_substance_abuse_longterm) ;;
  }

  dimension: health_chronic {
    label: "Chronic Health"
    group_label: "Disability Types"
    sql: fn_getPicklistValueName('health_chronic',${TABLE}.health_chronic) ;;
  }

  dimension: health_chronic_services {
    label: "Chronic Health Services"
    hidden: yes
    group_label: "Disability Types"
    sql: fn_getPicklistValueName('health_chronic_services',${TABLE}.health_chronic_services) ;;
  }

  dimension: health_chronic_documented {
    label: "Chronic Health Documented"
    hidden: yes
    group_label: "Disability Types"
    sql: fn_getPicklistValueName('health_chronic_documented',${TABLE}.health_chronic_documented) ;;
  }

  dimension: health_chronic_longterm {
    label: "Chronic Health Longterm"
    group_label: "Disability Types"
    sql: fn_getPicklistValueName('health_chronic_longterm',${TABLE}.health_chronic_longterm) ;;
  }

  dimension: health_dev_disability {
    label: "Developmental"
    group_label: "Disability Types"
    sql: fn_getPicklistValueName('health_dev_disability',${TABLE}.health_dev_disability) ;;
  }

  measure: count {
    description: "Number of Assessments"
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      id,
      vi_f_spdat_child1_fullname,
      vi_f_spdat_child8_fullname,
      vi_f_spdat_child9_fullname,
      vi_f_spdat_child10_fullname,
      vi_f_spdat_hh2_fullname,
      vi_f_spdat_child7_fullname,
      vi_f_spdat_child2_fullname,
      vi_f_spdat_child3_fullname,
      vi_f_spdat_child4_fullname,
      vi_f_spdat_child5_fullname,
      vi_f_spdat_child6_fullname
    ]
  }
}
