view: agency_contacts {
  sql_table_name: agency_contacts ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: email {
    type: string
    sql: ${TABLE}.email ;;
  }

  dimension: ref_agency {
    hidden: yes
    type: number
    sql: ${TABLE}.ref_agency ;;
  }

  dimension: ref_user {
    hidden: yes
    type: number
    sql: ${TABLE}.ref_user ;;
  }

  dimension: user_text {
    hidden: yes
    type: string
    sql: (select name from users where id = ${TABLE}.ref_user) ;;
  }

  dimension: agency_user {
    label: "Agency Notification Contact"
    type: string
   # sql: coalesce(fn_getUserNameById(${TABLE}.ref_user),${TABLE}.email) ;;
    sql: coalesce(${user_text},${email}) ;;
  }

  dimension: status {
    hidden: yes
    type: yesno
    sql: ${TABLE}.status ;;
  }

  dimension: type {
    hidden: yes
    type: yesno
    sql: ${TABLE}.type ;;
  }

  measure: count {
    hidden: yes
    type: count
    drill_fields: [id]
  }
}
