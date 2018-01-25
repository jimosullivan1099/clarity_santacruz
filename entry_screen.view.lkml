view: entry_screen {
  sql_table_name: client_program_demographics
    ;;

  dimension: id {
    primary_key: yes
    hidden: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension_group: added {
    type: time
    description: "Date project enrollment was added to Clarity (or legacy) system (HMIS Data Element 5.1)"
    timeframes: [time, date, week, month]
    sql: ${TABLE}.added_date ;;
  }

  dimension: age {
    label: "Age at Project Start"
    description: "Client age at the time of project start"
    type: number
    sql: (select YEAR(${TABLE}.program_date) - YEAR(clients.birth_date) - (DATE_FORMAT(${TABLE}.program_date, '%m%d') < DATE_FORMAT(clients.birth_date, '%m%d'))
      from clients where id = ${TABLE}.ref_client)
       ;;
  }

  dimension: age_tier {
    group_label: "Age Tiers"
    description: "Tier: Client age at the time of project start"
    type: tier
    style: integer
    tiers: [
      0,
      18,
      25,
      35,
      45,
      55,
      65
    ]
    sql: ${age} ;;
  }

  dimension: senior_age_tier {
    group_label: "Age Tiers"
    description: "Tier: Client age at the time of project start (seniors)"
    type: tier
    style: integer
    tiers: [
      60,
      65,
      70,
      75,
      80,
      85,
      91
    ]
    sql: ${age} ;;
  }

  dimension: relationship_to_hoh {
    label: "Relationship to Head of Household"
    description: "HMIS Data Element 3.15.1"
    sql: fn_getPicklistValueName('relationship_to_hoh',${TABLE}.relationship_to_hoh) ;;
  }

  measure: total_adults {
    description: "Distinct count of adults based on age at project start"
    # can be average, sum, min, max, count, count_distinct, or number
    type: count_distinct
    sql: ${ref_client} ;;

    filters: {
      field: age
      value: ">=18"
    }
  }

  measure: total_children {
    description: "Distinct count of children based on age at project start"
    # can be average, sum, min, max, count, count_distinct, or number
    type: count_distinct
    sql: ${ref_client} ;;

    filters: {
      field: age
      value: "<18"
    }
  }

  dimension: benefits_snap {
    label: "SNAP"
    description: "Receiving SNAP (Food Stamps) benefits (HMIS Data Element 4.3.3)"
    type: yesno
    group_label: "Non-Cash Benefits"
    sql: ${TABLE}.benefit_snap ;;
  }

  dimension: benefits_medicaid {
    label: "Medicaid"
    description: "On Medicaid Insurance (HMIS Data Element 4.4.3)"
    type: yesno
    group_label: "Health Insurance"
    sql: ${TABLE}.benefits_medicaid ;;
  }

  dimension: benefits_medicare {
    label: "Medicare"
    description: "On Medicare Insurance (HMIS Data Element 4.4.4)"
    type: yesno
    group_label: "Health Insurance"
    sql: ${TABLE}.benefits_medicare ;;
  }

  dimension: benefits_no_insurance {
    hidden: yes
    label: "No Health Insurance"
    type: yesno
    group_label: "Health Insurance"
    sql: ${TABLE}.benefits_no_insurance ;;
  }

  dimension: benefits_noncash {
    label: "Non-Cash Benefit from Any Source"
    description: "Is the client receiving any non-cash benefits (HMIS DATA Element 4.3.1)"
    #     sql: ${TABLE}.benefits_noncash
    group_label: "Non-Cash Benefits"
    sql: fn_getPicklistValueName('benefits_noncash', ${TABLE}.benefits_noncash) ;;
  }

  dimension: benefits_other {
    label: "Other Health Insurance"
    description: "HMIS Data Element 4.4.12"
    type: yesno
    group_label: "Health Insurance"
    sql: ${TABLE}.benefits_other ;;
  }

  dimension: benefits_other_source {
    label: "Other Health Insurance Source"
    description: "HMIS Data Element 4.4.12"
    group_label: "Health Insurance"
    sql: ${TABLE}.benefits_other_source ;;
  }

  dimension: benefits_private_insurance {
    label: "Private Insurance"
    description: "On Private Pay Insurance (HMIS Data Element 4.4.9)"
    type: yesno
    group_label: "Health Insurance"
    sql: ${TABLE}.benefits_private_insurance ;;
  }

  dimension: benefits_schip {
    label: "SCHIP"
    description: "On State Children Health Insurance Program (HMIS Data Element 4.4.5)"
    type: yesno
    group_label: "Health Insurance"
    sql: ${TABLE}.benefits_schip ;;
  }

  dimension: benefits_section8 {
    label: "Section 8"
#    description: "Receiving Section 8 benefits (HMIS Data Element 4.3.8)"
    description: "Retired HMIS Data Element"
    type: yesno
    group_label: "Non-Cash Benefits"
    sql: ${TABLE}.benefits_section8 ;;
  }

  dimension: benefits_tanf_childcare {
    label: "TANF Childcare"
    description: "Receiving TANF Childcare benefits (HMIS Data Element 4.3.5)"
    type: yesno
    group_label: "Non-Cash Benefits"
    sql: ${TABLE}.benefits_tanf_childcare ;;
  }

  dimension: benefits_tanf_other {
    label: "TANF Other"
    description: "Receiving TANF Other benefits (HMIS Data Element 4.3.7)"
    type: yesno
    group_label: "Non-Cash Benefits"
    sql: ${TABLE}.benefits_tanf_other ;;
  }

  dimension: benefits_tanf_transportation {
    label: "TANF Transportaion"
    description: "Receiving TANF Transportation benefits (HMIS Data Element 4.3.6)"
    type: yesno
    group_label: "Non-Cash Benefits"
    sql: ${TABLE}.benefits_tanf_transportation ;;
  }

  dimension: benefits_temp_rent {
    label: "Temporary Rental Assistance"
#    description: "Receiving Temporary Rental Assistance benefits (HMIS Data Element 4.3.10)"
    description: "Retired HMIS Data Element"
    type: yesno
    group_label: "Non-Cash Benefits"
    sql: ${TABLE}.benefits_temp_rent ;;
  }

  dimension: benefits_va_medical {
    label: "VA Medical Insurance"
    description: "On VA Medical Insurance (HMIS Data Element 4.4.6)"
    type: yesno
    group_label: "Health Insurance"
    sql: ${TABLE}.benefits_va_medical ;;
  }

  dimension: benefits_wic {
    label: "WIC"
    description: "Receiving Women, Infants and Children benefits (HMIS Data Element 4.3.4)"
    type: yesno
    group_label: "Non-Cash Benefits"
    sql: ${TABLE}.benefits_wic ;;
  }

  dimension: th_ph_less_than_7_nights {
    label: "Length of Stay Less Than 7 Days"
    description: "For transitional and permanent housing situations, was stay less than 7 days (HMIS Data Element 3.917B.2B)"
    sql: fn_getPicklistValueName('th_ph_less_than_7_nights',${TABLE}.th_ph_less_than_7_nights) ;;
  }

  dimension: institutional_90_days {
    label: "Length of Stay Less Than 90 Days"
    description: "For institutional situations, was stay less than 90 days (HMIS Data Element 3.917B.2A)"
    sql: fn_getPicklistValueName('institutional_90_days',${TABLE}.institutional_90_days) ;;
  }

  dimension: chronic_1 {
    hidden: yes
    type: number
    sql: ${TABLE}.chronic_1 ;;
  }

  dimension: chronic_2 {
    label: "Times Homeless in the Past Three Years"
    description: "Times homeless, including this time, in past three years (HMIS Data Element 3.917.4)"
    sql: fn_getPicklistValueName('chronic_2',${TABLE}.chronic_2) ;;
  }

  dimension: chronic_3 {
    label: "Total Months Homeless in Past Three Years"
    description: "Total months homeless in past three years (HMIS Data Element 3.917.5)"
    sql: fn_getPicklistValueName('chronic_3',${TABLE}.chronic_3) ;;
  }

  dimension: chronic_4 {
    hidden: yes
    type: number
    sql: ${TABLE}.chronic_4 ;;
  }

  dimension: chronic_5 {
    hidden: yes
    type: number
    sql: ${TABLE}.chronic_5 ;;
  }

  dimension: chronic_6 {
    label: "Client Entering from Streets..."
    description: "If prior living situation is institution, transitional or permanent housing, before that, were they entering from streets... (HMIS Data Element 3.917B.2C)"
    sql: fn_getPicklistValueName('chronic_6',${TABLE}.chronic_6) ;;
  }

  dimension_group: chronic_7 {
    label: "Approximate Date Homelessness Started"
    description: "(HMIS Data Element 3.917.3)"
    type: time
    timeframes: [time, date, week, month, year]
    sql: ${TABLE}.chronic_7 ;;
  }

  dimension: chronic_homeless_calculation_2014 {
    description: "Using HUD 2014 logic, was client chronically homeless at project start"
    bypass_suggest_restrictions: yes
    type: yesno
    sql: ${enrollments.head_of_household} = 1
      AND ${TABLE}.disabled = 1 AND
      ( ${TABLE}.chronic_1 = 1 OR  ${TABLE}.chronic_2 = 4)
       ;;
  }

  dimension: chronic_homeless_calculation {
    label: "Chronic Homeless at Project Start"
    description: "Using current HUD logic, was client chronically homeless at project start"
    type: yesno
    sql: fn_isChronicallyHomelessProjectStay(${enrollments.id},${enrollments.start_date},CURDATE()) ;;
  }

  dimension: chronic_homeless_calculation_PIT {
    label: "Chronic Homeless at PIT/Current Date"
    description: "Using HUD Point-in-time logic, is client chronically homeless now"
    type: yesno
    sql: fn_isChronicallyHomelessPit(${enrollments.id},CURDATE()) ;;
  }

  dimension: client_location {
    label: "CoC Code of Client at Project Start"
    description: "(HMIS Data Element 3.16)"
    sql: ${TABLE}.client_location ;;
  }

  dimension: disabled {
    hidden: yes
    type: number
    sql: ${TABLE}.disabled ;;
  }

  dimension: any_disability {
    label: "Any Disability"
    description: "Does client have any disability type recorded at project start. This is not a HUD data element"
    type: yesno
    group_label: "Disability Information"
    sql: ${TABLE}.health_chronic = 1 or ${TABLE}.health_dev_disability = 1 or ${TABLE}.health_hiv = 1 or ${TABLE}.health_mental = 1 or ${TABLE}.health_phys_disability = 1 or (${TABLE}.health_substance_abuse =1 or ${TABLE}.health_substance_abuse =2 or ${TABLE}.health_substance_abuse =3  ) ;;
  }

  dimension: disabiing_condition {
    label: "Disabling Condition"
    description: "Does the client have a disabling condition that is expected to be of long-continued and indefinite duration and substantially impairs ability to live independently. (HMIS Data Element 3.8)"
    group_label: "Disability Information"
    sql: fn_getPicklistValueName('disabled',${TABLE}.disabled) ;;
  }

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
    group_label: "Education"
    type:number
    sql: ${TABLE}.education_degree ;;
  }
  #
  dimension: education_enrolled {
    group_label: "Education"
    type:number
    sql: ${TABLE}.education_enrolled ;;
  }
  #
  #   - dimension: education_level
  #     type:number
  #     sql: ${TABLE}.education_level
  #
  dimension: education_vocational {
    group_label: "Education"
    type:number
    sql: ${TABLE}.education_vocational ;;
  }

  dimension: employment_hours {
    label: "Hours Worked Last Week"
    group_label: "Employment"
    type:number
    sql: ${TABLE}.employment_hours ;;
  }

  #   - dimension: employment_is
  #     type:number
  #     sql: ${TABLE}.employment_is
  #
  dimension: employment_seeking {
    group_label: "Employment"
    type:number
    sql: ${TABLE}.employment_seeking ;;
  }
  #
  #   - dimension: employment_status
  #     type:number
  #     sql: ${TABLE}.employment_status
  #
  dimension: employment_tenure {
    group_label: "Employment"
    type:number
    sql: ${TABLE}.employment_tenure ;;
  }


  dimension: health_chronic {
    label: "Chronic Health"
    description: "The client has a chronic health disabling condition (HMIS Data Element 4.7.1)"
    group_label: "Disability Information"
    sql: fn_getPicklistValueName('health_chronic',${TABLE}.health_chronic) ;;
  }

  dimension: health_chronic_services {
    label: "Chronic Health Services"
    hidden: yes
    description: "Client is receiving services for chronic health condition (HMIS Data Element 4.7.2C)"
    group_label: "Disability Information"
    sql: fn_getPicklistValueName('health_chronic_services',${TABLE}.health_chronic_services) ;;
  }

  dimension: health_chronic_documented {
    label: "Chronic Health Documented"
    hidden: yes
    description: "Chronic health condition is documented (HMIS Data Element 4.7.2B)"
    group_label: "Disability Information"
    sql: fn_getPicklistValueName('health_chronic_documented',${TABLE}.health_chronic_documented) ;;
  }

  dimension: health_chronic_longterm {
    label: "Chronic Health Longterm"
    description: "Chronic health condition expected to be long-continued and indefinite duration (HMIS Data Element 4.7.2A)"
    group_label: "Disability Information"
    sql: fn_getPicklistValueName('health_chronic_longterm',${TABLE}.health_chronic_longterm) ;;
  }

  dimension: health_dev_disability {
    label: "Developmental"
    description: "The client has a developmental disabling condition (HMIS Data Element 4.6.1)"
    group_label: "Disability Information"
    sql: fn_getPicklistValueName('health_dev_disability',${TABLE}.health_dev_disability) ;;
  }

  dimension: health_dev_disability_services {
    label: "Developmental Services"
    hidden: yes
    description: "Client is receiving services for developmental disability (HMIS Data Element 4.6.2C)"
    group_label: "Disability Information"
    sql: fn_getPicklistValueName('health_dev_disability_services',${TABLE}.health_dev_disability_services) ;;
  }

  dimension: health_dev_disability_documented {
    label: "Developmental Documented"
    hidden: yes
    description: "Developmental disability is documented (HMIS Data Element 4.6.2B)"
    group_label: "Disability Information"
    sql: fn_getPicklistValueName('health_dev_disability_documented',${TABLE}.health_dev_disability_documented) ;;
  }

  dimension: health_dev_disability_independence {
    label: "Developmental Independence"
    description: "Developmental disability expected to substantially impair ability to live independently (HMIS Data Element 4.6.2A)"
    group_label: "Disability Information"
    sql: fn_getPicklistValueName('health_dev_disability_independence',${TABLE}.health_dev_disability_independence) ;;
  }

  dimension: health_hiv {
    label: "HIV/AIDS"
    description: "The client has HIV/AIDS (HMIS Data Element 4.8.1)"
    group_label: "Disability Information"
    sql: fn_getPicklistValueName('health_hiv',${TABLE}.health_hiv) ;;
  }

  dimension: health_hiv_services {
    label: "HIV/AIDS Services"
    hidden: yes
    description: "Client is receiving services for HIV/AIDS (HMIS Data Element 4.8.2C)"
    group_label: "Disability Information"
    sql: fn_getPicklistValueName('health_hiv_services',${TABLE}.health_hiv_services) ;;
  }

  dimension: health_hiv_documented {
    label: "HIV/AIDS Documented"
    hidden: yes
    description: "HIV/AIDS disability is documented (HMIS Data Element 4.8.2B)"
    group_label: "Disability Information"
    sql: fn_getPicklistValueName('health_hiv_documented',${TABLE}.health_hiv_documented) ;;
  }

  dimension: health_hiv_independence {
    label: "HIV/AIDS Independence"
    description: "HIV/AIDS disability expected to substantially impair ability to live independently (HMIS Data Element 4.8.2A)"
    group_label: "Disability Information"
    sql: fn_getPicklistValueName('health_hiv_independence',${TABLE}.health_hiv_independence) ;;
  }

  dimension: health_mental {
    label: "Mental Health"
    description: "The client has a mental health disabling condition (HMIS Data Element 4.9.1)"
    group_label: "Disability Information"
    sql: fn_getPicklistValueName('health_mental',${TABLE}.health_mental) ;;
  }

  dimension: health_mental_services {
    label: "Mental Health Services"
    hidden: yes
    description: "Client is receiving services for mental health condition (HMIS Data Element 4.9.2C)"
    group_label: "Disability Information"
    sql: fn_getPicklistValueName('health_mental_services',${TABLE}.health_mental_services) ;;
  }

  dimension: health_mental_confirmed {
    label: "Mental Health Confirmed (PATH)"
    description: "PATH Only: How was mental health disabling condition confirmed (HMIS Data Element 4.9.2D)"
    group_label: "Disability Information"
    sql: fn_getPicklistValueName('health_mental_confirmed',${TABLE}.health_mental_confirmed) ;;
  }

  dimension: health_mental_documented {
    label: "Mental Health Documented"
    hidden: yes
    description: "Mental health disabling condition is documented (HMIS Data Element 4.9.2B)"
    group_label: "Disability Information"
    sql: fn_getPicklistValueName('health_mental_documented',${TABLE}.health_mental_documented) ;;
  }

  dimension: health_mental_longterm {
    label: "Mental Health Longterm"
    description: "Mental health disabling condition expected to be long-continued and indefinite duration (HMIS Data Element 4.9.2A)"
    group_label: "Disability Information"
    sql: fn_getPicklistValueName('health_mental_longterm',${TABLE}.health_mental_longterm) ;;
  }

  dimension: health_mental_smi {
    label: "Mental Health SMI (PATH)"
    description: "PATH Only: Serious mental illness and how confirmed (HMIS Data Element 4.9.2E)"
    group_label: "Disability Information"
    sql: fn_getPicklistValueName('health_mental_smi',${TABLE}.health_mental_smi) ;;
  }

  dimension: health_phys_disability {
    label: "Physical"
    description: "The client has a physical disabling condition (HMIS Data Element 4.5.1)"
    group_label: "Disability Information"
    sql: fn_getPicklistValueName('health_phys_disability',${TABLE}.health_phys_disability) ;;
  }

  dimension: health_phys_disability_services {
    label: "Physical Services"
    hidden: yes
    description: "Client is receiving services for physical disability (HMIS Data Element 4.5.2C)"
    group_label: "Disability Information"
    sql: fn_getPicklistValueName('health_phys_disability_services',${TABLE}.health_phys_disability_services) ;;
  }

  dimension: health_phys_disability_documented {
    label: "Physical Documented"
    hidden: yes
    description: "Physical disabling condition is documented (HMIS Data Element 4.5.2B)"
    group_label: "Disability Information"
    sql: fn_getPicklistValueName('health_phys_disability_documented',${TABLE}.health_phys_disability_documented) ;;
  }

  dimension: health_phys_disability_longterm {
    label: "Physical Longterm"
    description: "Physical disabling condition expected to be long-continued and indefinite duration (HMIS Data Element 4.5.2A)"
    group_label: "Disability Information"
    sql: fn_getPicklistValueName('health_phys_disability_longterm',${TABLE}.health_phys_disability_longterm) ;;
  }

  dimension: health_substance_abuse {
    label: "Substance Abuse"
    description: "The client has a substance abuse disabling condition (HMIS Data Element 4.10.1)"
    group_label: "Disability Information"
    sql: fn_getPicklistValueName('health_substance_abuse',${TABLE}.health_substance_abuse) ;;
  }

  dimension: health_substance_abuse_services {
    label: "Substance Abuse Services"
    hidden: yes
    description: "Client is receiving services for substance abuse (HMIS Data Element 4.10.2C)"
    group_label: "Disability Information"
    sql: fn_getPicklistValueName('health_substance_abuse_services',${TABLE}.health_substance_abuse_services) ;;
  }

  dimension: health_substance_abuse_confirmed {
    label: "Substance Abuse Confirmed (PATH)"
    description: "PATH Only: How was substance abuse disabling condition confirmed (HMIS Data Element 4.10.2D)"
    group_label: "Disability Information"
    sql: fn_getPicklistValueName('health_substance_abuse_confirmed',${TABLE}.health_substance_abuse_confirmed) ;;
  }

  dimension: health_substance_abuse_documented {
    label: "Substance Abuse Documented"
    hidden: yes
    description: "Substance abuse disabling condition is documented (HMIS Data Element 4.10.2B)"
    group_label: "Disability Information"
    sql: fn_getPicklistValueName('health_substance_abuse_documented',${TABLE}.health_substance_abuse_documented) ;;
  }

  dimension: health_substance_abuse_longterm {
    label: "Substance Abuse Longterm"
    description: "Substance abuse disabling condition expected to be long-continued and indefinite duration (HMIS Data Element 4.10.2A)"
    group_label: "Disability Information"
    sql: fn_getPicklistValueName('health_substance_abuse_longterm',${TABLE}.health_substance_abuse_longterm) ;;
  }

  dimension: health_dv {
    label: "Domestic Violence"
    description: "HMIS Data Element 4.11.2"
    group_label: "Domestic Violence"
    sql: fn_getPicklistValueName('health_dv',${TABLE}.health_dv) ;;
  }

  dimension: health_dv_occurred {
    label: "Domestic Violence Occurred"
    description: "HMIS Data Element 4.11.2A"
    group_label: "Domestic Violence"
    sql: fn_getPicklistValueName('health_dv_occurred',${TABLE}.health_dv_occurred) ;;
  }

  dimension: health_dv_fleeing {
    label: "Currently Fleeing Domestic Violence"
    description: "HMIS Data Element 4.11.2B"
    group_label: "Domestic Violence"
    sql: fn_getPicklistValueName('health_dv_fleeing',${TABLE}.health_dv_fleeing) ;;
  }

  dimension: Employed {
    description: "HMIS Data Element R6"
    sql: fn_getPicklistValueName('employment_is',${TABLE}.employment_is) ;;
  }

  dimension: health_general {
    description: "HMIS Data Element R7"
    sql: fn_getPicklistValueName('health_general',${TABLE}.health_general) ;;
  }

  dimension: health_ins_cobra {
    label: "COBRA"
    description: "HMIS Data Element 4.4.8"
    type: yesno
    group_label: "Health Insurance"
    sql: ${TABLE}.health_ins_cobra ;;
  }

  dimension: health_ins_emp {
    label: "Employer Provided"
    description: "HMIS Data Element 4.4.7"
    type: yesno
    group_label: "Health Insurance"
    sql: ${TABLE}.health_ins_emp ;;
  }

  dimension: health_ins_ppay {
    label: "Private Pay"
    description: "HMIS Data Element 4.4.9"
    type: yesno
    group_label: "Health Insurance"
    sql: ${TABLE}.health_ins_ppay ;;
  }

  dimension: health_ins_state {
    label: "State Insurance for Adults"
    description: "HMIS Data Element 4.4.10"
    type: yesno
    group_label: "Health Insurance"
    sql: ${TABLE}.health_ins_state ;;
  }

  dimension: health_insurance {
    label: "Covered by Health Insurance"
    description: "HMIS Data Element 4.4.1"
    group_label: "Health Insurance"
    sql: fn_getPicklistValueName('health_insurance',${TABLE}.health_insurance) ;;
  }

  dimension: health_pregnancy {
    label: "Pregnancy Status"
    description: "HMIS Data Element R10.1"
    sql: fn_getPicklistValueName('health_pregnancy',${TABLE}.health_pregnancy) ;;
  }

  #
  #   - dimension_group: health_pregnancy
  #     type: time
  #     timeframes: [date, week, month]
  #     convert_tz: false
  #     sql: ${TABLE}.health_pregnancy_date


  #- dimension: housing_ass_exit
  # type: number
  #  sql: ${TABLE}.housing_ass_exit

  #- dimension: housing_ass_exit_1
  #  type: number
  #  sql: ${TABLE}.housing_ass_exit_1

  #- dimension: housing_ass_exit_2
  #  type: number
  #  sql: ${TABLE}.housing_ass_exit_2

  dimension: housing_status {
    hidden: yes
    type: number
    sql: ${TABLE}.housing_status ;;
  }

  dimension: housing_status_text {
    label: "Housing Status @ Project Start"
    description: "Retired HMIS Data Element"
    sql: fn_getPicklistValueName('housing_status',${housing_status}) ;;
  }

  dimension: entered_stably_housed {
    description: "Based on retired Housing Status field"
    # Housing Status now retired
    type: yesno
    sql: ${housing_status_text} = 'Stably housed' ;;
  }

  measure: count_stably_housed {
    description: "Based on retired Housing Status field. Distinct count of those clients with [Housing Status @ Project Start]=\"Stably Housed\""
    # Housing Status now retired
    type: count_distinct
    sql: ${ref_client} ;;

    filters: {
      field: housing_status_text
      value: "Stably housed"
    }
  }

  measure: count_asked_about_housing {
    hidden: yes
    type: count_distinct
    sql: ${ref_client} ;;

    filters: {
      field: housing_status_text
      value: "-NULL"
    }
  }

  measure: percent_stably_housed {
    hidden: yes
    type: number
    value_format_name: percent_1
    sql: 100.0 * ${count_stably_housed} / NULLIF(${count_asked_about_housing},0) ;;
  }

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
    label: "Income from any Source"
    description: "HMIS Data Element 4.2.2"
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
    description: "HMIS Data Element 4.2.15A"
    type: number
    group_label: "Income Sources and Amounts"
    sql: ${TABLE}.income_childsupport ;;
  }

  dimension: income_childsupport_is {
    label: "Child Support"
    description: "HMIS Data Element 4.2.15"
    type: yesno
    group_label: "Income Sources and Amounts"
    sql: ${TABLE}.income_childsupport_is ;;
  }

  dimension: income_earned {
    label: "Earned Income Amount"
    description: "HMIS Data Element 4.2.3A"
    type: number
    hidden: yes
    sql: ${TABLE}.income_earned ;;
  }

  dimension: income_earned_tier {
    label: "Earned Income Tiers"
    description: "HMIS Data Element 4.2.3A. Tiered Earned Income Amounts"
    type: tier
    style: integer
    tiers: [0, 100, 500, 1000, 5000]
    group_label: "Income Sources and Amounts"
    sql: ${income_earned} ;;
  }

  measure: average_income_earned {
    label: "Earned Income Average"
    description: "\"Earned Income\", mean average per client"
    # can be average, sum, min, max, count, count_distinct, or number
    type: average
    value_format_name: usd
    drill_fields: [detail*]
    group_label: "Income Sources and Amounts"
    sql: ${income_earned} ;;
  }

  measure: average_cash_income {
    label: "Average Cash Income"
    description: "Mean average, per client, of income from any source"
    # can be average, sum, min, max, count, count_distinct, or number
    type: average
    value_format_name: usd
    group_label: "Income Sources and Amounts"
    sql: ${income_individual} ;;
  }

  measure: total_income_earned {
    label: "Earned Income Total"
    description: "Sum of \"Earned income\""
    # can be average, sum, min, max, count, count_distinct, or number
    type: sum
    value_format_name: usd
    group_label: "Income Sources and Amounts"
    sql: ${income_earned} ;;
    drill_fields: [detail*]
  }

  dimension: income_earned_is {
    label: "Earned Income"
    description: "HMIS Data Element 4.2.3"
    type: yesno
    group_label: "Income Sources and Amounts"
    sql: ${TABLE}.income_earned_is ;;
  }

  measure: count_with_income {
    description: "Distinct count of clients where \"Income from Any Source\" = \"Income\""
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
    description: "\"Count with Income\"/Distinct count of clients with any response to \"Income from Any Source\""
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
    description: "HMIS Data Element 4.2.12"
    type: yesno
    group_label: "Income Sources and Amounts"
    sql: ${TABLE}.income_ga_is ;;
  }

  # Total cash income for individual
  dimension: income_individual {
    label: "Total Monthly Income"
    description: "HMIS Data Element 4.2.18. This is the dimension field."
    type: number
    value_format_name: usd
    group_label: "Income Sources and Amounts"
    sql: ${TABLE}.income_individual ;;
  }

  measure: total_cash_income {
    description: "Sum of amounts from all sources of income. Use this field to show income amounts for different sources."
    # can be average, sum, min, max, count, count_distinct, or number
    type: sum
    value_format_name: usd
    group_label: "Income Sources and Amounts"
    sql: ${income_individual} ;;
  }

  #   - dimension: income_other
  #     hidden: true
  #     type: number
  #     sql: ${TABLE}.income_other
  #

  dimension: income_other_is {
    label: "Income: Other"
    description: "HMIS Data Element 4.2.17"
    group_label: "Income Sources and Amounts"
    type: yesno
    sql: ${TABLE}.income_other_is ;;
  }

  #
  #   - dimension: income_other_source
  #     sql: ${TABLE}.income_other_source

  dimension: income_private_disability {
    label: "Private Disability Insurance Amount"
    description: "HMIS Data Element 4.2.9"
    hidden: yes
    type: number
    sql: ${TABLE}.income_private_disability ;;
  }

  dimension: income_private_disability_is {
    label: "Private Disability Insurance"
    description: "HMIS Data Element 4.2.9"
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
    label: "Pension or retirement income from a former job"
    description: "HMIS Data Element 4.2.14"
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
    label: "Alimony and other spousal support"
    description: "HMIS Data Element 4.2.16"
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
    label: "Social Security Retirement Income"
    description: "HMIS Data Element 4.2.13"
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
    description: "HMIS Data Element 4.2.6"
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
    description: "HMIS Data Element 4.2.5"
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
    description: "HMIS Data Element 4.2.11"
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
    value_format: "$#0.0f"
    sql: ${income_unemployment} ;;
  }

  dimension: income_unemployment_is {
    label: "Unemployment Income"
    description: "HMIS Data Element 4.2.4"
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
    description: "HMIS Data Element 4.2.7"
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
    description: "HMIS Data Element 4.2.8"
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
    description: "HMIS Data Element 4.2.10"
    type: yesno
    group_label: "Income Sources and Amounts"
    sql: ${TABLE}.income_workers_comp_is ;;
  }

  dimension_group: last_updated {
    type: time
    description: "HMIS Data Element 5.2 Date the Enrollment Screen was last updated"
    timeframes: [time, date, week, month]
    sql: ${TABLE}.last_updated ;;
  }

  dimension: marital_status {
    hidden: yes
    type: number
    sql: ${TABLE}.marital_status ;;
  }

  dimension_group: move_in {
    label: "Housing Move-in"
    description: "HMIS Data Element 3.20"
    type: time
    timeframes: [date, week, month]
    convert_tz: no
    sql: ${TABLE}.move_in_date ;;
  }

  dimension: permanent_housing_is {
    # retired field
    type: number
    sql: ${TABLE}.permanent_housing_is ;;
  }

  dimension: path_engagement {
    hidden: yes
    type: number
    sql: ${TABLE}.path_engagement ;;
  }


  dimension: path_engagement_date {
    label: "Date of Engagement"
    description: "HMIS Data Element 4.13.1"
    type: date
    sql: ${TABLE}.path_engagement_date ;;
  }

  dimension: path_status_determination {
    hidden: yes
    group_label: "PATH Questions"
    type: yesno
    sql: ${TABLE}.path_status_is ;;
  }

  dimension: path_enrollment_status {
    label: "Client Became Enrolled in PATH"
    description: "HMIS Data Element P3.2"
    group_label: "PATH Questions"
    type: yesno
    sql: ${TABLE}.path_status ;;
  }

  dimension: path_status_determination_date {
    label: "Status Determination Date"
    description: "HMIS Data Element P3.1"
    group_label: "PATH Questions"
    type: date
    sql: ${TABLE}.path_status_determination ;;
  }

  dimension: path_not_enrolled_reason {
    label: "Reason not Enrolled"
    description: "HMIS Data Element P3.2A"
    group_label: "PATH Questions"
    sql: fn_getPicklistValueName('path_not_enrolled_reason',${TABLE}.path_not_enrolled_reason) ;;
  }

  dimension: prior_duration_text {
    label: "Length of Stay in Prior Living Situation"
    description: "HMIS Data Element 3.917.2"
    sql: fn_getPicklistValueName('prior_duration',${prior_duration}) ;;
  }

  dimension: prior_city {
    label: "City"
    group_label: "Last Permanent Address"
    description: "HMIS Data Element V5.2"
    sql: ${TABLE}.prior_city ;;
  }

  dimension: prior_duration {
    label: "Length of Stay in Prior Living Situation"
    hidden: yes
    description: "HMIS Data Element 3.917.2"
    type: number
    sql: ${TABLE}.prior_duration ;;
  }

  dimension: prior_residence {
    hidden: yes
    type: number
    sql: ${TABLE}.prior_residence ;;
  }

  dimension: prior_residence_text {
    label: "Type of Residence"
    description: "HMIS Data Element 3.917.1"
    sql: fn_getPicklistValueName('prior_residence',${prior_residence}) ;;
  }

  dimension: prior_residence_other {
    hidden: yes
    sql: ${TABLE}.prior_residence_other ;;
  }

  dimension: prior_state {
    label: "State"
    group_label: "Last Permanent Address"
    description: "HMIS Data Element V5.3"
    sql: ${TABLE}.prior_state ;;
  }

  dimension: prior_street_address {
    label: "Street Address"
    group_label: "Last Permanent Address"
    description: "HMIS Data Element V5.1"
    sql: ${TABLE}.prior_street_address ;;
  }

  dimension_group: program {
    label: "Information Date"
    description: "HMIS Data Element 5.4 On the Entry or Enrollment Screen, Information Date = Project Start Date"
    type: time
    timeframes: [date, week, month]
    convert_tz: no
    sql: ${TABLE}.program_date ;;
  }

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

  dimension: ref_agency {
    hidden: yes
    type: number
    sql: ${TABLE}.ref_agency ;;
  }

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

  dimension: ref_user {
    label: "User Creating"
    description: "User created project enrollment (HMIS Data Element 5.7)"
    sql: fn_getUserNameById(${TABLE}.ref_user) ;;
  }

  dimension: ref_user_updated {
    label: "User Updating"
    description: "User updated Project Update, Annual Assessment, Exit or Post Exit (HMIS Data Element 5.7)"
    sql: fn_getUserNameById(${TABLE}.ref_user_updated) ;;
  }

  dimension: screen_type {
    hidden: yes
    type: number
    sql: ${TABLE}.screen_type ;;
  }

  dimension: screen_type_text {
    hidden: yes
    sql: CASE
      WHEN ${screen_type} = 2 THEN '1 - Enrollment'
      WHEN ${screen_type} = 3 THEN '2 - Update'
      WHEN ${screen_type} = 4 THEN '4 - Exit'
      WHEN ${screen_type} = 5 THEN '3 - Annual Assessment'
      END
       ;;
  }

  dimension: zipcode {
    label: "Zip Code"
    group_label: "Last Permanent Address"
    description: "HMIS Data Element V5.4"
    type: zipcode
    sql: ${TABLE}.zipcode ;;
  }

  dimension: zipcode_quality {
    hidden: yes
    # retired data element
    type: number
    sql: ${TABLE}.zipcode_quality ;;
  }

  dimension: rhy_bcp_is {
    label: "BCP Status Determined"
    group_label: "RHY Questions"
    hidden: yes
    # Retired data element
    type: yesno
    sql: ${TABLE}.rhy_bcp_is ;;
  }

  dimension: rhy_fysb_youth {
    label: "FYSB Youth"
    description: "Youth Eligible for RHY Services (HMIS Data Element R2.2)"
    group_label: "RHY Questions"
    type: yesno
    sql: ${TABLE}.rhy_fysb_youth ;;
  }

  dimension: rhy_no_svc_reason {
    label: "BCP Status: Reason for not providing services"
    description: "Reason why services are not funded by BCP grant (HMIS Data Element R2.2A)"
    group_label: "RHY Questions"
    sql: fn_getPicklistValueName('rhy_no_svc_reason',${TABLE}.rhy_no_svc_reason) ;;
  }

  dimension: rhy_sexual_orientation {
    label: "Sexual Orientation"
    description: "(HMIS Data Element R3)"
    group_label: "RHY Questions"
    sql: fn_getPicklistValueName('rhy_sexual_orientation',${TABLE}.rhy_sexual_orientation) ;;
  }

  dimension: rhy_education_level {
    label: "Last Grade Completed"
    description: "(HMIS Data Element R4)"
    group_label: "RHY Questions"
    sql: fn_getPicklistValueName('rhy_education_level',${TABLE}.rhy_education_level) ;;
  }

  dimension: rhy_school_status {
    label: "School Status"
    description: "(HMIS Data Element R5)"
    group_label: "RHY Questions"
    sql: fn_getPicklistValueName('rhy_school_status',${TABLE}.rhy_school_status) ;;
  }

  dimension: rhy_employment_type {
    label: "Employment Type"
    description: "(HMIS Data Element R6.2)"
    group_label: "RHY Questions"
    sql: fn_getPicklistValueName('rhy_employment_type',${TABLE}.rhy_employment_type) ;;
  }

  dimension: rhy_reason_not_employed {
    label: "Employed: Why not"
    description: "(HMIS Data Element R6.2B)"
    group_label: "RHY Questions"
    sql: fn_getPicklistValueName('rhy_reason_not_employed',${TABLE}.rhy_reason_not_employed) ;;
  }

  dimension: rhy_dental_health {
    label: "Dental Health Status"
    description: "(HMIS Data Element R8)"
    group_label: "RHY Questions"
    sql: fn_getPicklistValueName('rhy_dental_health',${TABLE}.rhy_dental_health) ;;
  }

  dimension: rhy_mental_health {
    label: "Mental Health Status"
    description: "(HMIS Data Element R9)"
    group_label: "RHY Questions"
    sql: fn_getPicklistValueName('rhy_mental_health',${TABLE}.rhy_mental_health) ;;
  }

  dimension: previous_foster_care {
    label: "Foster Care: Former Ward"
    description: "(HMIS Data Element R11.1)"
    group_label: "RHY Questions"
    sql: fn_getPicklistValueName('previous_foster_care',${TABLE}.previous_foster_care) ;;
  }

  dimension: rhy_foster_length_years {
    label: "Foster Care: Number of Years"
    description: "(HMIS Data Element R11.1A)"
    group_label: "RHY Questions"
    sql: fn_getPicklistValueName('rhy_foster_length_years',${TABLE}.rhy_foster_length_years) ;;
  }

  dimension: rhy_former_justice {
    label: "Juvenile Justice: Former Ward"
    description: "(HMIS Data Element R12.1)"
    group_label: "RHY Questions"
    sql: fn_getPicklistValueName('rhy_former_justice',${TABLE}.rhy_former_justice) ;;
  }

  dimension: rhy_justice_length_years {
    label: "Juvenile Justice: Number of Years"
    description: "(HMIS Data Element R12.1A)"
    group_label: "RHY Questions"
    sql: fn_getPicklistValueName('rhy_justice_length_years',${TABLE}.rhy_justice_length_years) ;;
  }

#  dimension: rhy_crit_household {
#    label: "Household Dynamics - Youth"
#   type: yesno
#    group_label: "RHY Critical Issues - Youth"
#    sql: fn_getPicklistValueName('rhy_crit_household',${TABLE}.rhy_crit_household) ;;
#  }

#  dimension: rhy_crit_identity_youth {
#    label: "Sexual Orientation/Gender Identity - Youth"
#    type: yesno
#    group_label: "RHY Critical Issues - Youth"
#    sql: fn_getPicklistValueName('rhy_crit_identity_youth',${TABLE}.rhy_crit_identity_youth) ;;
#  }

#  dimension: rhy_crit_housing_youth {
#    label: "Housing Issues - Youth"
#    type: yesno
#    group_label: "RHY Critical Issues - Youth"
#    sql: fn_getPicklistValueName('rhy_crit_housing_youth',${TABLE}.rhy_crit_housing_youth) ;;
#  }

#  dimension: rhy_crit_school_youth {
#    label: "School or Educational Issues - Youth"
#    type: yesno
#    group_label: "RHY Critical Issues - Youth"
#    sql: fn_getPicklistValueName('rhy_crit_school_youth',${TABLE}.rhy_crit_school_youth) ;;
#  }

#  dimension: rhy_crit_unemployment_youth {
#    label: "Unemployment - Youth"
#    type: yesno
#    group_label: "RHY Critical Issues - Youth"
#    sql: fn_getPicklistValueName('rhy_crit_unemployment_youth',${TABLE}.rhy_crit_unemployment_youth) ;;
#  }

#  dimension: rhy_crit_disability_mental_youth {
#    label: "Mental Disability- Youth"
#    type: yesno
#    group_label: "RHY Critical Issues - Youth"
#    sql: fn_getPicklistValueName('rhy_crit_disability_mental_youth',${TABLE}.rhy_crit_disability_mental_youth) ;;
#  }

#  dimension: rhy_crit_health_youth {
#    label: "Health Issues - Youth"
#    type: yesno
#    group_label: "RHY Critical Issues - Youth"
#    sql: fn_getPicklistValueName('rhy_crit_health_youth',${TABLE}.rhy_crit_health_youth) ;;
#  }

#  dimension: rhy_crit_disability_physical_youth {
#    label: "Physical Disability - Youth"
#    type: yesno
#    group_label: "RHY Critical Issues - Youth"
#    sql: fn_getPicklistValueName('rhy_crit_disability_physical_youth',${TABLE}.rhy_crit_disability_physical_youth) ;;
#  }

#  dimension: rhy_crit_abuse_youth {
#    label: "Abuse & Neglect - Youth"
#    type: yesno
#    group_label: "RHY Critical Issues - Youth"
#    sql: fn_getPicklistValueName('rhy_crit_abuse_youth',${TABLE}.rhy_crit_abuse_youth) ;;
#  }

#  dimension: rhy_crit_mental_youth {
#    label: "Mental Health Issues - Youth"
#    type: yesno
#    group_label: "RHY Critical Issues - Youth"
#    sql: fn_getPicklistValueName('rhy_crit_mental_youth',${TABLE}.rhy_crit_mental_youth) ;;
#  }

#  dimension: rhy_crit_substance_youth {
#    label: "Alcohol or Other Drug Abuse - Youth"
#    type: yesno
#    group_label: "RHY Critical Issues - Youth"
#    sql: fn_getPicklistValueName('rhy_crit_substance_youth',${TABLE}.rhy_crit_substance_youth) ;;
#  }

#  dimension: rhy_crit_incarcerated_parent {
#    label: "Incarcerated Parent - Youth"
#    type: yesno
#    group_label: "RHY Critical Issues - Youth"
#    sql: fn_getPicklistValueName('rhy_crit_incarcerated_parent',${TABLE}.rhy_crit_incarcerated_parent) ;;
#  }

#  dimension: rhy_crit_identity_family {
#    label: "Sexual Orientation/Gender Identity - Family"
#    type: yesno
#    group_label: "RHY Critical Issues - Family"
#    sql: fn_getPicklistValueName('rhy_crit_identity_family',${TABLE}.rhy_crit_identity_family) ;;
#  }

#  dimension: rhy_crit_housing_family {
#    label: "Housing Issues - Family"
#    type: yesno
#    group_label: "RHY Critical Issues - Family"
#    sql: fn_getPicklistValueName('rhy_crit_housing_family',${TABLE}.rhy_crit_housing_family) ;;
#  }

#  dimension: rhy_crit_school_family {
#    label: "School or Educational Issues - Family"
#    type: yesno
#    group_label: "RHY Critical Issues - Family"
#    sql: fn_getPicklistValueName('rhy_crit_school_family',${TABLE}.rhy_crit_school_family) ;;
#  }

  dimension: rhy_crit_unemployment_family {
    label: "Unemployment - Family"
    description: "(HMIS Data Element R13.9)"
    type: yesno
    group_label: "RHY Family Critical Issues"
    sql: fn_getPicklistValueName('rhy_crit_unemployment_family',${TABLE}.rhy_crit_unemployment_family) ;;
  }

  dimension: rhy_crit_mental_family {
    label: "Mental Health Issues - Family"
    description: "(HMIS Data Element R13.11)"
    type: yesno
    group_label: "RHY Family Critical Issues"
    sql: fn_getPicklistValueName('rhy_crit_mental_family',${TABLE}.rhy_crit_mental_family) ;;
  }

#  dimension: rhy_crit_health_family {
#    label: "Health Issues - Family"
#    type: yesno
#    group_label: "RHY Critical Issues - Family"
#    sql: fn_getPicklistValueName('rhy_crit_health_family',${TABLE}.rhy_crit_health_family) ;;
#  }

  dimension: rhy_crit_disability_physical_family {
    label: "Physical Disability - Family"
    description: "(HMIS Data Element R13.15)"
    type: yesno
    group_label: "RHY Family Critical Issues"
    sql: fn_getPicklistValueName('rhy_crit_disability_physical_family',${TABLE}.rhy_crit_disability_physical_family) ;;
  }

#  dimension: rhy_crit_disability_mental_family {
#    label: "Mental Disability - Family"
#    type: yesno
#    group_label: "RHY Critical Issues - Family"
#    sql: fn_getPicklistValueName('rhy_crit_disability_mental_family',${TABLE}.rhy_crit_disability_mental_family) ;;
#  }

#  dimension: rhy_crit_abuse_family {
#    label: "Abuse & Neglect - Family"
#    type: yesno
#    group_label: "RHY Critical Issues - Family"
#    sql: fn_getPicklistValueName('rhy_crit_abuse_family',${TABLE}.rhy_crit_abuse_family) ;;
#  }

  dimension: rhy_crit_substance_family {
    label: "Alcohol or Other Drug Abuse - Family"
    description: "(HMIS Data Element R13.21)"
    type: yesno
    group_label: "RHY Family Critical Issues"
    sql: fn_getPicklistValueName('rhy_crit_substance_family',${TABLE}.rhy_crit_substance_family) ;;
  }

  dimension: rhy_crit_income_family {
    label: "Insufficient Income - Family"
    description: "(HMIS Data Element R13.22)"
    type: yesno
    group_label: "RHY Family Critical Issues"
    sql: fn_getPicklistValueName('rhy_crit_income_family',${TABLE}.rhy_crit_income_family) ;;
  }

#  dimension: rhy_crit_military_family {
#    label: "Active Military Parent - Family"
#    type: yesno
#    group_label: "RHY Critical Issues - Family"
#    sql: fn_getPicklistValueName('rhy_crit_military_family',${TABLE}.rhy_crit_military_family) ;;
#  }

  dimension: rhy_referral_src {
    label: "Referral Source"
    description: "(HMIS Data Element R1.1)"
    group_label: "RHY Questions"
    sql: fn_getPicklistValueName('rhy_referral_src',${TABLE}.rhy_referral_src) ;;
  }

  dimension: rhy_referral_freq_approached {
    label: "Referral Source: Times Approached Prior to Project Start"
    description: "(HMIS Data Element R1.1A)"
    group_label: "RHY Questions"
    sql: fn_getPicklistValueName('rhy_referral_freq_approached',${TABLE}.rhy_referral_freq_approached) ;;
  }

  dimension: rhy_labor_exploitation_threats {
    label: "Afraid to quit/leave work due to threats"
    group_label: "RHY Commercial Labor Exploitation"
    hidden: yes
    # Now collected at Project Exit
    description: "HMIS Data Element R16.1"
    sql: fn_getPicklistValueName('rhy_labor_exploitation_threats',${TABLE}.rhy_labor_exploitation_threats) ;;
  }

  dimension: rhy_labor_exploitation_payment {
    label: "Promised work, work or payment different"
    group_label: "RHY Commercial Labor Exploitation"
    description: "HMIS Data Element R16.2"hidden: yes
    # Now collected at Project Exit
    sql: fn_getPicklistValueName('rhy_labor_exploitation_payment',${TABLE}.rhy_labor_exploitation_payment) ;;
  }

  dimension: rhy_labor_exploitation_forced_tricked {
    label: "Felt forced/pressured/tricked into continuing job"
    group_label: "RHY Commercial Labor Exploitation"
    hidden: yes
    # Now collected at Project Exit
    description: "HMIS Data Element R16.2A"
    sql: fn_getPicklistValueName('rhy_labor_exploitation_forced_tricked',${TABLE}.rhy_labor_exploitation_forced_tricked) ;;
  }

  dimension: rhy_labor_exploitation_times {
    label: "Exploited by work, in last three months"
    group_label: "RHY Commercial Labor Exploitation"
    hidden: yes
    # Now collected at Project Exit
    description: "HMIS Data Element R16.2B"
    sql: fn_getPicklistValueName('rhy_labor_exploitation_times',${TABLE}.rhy_labor_exploitation_times) ;;
  }

  dimension: rhy_exploitation {
    label: "Exchange for sex, ever received anything"
    hidden: yes
    # Now collected at Project Exit
    group_label: "RHY Commercial Sexual Exploitation"
    sql: fn_getPicklistValueName('rhy_exploitation',${TABLE}.rhy_exploitation) ;;
  }

  dimension: rhy_exploitation_times {
    label: "Exchange for sex, in last three months"
    hidden: yes
    # Now collected at Project Exit
    group_label: "RHY Commercial Sexual Exploitation"
    sql: fn_getPicklistValueName('rhy_exploitation_times',${TABLE}.rhy_exploitation_times) ;;
  }

  dimension: rhy_exploitation_frequency {
    label: "Exchange for sex, number of times"
    hidden: yes
    # Now collected at Project Exit
    group_label: "RHY Commercial Sexual Exploitation"
    sql: fn_getPicklistValueName('rhy_exploitation_frequency',${TABLE}.rhy_exploitation_frequency) ;;
  }

  dimension: rhy_exploitation_ask {
    label: "Made/persuaded to have sex in exchange for something"
    hidden: yes
    # Now collected at Project Exit
    group_label: "RHY Commercial Sexual Exploitation"
    sql: fn_getPicklistValueName('rhy_exploitation_ask',${TABLE}.rhy_exploitation_ask) ;;
  }

  dimension: rhy_exploitation_ask_times {
    label: "Made/persuaded to have sex, in last three months"
    hidden: yes
    # Now collected at Project Exit
    group_label: "RHY Commercial Sexual Exploitation"
    sql: fn_getPicklistValueName('rhy_exploitation_ask_times',${TABLE}.rhy_exploitation_ask_times) ;;
  }

  dimension: ami_percent {
    label: "Percent of AMI"
    description: "HMIS Data Element V4.1 Percent of Area Median Income"
    group_label: "SSVF/VASH"
    sql: fn_getPicklistValueName('ami_percent',${TABLE}.ami_percent) ;;
  }

  dimension: prior_address_quality {
    label: "Address Data Quality"
    description: "HMIS Data Element V5.5"
    group_label: "Last Permanent Address"
    sql: fn_getPicklistValueName('prior_address_quality',${TABLE}.prior_address_quality) ;;
  }

  dimension: vamc_station_number {
    label: "VAMC Station Number"
    description: "HMIS Data Element V6.1 VA Medical Center"
    group_label: "SSVF/VASH"
    sql: fn_getPicklistValueName('vamc_station_number',${TABLE}.vamc_station_number) ;;
  }

  dimension: hp_screening_score {
    hidden: yes
    label: "HP Screening Score"
    group_label: "SSVF/VASH"
    sql: ${TABLE}.hp_screening_score ;;
  }

  dimension: ssvf_targeting_field_14 {
    label: "Single Parent With Minor Child(ren)"
    description: "HMIS Data Element V7.14"
    group_label: "SSVF/VASH"
    type: yesno
    sql: ${TABLE}.ssvf_targeting_field_14 ;;
  }

  dimension: ssvf_targeting_field_20 {
    label: "HP Applicant Total Points (integer)"
    description: "HMIS Data Element V7.20"
    group_label: "SSVF/VASH"
    type: number
    sql: ${TABLE}.ssvf_targeting_field_20 ;;
  }

  dimension: ssvf_targeting_field_21 {
    label: "Grantee Targeting Threshold Score (integer)"
    description: "HMIS Data Element V7.21"
    group_label: "SSVF/VASH"
    type: number
    sql: ${TABLE}.ssvf_targeting_field_21 ;;
  }

  dimension: soar_connected {
    label: "SOAR Connected"
    description: "Client is connected to SSI/SSDI Outreach, Access and Recovery technical assistance program (HMIS Data Element P4)"
    sql: fn_getPicklistValueName('soar_connected',${TABLE}.soar_connected) ;;
  }

  measure: count {
    hidden: yes
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      clients.id,
      client_programs.id,
      clients.full_name,
      programs.name,
      client_programs.start_date,
      entry_screen.housing_status_text,
      client_programs.end_date,
      client_programs.still_in_program
    ]
  }

  set: CESet {
    fields: [-age]
  }
}
