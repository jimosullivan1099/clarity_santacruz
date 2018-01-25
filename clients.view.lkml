view: clients {
  dimension: id {
    label: "Personal Id "
    description: "Client's ID. Includes ability to link to Clarity (HUD HMIS Data Element 3.13)"
    primary_key: yes
    type: number

    link: {
      label: "Clarity Profile"
      url: "https://{{ _user_attributes[\"site_name\"]] }}.clarityhs.com/clients/{{ value }}/profile"
    }

    sql: ${TABLE}.id ;;
  }

  #   - dimension: client_photo
  #     sql: ${id}
  #     html: |
  #       <img src="https://{{ _access_filters["site.name"]] }}.clarityhs.com/clients/{{ value }}/profile/photo/thumb/photo.jpg" />
  #
  dimension_group: added {
    label: "Date Created"
    description: "Date the profile was created in Clarity (or legacy system) (HMIS Data Element 5.1)"
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.added_date ;;
  }

  dimension: alias {
    description: "Optional name field on profile screen. Used in different ways by different communities."
    sql: ${TABLE}.alias ;;
  }

  dimension_group: birth {
    label: "Date of Birth"
    description: "(HMIS Data Element 3.3)"
    type: time
    timeframes: [date, week, month, year]
    convert_tz: no
    sql: ${TABLE}.birth_date ;;
  }

  dimension: age {
    label: "Current Age"
    description: "Age of the client when report was run"
    type: number
    sql: YEAR(NOW()) - YEAR(${birth_date}) - (DATE_FORMAT(NOW(), '%m%d') < DATE_FORMAT(${birth_date}, '%m%d')) ;;
  }

  dimension: age_tier {
    description: "Tier: Age of the client when report was run"
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

  measure: average_age {
    description: "Average: Age of the client when report was run"
    type: average
    sql: ${age} ;;
  }

  dimension: dob_quality {
    label: "DoB Data Quality"
    description: "(HMIS Data Element 3.3.1)"
    sql: fn_getPicklistValueName('dob_quality', ${TABLE}.dob_quality) ;;
  }

  dimension: first_name {
    description: "(HMIS Data Element 3.1.1)"
    sql: ${TABLE}.first_name ;;
  }

  dimension: private {
    type: yesno
    description: "The client's profile has been marked private"
    sql: ${TABLE}.private ;;
  }

  dimension: image {
    hidden: yes
    type: yesno
    sql: ${TABLE}.image ;;
  }

  dimension: last_name {
    description: "(HMIS Data Element 3.1.3)"
    label: "Last Name"
    sql: ${TABLE}.last_name ;;
  }

  dimension: full_name {
    label: "Client Full Name"
    description: "(HMIS Data Element 3.1)"
    sql: CONCAT(${first_name},' ',${last_name}) ;;
    required_fields: [id]
  }

  dimension: last_updated_date {
    label: "Date Updated"
    description: "Date the profile was last updated (HMIS Data Element 5.2)"
    type: date
    sql: ${TABLE}.last_updated ;;
  }

  dimension: name_quality {
    label: "Name Data Quality"
    description: "(HMIS Data Element 3.1.5)"
    sql: fn_getPicklistValueName('name_quality', ${TABLE}.name_quality) ;;
  }

  dimension: ref_agency_created {
    hidden: yes
    type: number
    sql: ${TABLE}.ref_agency_created ;;
  }

  dimension: ref_user_updated {
    label: "User Updating"
    description: "User last updating the client profile (HMIS Data Element 5.2)"
    sql: fn_getUserNameById(${TABLE}.ref_user_updated) ;;
  }

  dimension: ssn {
    label: "SSN"
    description: "(HMIS Data Element 3.2)"
    sql: ${TABLE}.ssn ;;
  }

  dimension: ssn1 {
    hidden: yes
    sql: ${TABLE}.ssn1 ;;
  }

  dimension: ssn2 {
    hidden: yes
    sql: ${TABLE}.ssn2 ;;
  }

  dimension: ssn3 {
    label: "SSN - Last 4"
    description: "Last four digits of SSN (HMIS Data Element 3.2)"
    sql: ${TABLE}.ssn3 ;;
  }

  dimension: ssn_quality {
    label: "SSN Data Quality"
    description: "(HMIS Data Element 3.2.1)"
    sql: fn_getPicklistValueName('ssn_quality', ${TABLE}.ssn_quality) ;;
  }

  dimension: unique_identifier {
    description: "Clarity generated unique identifier, alpha-numeric format"
    sql: ${TABLE}.unique_identifier ;;
  }

  dimension: general_id {
    description: "Unique Id that deduplicates based on Personal Identified Information"
    sql: ${TABLE}.general_id ;;
  }

  measure: count {
    label: "Number of Clients"
    description: "Distinct count of client Personal IDs"
    type: count_distinct
    drill_fields: [detail*]
    sql: ${TABLE}.id ;;
  }

  # SETS #

  set: detail {
    fields: [id, full_name, age]
  }
}
