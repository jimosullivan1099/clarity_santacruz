view: members {
  label: "Staff"

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: auto_suggest {
    type: yesno
    sql: ${TABLE}.auto_suggest ;;
  }

  dimension: first_name {
    sql: ${TABLE}.first_name ;;
  }

  dimension: force_password_change {
    type: number
    sql: ${TABLE}.force_password_change ;;
  }

  dimension: has_image {
    type: yesno
    sql: ${TABLE}.has_image ;;
  }

  dimension: is_warning {
    type: number
    sql: ${TABLE}.is_warning ;;
  }

  dimension: last_name {
    sql: ${TABLE}.last_name ;;
  }

  dimension_group: last_password_change {
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.last_password_change_date ;;
  }

  dimension: phone_number {
    sql: ${TABLE}.phone_number ;;
  }

  dimension: recent_services {
    type: yesno
    sql: ${TABLE}.recent_services ;;
  }

  dimension: ref_agency {
    hidden: yes
    type: number
    sql: ${TABLE}.ref_agency ;;
  }

  dimension: ref_file {
    hidden: yes
    type: number
    sql: ${TABLE}.ref_file ;;
  }

  dimension: ref_module {
    hidden: yes
    type: number
    sql: ${TABLE}.ref_module ;;
  }

  dimension: ref_profile_screen {
    label: "Profile Override"
    sql: ${TABLE}.ref_profile_screen ;;
  }

  dimension: profile_override {
    label: "Profile Override"
    sql: (select name from screens s where s.id = ${TABLE}.ref_profile_screen)
      ;;
  }

  dimension: ref_user {
    type: number
    sql: ${TABLE}.ref_user ;;
  }

  dimension: warning_days {
    type: number
    sql: ${TABLE}.warning_days ;;
  }

  dimension_group: last_visited {
    type: time
    timeframes: [time, date, week, month]
    sql: ${users.last_visited_date} ;;
  }

  dimension: name {
    sql: ${users.name} ;;
  }

  dimension: email {
    sql: ${users.email} ;;
  }

  dimension: access_role {
    sql: ${user_groups.name} ;;
  }

  dimension: user_last_updated {
    sql: ${users.ref_user_updated} ;;
  }

  dimension: last_updated {
    type: date
    sql: ${users.last_updated_date} ;;
  }

  dimension_group: added {
    type: time
    timeframes: [time, date, week, month]
    sql: ${users.added_date} ;;
  }

  dimension: status {
    sql: ${users.user_status} ;;
  }

  dimension: last_policy_updated_date {
    label: "User Policy, last updated"
    type: date
    sql: ${TABLE}.last_policy_updated_date ;;
  }

  dimension: deleted {
    type: yesno
    sql: ${users.deleted} ;;
  }

  measure: count {
    type: count
    drill_fields: [id, first_name, last_name]
  }
}
