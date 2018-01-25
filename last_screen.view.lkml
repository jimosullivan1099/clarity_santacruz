view: last_screen {
  label: "Update/Exit Screen"
  sql_table_name: client_program_demographics   ;;

  dimension: id {
    hidden: yes
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension_group: added {
    description: "Date the Status/Annual Assessment or Project Exit was added to Clarity"
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.added_date ;;
  }

  dimension: benefits_snap {
    label: "SNAP"
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
    label: "No Health Insurance"
    hidden: yes
    group_label: "Health Insurance"
    type: yesno
    sql: ${TABLE}.benefits_no_insurance ;;
  }

  dimension: benefits_noncash {
    label: "Non-Cash Benefit from Any Source"
    description: "Is the client receiving any non-cash benefits (HMIS DATA Element 4.3.1)"
    group_label: "Non-Cash Benefits"
    sql: fn_getPicklistValueName('benefits_noncash', ${TABLE}.benefits_noncash) ;;
  }

  dimension: benefits_other {
    label: "Other Health Insurance"
    description: "HMIS Data Element 4.4.12"
    type: number
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
#   description: "Receiving Section 8 benefits (HMIS Data Element 4.3.8)"
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
#   description: "Receiving Temporary Rental Assistance benefits (HMIS Data Element 4.3.10)"
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

  dimension: chronic_1 {
    hidden: yes
    type: number
    sql: ${TABLE}.chronic_1 ;;
  }

  dimension: chronic_2 {
    hidden: yes
    type: number
    sql: ${TABLE}.chronic_2 ;;
  }

  dimension: chronic_3 {
    hidden: yes
    type: number
    sql: ${TABLE}.chronic_3 ;;
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

  dimension: chronic_homeless {
    hidden: yes
    type: number
    sql: ${TABLE}.chronic_homeless ;;
  }

  dimension: Employed {
    description: "HMIS Data Element R6"
    sql: fn_getPicklistValueName('employment_is',${TABLE}.employment_is) ;;
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

  dimension: exit_destination {
    hidden: yes
    type: number
    sql: ${TABLE}.exit_destination ;;
  }

  dimension: exit_destination_text {
    label: "Exit Destination"
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
    sql: fn_getPicklistValueName('exit_destination',${exit_destination}) ;;
  }




  dimension: housed_on_exit {
    label: "Housed on Exit"
    description: "Client has been Permanently Housed. Based on Exit Destination"

    case: {
      when: {
        sql: ${exit_destination} in (10,11,19,20,21,22,23,26,28,3,31) ;;
        label: "Housed"
      }

      else: "Not Housed"
    }
  }

  dimension: exit_reason {
    hidden: yes
    type: number
    sql: ${TABLE}.exit_reason ;;
  }

  dimension: exit_reason_text {
    label: "Exit Reason"
    description: "No longer a HUD data element. Why did the client exit the project"
    sql: fn_getPicklistValueName('exit_reason',${exit_reason}) ;;
  }

  dimension: health_chronic {
    label: "Chronic Health"
    description: "The client has a chronic health disabling condition (HMIS Data Element 4.7.1)"
    group_label: "Disability Information"
    sql: fn_getPicklistValueName('health_chronic',${TABLE}.health_chronic) ;;
  }

  dimension: health_dv_fleeing {
    label: "Currently Fleeing Domestic Violence"
    description: "HMIS Data Element 4.11.2B"
    group_label: "Domestic Violence"
    sql: fn_getPicklistValueName('health_dv_fleeing',${TABLE}.health_dv_fleeing) ;;
  }

  #- dimension: health_chronic_documented
  #  type: number
  #  sql: ${TABLE}.health_chronic_documented

  #- dimension: health_chronic_longterm
  #  type: number
  #  sql: ${TABLE}.health_chronic_longterm

  #- dimension: health_chronic_services
  #  type: number
  #  sql: ${TABLE}.health_chronic_services

  dimension: health_chronic_services {
    label: "Chronic Health Services"
    hidden: yes
    #Retired field
    group_label: "Disability Information"
    sql: fn_getPicklistValueName('health_chronic_services',${TABLE}.health_chronic_services) ;;
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

  #- dimension: health_dev_disability_documented
  #  type: number
  #  sql: ${TABLE}.health_dev_disability_documented

  #- dimension: health_dev_disability_independence
  #  type: number
  #  sql: ${TABLE}.health_dev_disability_independence

  #- dimension: health_dev_disability_services
  #  type: number
  #  sql: ${TABLE}.health_dev_disability_services

  dimension: health_dev_disability_services {
    label: "Developmental Services"
    hidden: yes
    #Retired field
    group_label: "Disability Information"
    sql: fn_getPicklistValueName('health_dev_disability_services',${TABLE}.health_dev_disability_services) ;;
  }

  dimension: health_dev_disability_independence {
    label: "Developmental Independence"
    description: "Developmental disability expected to substantially impair ability to live independently (HMIS Data Element 4.6.2A)"
    group_label: "Disability Information"
    sql: fn_getPicklistValueName('health_dev_disability_independence',${TABLE}.health_dev_disability_independence) ;;
  }

  dimension: health_dv {
    label: "Domestic Violence"
    description: "HMIS Data Element 4.11.2"
    group_label: "Domestic Violence"
    sql: fn_getPicklistValueName('health_dv',${TABLE}.health_dv) ;;
  }

  #- dimension: health_dv_occurred
  #  type: number
  #  sql: ${TABLE}.health_dv_occurred

  #- dimension: health_general
  #  type: number
  #  sql: ${TABLE}.health_general

  dimension: health_hiv {
    label: "HIV/AIDS"
    description: "The client has HIV/AIDS (HMIS Data Element 4.8.1)"
    group_label: "Disability Information"
    sql: fn_getPicklistValueName('health_hiv',${TABLE}.health_hiv) ;;
  }

  #  - dimension: health_hiv_documented
  #    type: number
  #    sql: ${TABLE}.health_hiv_documented

  #  - dimension: health_hiv_independence
  #    type: number
  #    sql: ${TABLE}.health_hiv_independence

  #  - dimension: health_hiv_services
  #    type: number
  #    sql: ${TABLE}.health_hiv_services

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

  dimension: health_mental {
    label: "Mental Health"
    description: "The client has a mental health disabling condition (HMIS Data Element 4.9.1)"
    group_label: "Disability Information"
    sql: fn_getPicklistValueName('health_mental',${TABLE}.health_mental) ;;
  }

  #   - dimension: health_mental_confirmed
  #     type: number
  #     sql: ${TABLE}.health_mental_confirmed
  #
  #   - dimension: health_mental_documented
  #     type: number
  #     sql: ${TABLE}.health_mental_documented
  #
  #   - dimension: health_mental_longterm
  #     type: number
  #     sql: ${TABLE}.health_mental_longterm
  #
  #   - dimension: health_mental_services
  #     type: number
  #     sql: ${TABLE}.health_mental_services
  #
  #   - dimension: health_mental_smi
  #     type: number
  #     sql: ${TABLE}.health_mental_smi

  dimension: health_mental_services {
    label: "Mental Health Services"
    hidden: yes
    #Retired field
    group_label: "Disability Information"
    sql: fn_getPicklistValueName('health_mental_services',${TABLE}.health_mental_services) ;;
  }

  dimension: health_mental_longterm {
    label: "Mental Health Longterm"
    description: "Mental health disabling condition expected to be long-continued and indefinite duration (HMIS Data Element 4.9.2A)"
    group_label: "Disability Information"
    sql: fn_getPicklistValueName('health_mental_longterm',${TABLE}.health_mental_longterm) ;;
  }

  dimension: health_phys_disability {
    label: "Physical"
    description: "The client has a physical disabling condition (HMIS Data Element 4.5.1)"
    group_label: "Disability Information"
    sql: fn_getPicklistValueName('health_phys_disability',${TABLE}.health_phys_disability) ;;
  }

  measure: average_cash_income {
    # can be average, sum, min, max, count, count_distinct, or number
    type: average
    value_format_name: usd
    description: "Mean average of income from all sources"
    group_label: "Income Sources and Amounts"
    sql: ${income_individual} ;;
  }

  dimension: income_earned_is {
    label: "Earned Income"
    description: "HMIS Data Element 4.2.3"
    type: yesno
    group_label: "Income Sources and Amounts"
    sql: ${TABLE}.income_earned_is ;;
  }

  dimension: rhy_employment_type {
    label: "Employment Type"
    description: "(HMIS Data Element R6.2A)"
    group_label: "RHY Questions"
    sql: fn_getPicklistValueName('rhy_employment_type',${TABLE}.rhy_employment_type) ;;
  }

  dimension: rhy_reason_not_employed {
    label: "Employed: Why not"
    description: "(HMIS Data Element R6.2B)"
    group_label: "RHY Questions"
    sql: fn_getPicklistValueName('rhy_reason_not_employed',${TABLE}.rhy_reason_not_employed) ;;
  }

  dimension: rhy_exploitation {
    label: "Exchange for sex, ever received anything"
    description: "(HMIS Data Element R15.1)"
    group_label: "RHY Commercial Sexual Exploitation"
    sql: fn_getPicklistValueName('rhy_exploitation',${TABLE}.rhy_exploitation) ;;
  }

  dimension: rhy_exploitation_times {
    label: "Exchange for sex, in last three months"
    description: "(HMIS Data Element R15.1A)"
    group_label: "RHY Commercial Sexual Exploitation"
    sql: fn_getPicklistValueName('rhy_exploitation_times',${TABLE}.rhy_exploitation_times) ;;
  }

  dimension: rhy_exploitation_frequency {
    label: "Exchange for sex, number of times"
    description: "(HMIS Data Element R15.1B)"
    group_label: "RHY Commercial Sexual Exploitation"
    sql: fn_getPicklistValueName('rhy_exploitation_frequency',${TABLE}.rhy_exploitation_frequency) ;;
  }

  dimension: rhy_exploitation_ask {
    label: "Made/persuaded to have sex in exchange for something"
    description: "(HMIS Data Element R15.1C)"
    group_label: "RHY Commercial Sexual Exploitation"
    sql: fn_getPicklistValueName('rhy_exploitation_ask',${TABLE}.rhy_exploitation_ask) ;;
  }

  dimension: rhy_exploitation_ask_times {
    label: "Made/persuaded to have sex, in last three months"
    description: "(HMIS Data Element R15.1D)"
    group_label: "RHY Commercial Sexual Exploitation"
    sql: fn_getPicklistValueName('rhy_exploitation_ask_times',${TABLE}.rhy_exploitation_ask_times) ;;
  }

  dimension: rhy_labor_exploitation_threats {
    label: "Afraid to quit/leave work due to threats"
    group_label: "RHY Commercial Labor Exploitation"
    description: "HMIS Data Element R16.1"
    sql: fn_getPicklistValueName('rhy_labor_exploitation_threats',${TABLE}.rhy_labor_exploitation_threats) ;;
  }

  dimension: rhy_labor_exploitation_payment {
    label: "Promised work, work or payment different"
    group_label: "RHY Commercial Labor Exploitation"
    description: "HMIS Data Element R16.2"
    sql: fn_getPicklistValueName('rhy_labor_exploitation_payment',${TABLE}.rhy_labor_exploitation_payment) ;;
  }

  dimension: rhy_labor_exploitation_forced_tricked {
    label: "Felt forced/pressured/tricked into continuing job"
    group_label: "RHY Commercial Labor Exploitation"
    description: "HMIS Data Element R16.2A"
    sql: fn_getPicklistValueName('rhy_labor_exploitation_forced_tricked',${TABLE}.rhy_labor_exploitation_forced_tricked) ;;
  }

  dimension: rhy_labor_exploitation_times {
    label: "Exploited by work, in last three months"
    group_label: "RHY Commercial Labor Exploitation"
    description: "HMIS Data Element R16.2B"
    sql: fn_getPicklistValueName('rhy_labor_exploitation_times',${TABLE}.rhy_labor_exploitation_times) ;;
  }

  dimension: rhy_counseling {
    label: "Counseling Received by Client"
    group_label: "RHY Questions"
    description: "HMIS Data Element R18.1"
    sql: fn_getPicklistValueName('rhy_counseling',${TABLE}.rhy_counseling) ;;
  }

  dimension: rhy_counseling_family {
    label: "Counseling - Family"
    group_label: "RHY Questions"
    description: "HMIS Data Element R18.1A"
    sql: fn_getPicklistValueName('rhy_counseling_family',${TABLE}.rhy_counseling_family) ;;
  }

  dimension: rhy_counseling_group {
    label: "Counseling - Group"
    group_label: "RHY Questions"
    description: "HMIS Data Element R18.1A"
    sql: fn_getPicklistValueName('rhy_counseling_group',${TABLE}.rhy_counseling_group) ;;
  }

  dimension: rhy_counseling_individual {
    label: "Counseling - Individual"
    group_label: "RHY Questions"
    description: "HMIS Data Element R18.1A"
    sql: fn_getPicklistValueName('rhy_counseling_individual',${TABLE}.rhy_counseling_individual) ;;
  }

  dimension: rhy_counseling_post_exit_plan {
    label: "Counseling Plan Post Exit"
    group_label: "RHY Questions"
    description: "HMIS Data Element R18.3"
    sql: fn_getPicklistValueName('rhy_counseling_post_exit_plan',${TABLE}.rhy_counseling_post_exit_plan) ;;
  }

  dimension: rhy_counseling_num_planned {
    label: "Counseling - Number Sessions Planned"
    group_label: "RHY Questions"
    description: "HMIS Data Element R18.2"
#    sql: fn_getPicklistValueName('${rhy_counseling_num_planned}',${TABLE}.rhy_counseling_num_planned) ;;
    sql: ${TABLE}.rhy_counseling_num_planned) ;;
  }

  dimension: rhy_counseling_num_sessions {
    label: "Counseling - Number Sessions Received"
    group_label: "RHY Questions"
    description: "HMIS Data Element R18.1B"
#    sql: fn_getPicklistValueName('${rhy_counseling_num_sessions}',${TABLE}.rhy_counseling_num_sessions) ;;
    sql: ${TABLE}.rhy_counseling_num_sessions) ;;
  }

  dimension: rhy_aftercare_yn {
    label: "Aftercare was Provided"
    group_label: "RHY Questions"
    description: "HMIS Data Element R20.1"
    sql: fn_getPicklistValueName('rhy_aftercare_yn',${TABLE}.rhy_aftercare_yn) ;;
  }

  dimension: rhy_aftercare_emailsocialmedia {
    label: "Aftercare - Email/Social Media"
    group_label: "RHY Questions"
    description: "HMIS Data Element R20.1"
    sql: fn_getPicklistValueName('rhy_aftercare_emailsocialmedia',${TABLE}.rhy_aftercare_emailsocialmedia) ;;
  }

  dimension: rhy_aftercare_inpersongroup {
    label: "Aftercare - In Person Group"
    group_label: "RHY Questions"
    description: "HMIS Data Element R20.1A"
    sql: fn_getPicklistValueName('rhy_aftercare_inpersongroup',${TABLE}.rhy_aftercare_inpersongroup) ;;
  }

  dimension: rhy_aftercare_inpersonindividual {
    label: "Aftercare - In Person Individual"
    group_label: "RHY Questions"
    description: "HMIS Data Element R20.1A"
    sql: fn_getPicklistValueName('rhy_aftercare_inpersonindividual',${TABLE}.rhy_aftercare_inpersonindividual) ;;
  }

  dimension: rhy_aftercare_telephone {
    label: "Aftercare - Telephone"
    group_label: "RHY Questions"
    description: "HMIS Data Element R20.1A"
    sql: fn_getPicklistValueName('rhy_aftercare_telephone',${TABLE}.rhy_aftercare_telephone) ;;
  }

  dimension: rhy_mental_health {
    label: "Mental Health Status"
    group_label: "RHY Questions"
    sql: fn_getPicklistValueName('rhy_mental_health',${TABLE}.rhy_mental_health) ;;
  }

  dimension: health_general {
    description: "HMIS Data Element R7"
    sql: fn_getPicklistValueName('health_general',${TABLE}.health_general) ;;
  }

  dimension: vash_case_mgt_exit_reason {
    label: "Case Management - Reason Exit"
    group_label: "VASH Exit Information"
    description: "HMIS Data Element V9.1"
    sql: fn_getPicklistValueName('vash_case_mgt_exit_reason',${TABLE}.vash_case_mgt_exit_reason) ;;
  }

  dimension: vash_case_mgt_exit_reason_other {
    label: "Case Management - Exit Reason Other"
    group_label: "VASH Exit Information"
    description: "HMIS Data Element V9.1A"
#    sql: fn_getPicklistValueName('${vash_case_mgt_exit_reason_other}',${TABLE}.vash_case_mgt_exit_reason_other) ;;
    sql: ${TABLE}.vash_case_mgt_exit_reason_other) ;;
  }

  #
  #   - dimension: health_phys_disability_documented
  #     type: number
  #     sql: ${TABLE}.health_phys_disability_documented
  #
  #   - dimension: health_phys_disability_longterm
  #     type: number
  #     sql: ${TABLE}.health_phys_disability_longterm
  #
  #   - dimension: health_phys_disability_services
  #     type: number
  #     sql: ${TABLE}.health_phys_disability_services
  dimension: health_phys_disability_services {
    label: "Physical Services"
    hidden: yes
    #Retired Field
    group_label: "Disability Information"
    sql: fn_getPicklistValueName('health_phys_disability_services',${TABLE}.health_phys_disability_services) ;;
  }

  dimension: health_phys_disability_longterm {
    label: "Physical Longterm"
    description: "Physical disabling condition expected to be long-continued and indefinite duration (HMIS Data Element 4.5.2A)"
    group_label: "Disability Information"
    sql: fn_getPicklistValueName('health_phys_disability_longterm',${TABLE}.health_phys_disability_longterm) ;;
  }

  #
  #   - dimension: health_pregnancy
  #     type: number
  #     sql: ${TABLE}.health_pregnancy
  #
  #   - dimension_group: health_pregnancy
  #     type: time
  #     timeframes: [date, week, month]
  #     convert_tz: false
  #     sql: ${TABLE}.health_pregnancy_date

  dimension: health_substance_abuse {
    label: "Substance Abuse"
    description: "The client has a substance abuse disabling condition (HMIS Data Element 4.10.1)"
    group_label: "Disability Information"
    sql: fn_getPicklistValueName('health_substance_abuse',${TABLE}.health_substance_abuse) ;;
  }

  #   - dimension: health_substance_abuse_confirmed
  #     type: number
  #     sql: ${TABLE}.health_substance_abuse_confirmed
  #
  #   - dimension: health_substance_abuse_documented
  #     type: number
  #     sql: ${TABLE}.health_substance_abuse_documented
  #
  #   - dimension: health_substance_abuse_longterm
  #     type: number
  #     sql: ${TABLE}.health_substance_abuse_longterm
  #
  #   - dimension: health_substance_abuse_services
  #     type: number
  #     sql: ${TABLE}.health_substance_abuse_services

  dimension: health_substance_abuse_services {
    label: "Substance Abuse Services"
    hidden: yes
    #Retired field
    group_label: "Disability Information"
    sql: fn_getPicklistValueName('health_substance_abuse_services',${TABLE}.health_substance_abuse_services) ;;
  }

  dimension: health_substance_abuse_longterm {
    label: "Substance Abuse Longterm"
    description: "Substance abuse disabling condition expected to be long-continued and indefinite duration (HMIS Data Element 4.10.2A)"
    group_label: "Disability Information"
    sql: fn_getPicklistValueName('health_substance_abuse_longterm',${TABLE}.health_substance_abuse_longterm) ;;
  }

  #
  #   - dimension: housing_ass_exit
  #     type: number
  #     sql: ${TABLE}.housing_ass_exit
  #
  #   - dimension: housing_ass_exit_1
  #     type: number
  #     sql: ${TABLE}.housing_ass_exit_1
  #
  #   - dimension: housing_ass_exit_2
  #     type: number
  #     sql: ${TABLE}.housing_ass_exit_2

  dimension: housing_ass_exit {
    label: "Housing Assessment at Exit"
    group_label: "HOPWA Questions"
    description: "Homelessness Prevention question, did client maintian or change housing situation while in program. (HMIS Data Element W5)"
    sql: fn_getPicklistValueName('housing_ass_exit',${TABLE}.housing_ass_exit) ;;
  }

  dimension: housing_status {
    hidden: yes
    type: number
    sql: ${TABLE}.housing_status ;;
  }

  dimension: housing_status_text {
    label: "Housing Status"
    description: "Retired HMIS Data Element"
    sql: fn_getPicklistValueName('housing_status',${housing_status}) ;;
  }

  #   - dimension: left_stably_housed
  #     type: yesno
  #     sql: ${housing_status_text} = 'Stably housed'
  #
  #
  #   - measure: count_stably_housed
  #     type: count_distinct
  #     sql: ${ref_client}
  #     filters:
  #       housing_status_text: 'Stably housed'

  measure: count_asked_about_housing {
    hidden: yes
    type: count_distinct
    sql: ${ref_client} ;;

    filters: {
      field: housing_status_text
      value: "-NULL"
    }
  }

  # - measure: percent_stably_housed
  #   hidden: true
  #   type: number
  #   format: '%0.1f%'
  #   sql: 100.0 * ${count_stably_housed} / NULLIF(${count_asked_about_housing},0)

  dimension: income_cash {
    type: number
    group_label: "Income Sources and Amounts"
    description: "Sum of cash income from any source. HMIS Data Element 4.2.18"
    sql: ${TABLE}.income_cash ;;
  }

  dimension: income_cash_is {
    type: number
    group_label: "Income Sources and Amounts"
    description: "HMIS Data Element 4.2.2"
    sql: ${TABLE}.income_cash_is ;;
  }

  dimension: any_income {
    label: "_Income from any Source"
    group_label: "Income Sources and Amounts"
    description: "Summarizes [Income Cash Is] to Income, No Income, Unknown"

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
    hidden: yes
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
    group_label: "Income Sources and Amounts"
    type: number
    sql: ${TABLE}.income_earned ;;
  }

  dimension: income_earned_tier {
    label: "Earned Income Tiers"
    description: "Earned Income Tiers (HMIS Data Element 4.2.3A)"
    type: tier
    style: integer
    tiers: [0, 100, 500, 1000, 5000]
    group_label: "Income Sources and Amounts"
    sql: ${income_earned} ;;
  }

  measure: average_income_earned {
    label: "Earned Income Average"
    # can be average, sum, min, max, count, count_distinct, or number
    description: "Mean average of Earned Income amount"
    type: average
    value_format_name: usd
    group_label: "Income Sources and Amounts"
  #  drill_fields: [detail*]
    sql: ${income_earned} ;;
  }

  measure: total_income_earned {
    label: "Earned Income Total"
    # can be average, sum, min, max, count, count_distinct, or number
    description: "Sum of Earned Income Amount"
    type: sum
    value_format_name: usd
    group_label: "Income Sources and Amounts"
    sql: ${income_earned} ;;
  #  drill_fields: [detail*]
  }

  measure: count_with_income {
    type: count_distinct
    group_label: "Income Sources and Amounts"
    description: "Number of clients where [Income from Any Source]=Income"
    sql: ${ref_client} ;;

    filters: {
      field: any_income
      value: "Income"
    }
  }

  measure: count_asked_about_income {
    hidden: yes
    type: count_distinct
    group_label: "Income Sources and Amounts"
    sql: ${ref_client} ;;

    filters: {
      field: any_income
      value: "No Income, Income"
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
    label: "General Assistance Amount"
    description: "HMIS Data Element 4.2.12"
    group_label: "Income Sources and Amounts"
    sql: ${TABLE}.income_ga ;;
  }

  dimension: income_ga_is {
    label: "General Assistance"
    description: "HMIS Data Element 4.2.12"
    type: yesno
    group_label: "Income Sources and Amounts"
    sql: ${TABLE}.income_ga_is ;;
  }

  # TOtal cash income for individual
  dimension: income_individual {
    label: "_Total Cash Income"
    type: number
    value_format_name: usd
    description: "Sum of cash income from all sources for individual"
    group_label: "Income Sources and Amounts"
    sql: ${TABLE}.income_individual ;;
  }

  # TOtal cash income for individual
  dimension: income_change {
    label: "_Total Change in Cash Income"
    type: number
    value_format_name: usd
    group_label: "Income Sources and Amounts"
    description: "[Upate/Exit Income for Individual from all sources]-[Entry Income for Individual from all sources]"
    sql: ${TABLE}.income_individual   -   ${entry_screen.income_individual} ;;
  }

  dimension: income_change_tier {
    label: "_Changed Tiers"
    type: tier
    style: integer
    description: "Tiered income changes: [Upate/Exit Income from all sources]-[Entry Income from all sources]"
    group_label: "Income Sources and Amounts"
    tiers: [0, 100, 500, 1000, 5000]
    sql: ${income_change} ;;
  }

  measure: average_income_change {
    # can be average, sum, min, max, count, count_distinct, or number
    type: average
    value_format_name: usd
    description: "Average income changes: [Upate/Exit Income from all sources]-[Entry Income from all sources]"
    group_label: "Income Sources and Amounts"
    sql: ${income_change} ;;
  }

  measure: total_cash_income {
    # can be average, sum, min, max, count, count_distinct, or number
    type: sum
    value_format_name: usd
    description: "Sum of income from all sources"
    group_label: "Income Sources and Amounts"
    sql: ${income_individual} ;;
  }

  #   - dimension: income_other
  #     type: number
  #     sql: ${TABLE}.income_other
  #
  #   - dimension: income_other_is
  #     type: yesno
  #     sql: ${TABLE}.income_other_is
  #
  #   - dimension: income_other_source
  #     sql: ${TABLE}.income_other_source

  dimension: income_private_disability {
    label: "Private Disability Insurance"
    hidden: yes
    group_label: "Income Sources and Amounts"
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
    type: number
    hidden: yes
    group_label: "Income Sources and Amounts"
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
    type: number
    hidden: yes
    group_label: "Income Sources and Amounts"
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
    type: number
    hidden: yes
    group_label: "Income Sources and Amounts"
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
    type: number
    hidden: yes
    group_label: "Income Sources and Amounts"
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
    type: number
    hidden: yes
    group_label: "Income Sources and Amounts"
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
    type: number
    hidden: yes
    group_label: "Income Sources and Amounts"
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
    label: "Unemployment Amount"
    group_label: "Income Sources and Amounts"
    hidden: yes
    type: number
    sql: ${TABLE}.income_unemployment ;;
  }

  measure: total_unemployment_income {
    label: "Total Unemployment Income"
    # can be average, sum, min, max, count, count_distinct, or number
    description: "Sum of Unemployment income amounts"
    type: sum
    group_label: "Income Sources and Amounts"
    value_format_name: usd
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
    type: number
    group_label: "Income Sources and Amounts"
    hidden: yes
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
    type: number
    group_label: "Income Sources and Amounts"
    hidden: yes
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
    type: number
    group_label: "Income Sources and Amounts"
    hidden: yes
    sql: ${TABLE}.income_workers_comp ;;
  }

  measure: total_workers_comp_income {
    label: "Total Workers Comp Income"
    # can be average, sum, min, max, count, count_distinct, or number
    description: "Sum of Workers Comp income amounts"
    type: sum
    group_label: "Income Sources and Amounts"
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
    description: "Date the Status/Annual Assessment or Project Exit was last updated (HMIS Data Element 5.2)"
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.last_updated ;;
  }

  #   - dimension: marital_status
  #     type: number
  #     sql: ${TABLE}.marital_status

  dimension_group: move_in {
    label: "Housing Move-in Date"
    description: "HMIS Data Element 3.20"
    type: time
    timeframes: [date, week, month]
    convert_tz: no
    sql: ${TABLE}.move_in_date ;;
  }

  dimension: permanent_housing_is {
    type: number
    sql: ${TABLE}.permanent_housing_is ;;
    #sql: fn_getPicklistValueName('permanent_housing_is',${permanent_housing_is}) ;;
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

  dimension_group: path_status_determination_date {
    label: "Status Determination"
    description: "HMIS Data Element P3.1"
    type: time
    group_label: "PATH Questions"
    timeframes: [date, week, month]
    sql: ${TABLE}.path_status_determination ;;
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
    label: "Residence Prior to Project Entry"
    hidden: yes
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
    description: "Date set by the user for Status/Annual Assessment or Project Exit (HMIS Data Element 5.4)"
    type: time
    timeframes: [date, week, month]
    convert_tz: no
    sql: ${TABLE}.program_date ;;
  }

  dimension: soar_connected {
    label: "SOAR Connected"
    description: "Client is connected to SSI/SSDI Outreach, Access and Recovery technical assistance program (HMIS Data Element P4)"
    sql: fn_getPicklistValueName('soar_connected',${TABLE}.soar_connected) ;;
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
    description: "User created Project Update, Annual Assessment, Exit or Post Exit (HMIS Data Element 5.7)"
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
    label: "Data Collection Stage"
    description: "Identifies the Data Collection Stage: Project Update (Status Assessment), Project Annual Assessment, Project Exit or Post Exit"
    sql: CASE
      WHEN ${screen_type} = 2 THEN 'Project Start'
      WHEN ${screen_type} = 3 THEN 'Project Update'
      WHEN ${screen_type} = 4 THEN 'Project Exit'
      WHEN ${screen_type} = 6 THEN 'Project Annual Assessment'
      WHEN ${screen_type} = 5 THEN 'Post Exit'
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
    # Retired data element
    type: number
    sql: ${TABLE}.zipcode_quality ;;
  }

  #   - dimension: days_since_first_screen  <---- Comparison between two screens
  #     type: number
  #     sql: datediff(${added_date},${entry_screen.added_date})

  measure: count {
    description: "Count of enrollments with update or exit"
    type: count
  #  drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------

}
