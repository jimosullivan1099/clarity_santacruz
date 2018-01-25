view: client_demographics {
  dimension: id {
    primary_key: yes
    hidden: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: ethnicity {
    type: number
    hidden: yes
    sql: ${TABLE}.ethnicity ;;
  }

  dimension: ethnicity_text {
    label: "Ethnicity"
    description: "Client's hispanic or non-hispanic ethnicity (HMIS Data Element 3.5)"
    bypass_suggest_restrictions: yes
    sql: fn_getPicklistValueName('ethnicity',${ethnicity}) ;;
  }

  dimension: name_middle {
    label: "Middle Name"
    description: "(HMIS Data Element 3.1.2)"
    sql: ${TABLE}.name_middle ;;
  }

  dimension: gender {
        type: number
    hidden: yes
    sql: ${TABLE}.gender ;;
  }

  dimension: gender_text {
    label: "Gender"
    description: "(HMIS Data Element 3.6)"
    sql: fn_getPicklistValueName('gender',${gender}) ;;
    bypass_suggest_restrictions: yes
    suggestions: [
      "Male",
      "Female",
      "Transgender Female to Male",
      "Transgender Male to Female",
      "Other",
      "Client doesn`t know",
      "Client refused",
      "Data not collected"
    ]
  }

  dimension: race {
    type: number
    hidden: yes
    sql: ${TABLE}.race ;;
  }

  dimension: race_text {
    label: "Race"
    description: "(HMIS Data Element 3.4)"
    type: string
  case: {
    when: {sql: ${TABLE}.race = 1 ;;
      label: "American Indian or Alaskan Native"
    }
    when: {sql: ${TABLE}.race = 2 ;;
      label: "Asian"
    }
    when: {sql: ${TABLE}.race = 3 ;;
      label: "Black or African American"
    }
    when: {sql: ${TABLE}.race = 4 ;;
      label: "Native Hawaiian or Other Pacific Islander"
    }
    when: {sql: ${TABLE}.race = 5 ;;
      label: "White"
    }
    when: {sql: ${TABLE}.race = 8 ;;
      label: "Client doesn't Know"
    }
    when: {sql: ${TABLE}.race = 9 ;;
      label: "Client Refused"
    }
    when: {sql: ${TABLE}.race = 99 ;;
      label: "Data Not Collected"
    }
    when: {sql: ${TABLE}.race IS NULL ;;
      label: " Null"
    }
    else: "Multi-racial"
  }
  }

  dimension: race_1_text {
    group_label: "Race - Multiple"
    label: "American Indian or Alaskan Native"
    description: "(HMIS Data Element 3.4.1)"
    bypass_suggest_restrictions: yes

    case: {
      when: {
        sql: ${TABLE}.race like '%1%' ;;
        label: "Yes"
      }

      else: "No"
    }
  }

  dimension: race_2_text {
    group_label: "Race - Multiple"
    label: "Asian"
    description: "(HMIS Data Element 3.4.2)"
    bypass_suggest_restrictions: yes

    case: {
      when: {
        sql: ${TABLE}.race like '%2%' ;;
        label: "Yes"
      }

      else: "No"
    }
  }

  dimension: race_3_text {
    group_label: "Race - Multiple"
    label: "Black or African American"
    description: "(HMIS Data Element 3.4.3)"
    bypass_suggest_restrictions: yes

    case: {
      when: {
        sql: ${TABLE}.race like '%3%' ;;
        label: "Yes"
      }

      else: "No"
    }
  }

  dimension: race_4_text {
    group_label: "Race - Multiple"
    label: "Native Hawaiian or Other Pacific Islander"
    description: "(HMIS Data Element 3.4.4)"
    bypass_suggest_restrictions: yes

    case: {
      when: {
        sql: ${TABLE}.race like '%4%' ;;
        label: "Yes"
      }

      else: "No"
    }
  }

  dimension: race_5_text {
    group_label: "Race - Multiple"
    label: "White"
    description: "(HMIS Data Element 3.4.5)"
    bypass_suggest_restrictions: yes

    case: {
      when: {
        sql: ${TABLE}.race like '%5%' ;;
        label: "Yes"
      }

      else: "No"
    }
  }

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

  dimension: veteran {
    hidden: yes
    type: number
    sql: ${TABLE}.veteran ;;
  }

  dimension: veteran_text {
    label: "Veteran Status"
    description: "Is the client a US Military Veteran (HMIS Data Element 3.7)"
    group_label: "Veteran Information"
    sql: fn_getPicklistValueName('veteran',${veteran}) ;;
    bypass_suggest_restrictions: yes
  }

  dimension: veteran_branch {
    label: "Branch of Military"
    description: "(HMIS Data Element V1.11)"
    group_label: "Veteran Information"
    sql: fn_getPicklistValueName('veteran_branch',${TABLE}.veteran_branch) ;;
  }

  dimension: veteran_discharge {
    label: "Discharge Status"
    description: "(HMIS Data Element V1.12)"
    group_label: "Veteran Information"
    sql: fn_getPicklistValueName('veteran_discharge',${TABLE}.veteran_discharge) ;;
  }

  dimension: veteran_duration {
    type: number
    hidden: yes
    # Retired data element
    group_label: "Veteran Information"
    sql: ${TABLE}.veteran_duration ;;
  }

  dimension: veteran_entered {
    label: "Year Entered Military Service"
    description: "(HMIS Data Element V1.1)"
    group_label: "Veteran Information"
    sql: ${TABLE}.veteran_entered ;;
  }

  dimension: veteran_era {
    type: number
    hidden: yes
    # Retired data element
    group_label: "Veteran Information"
    sql: ${TABLE}.veteran_era ;;
  }

  dimension: veteran_fire {
    type: number
    hidden: yes
    # Retired data element
    group_label: "Veteran Information"
    sql: ${TABLE}.veteran_fire ;;
  }

  dimension: veteran_separated {
    label: "Year Separated from Military Service"
    description: "(HMIS Data Element V1.2)"
    group_label: "Veteran Information"
    sql: ${TABLE}.veteran_separated ;;
  }

  dimension: veteran_theater_afg {
    label: "Theatre - Afghanistan OEF"
    description: "(HMIS Data Element V1.7)"
    group_label: "Veteran Information"
    sql: fn_getPicklistValueName('veteran_theater_afg',${TABLE}.veteran_theater_afg) ;;
  }

  dimension: veteran_theater_iraq1 {
    label: "Theatre - Iraq OIF"
    description: "(HMIS Data Element V1.8)"
    group_label: "Veteran Information"
    sql: fn_getPicklistValueName('veteran_theater_iraq1',${TABLE}.veteran_theater_iraq1) ;;
  }

  dimension: veteran_theater_iraq2 {
    label: "Theatre - Iraq OND"
    description: "(HMIS Data Element V1.9)"
    group_label: "Veteran Information"
    sql: fn_getPicklistValueName('veteran_theater_iraq2',${TABLE}.veteran_theater_iraq2) ;;
  }

  dimension: veteran_theater_kw {
    label: "Theatre - Korean War"
    description: "(HMIS Data Element V1.4)"
    group_label: "Veteran Information"
    sql: fn_getPicklistValueName('veteran_theater_kw',${TABLE}.veteran_theater_kw) ;;
  }

  dimension: veteran_theater_other {
    label: "Theatre - Other"
    description: "(HMIS Data Element V1.10)"
    group_label: "Veteran Information"
    sql: fn_getPicklistValueName('veteran_theater_other',${TABLE}.veteran_theater_other) ;;
  }

  dimension: veteran_theater_pg {
    label: "Theatre - Persian Gulf ODS"
    description: "(HMIS Data Element V1.6)"
    group_label: "Veteran Information"
    sql: fn_getPicklistValueName('veteran_theater_pg',${TABLE}.veteran_theater_pg) ;;
  }

  dimension: veteran_theater_vw {
    label: "Theatre - Vietnam War"
    description: "(HMIS Data Element V1.5)"
    group_label: "Veteran Information"
    sql: fn_getPicklistValueName('veteran_theater_vw',${TABLE}.veteran_theater_vw) ;;
  }

  dimension: veteran_theater_ww2 {
    label: "Theatre - World War II"
    description: "(HMIS Data Element V1.3)"
    group_label: "Veteran Information"
    sql: fn_getPicklistValueName('veteran_theater_ww2',${TABLE}.veteran_theater_ww2) ;;
  }

  dimension: veteran_warzone {
    type: number
    hidden: yes
    # Retired data element
    group_label: "Veteran Information"
    sql: ${TABLE}.veteran_warzone ;;
  }

  dimension: veteran_warzone_duration {
    type: number
    hidden: yes
    # Retired data element
    group_label: "Veteran Information"
    sql: ${TABLE}.veteran_warzone_duration ;;
  }

  dimension: veteran_warzone_is {
    type: number
    hidden: yes
    # Retired data element
    group_label: "Veteran Information"
    sql: ${TABLE}.veteran_warzone_is ;;
  }

  dimension: zipcode {
    label: "Zipcode on Profile"
    description: "This field is not an HMIS Data Element"
    type: zipcode
    sql: ${TABLE}.zipcode ;;
  }


  measure: count {
    type: count
   # drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
}
