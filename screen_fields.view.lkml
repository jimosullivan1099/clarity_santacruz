view: questions {
  sql_table_name: screen_fields ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: check {
    hidden: yes
    type: yesno
    sql: ${TABLE}.`check` ;;
  }

  dimension: default_value {
    type: string
    sql: ${TABLE}.default_value ;;
  }

  dimension: display_name {
    type: string
    sql: ${TABLE}.display_name ;;
  }

  dimension: field_data_name {
    type: string
    sql: ${fields.name} ;;
  }

  dimension_group: edit {
    type: time
    hidden: yes
    timeframes: [time, date, week, month]
    sql: ${TABLE}.edit_date ;;
  }

  dimension: external_id {
    type: string
    hidden: yes
    sql: ${TABLE}.external_id ;;
  }

  dimension: inline_with {
    type: number
    hidden: yes
    sql: ${TABLE}.inline_with ;;
  }

  dimension: mandatory {
    type: yesno
    sql: ${TABLE}.mandatory ;;
  }

  dimension: maxlength {
    type: number
    sql: ${TABLE}.maxlength ;;
  }

  dimension: protected {
    label: "Sensitive Data"
    description: "Field set as Sensitive Data on Screen Field Editor"
    type: yesno
    sql: ${TABLE}.protected ;;
  }

  dimension: readonly {
    type: yesno
    sql: ${TABLE}.readonly ;;
  }

  dimension: ref_field {
    hidden: yes
    type: number
    sql: ${TABLE}.ref_field ;;
  }

  dimension: ref_screen {
    type: number
    hidden: yes
    sql: ${TABLE}.ref_screen ;;
  }

  dimension: rows {
    type: number
    sql: ${TABLE}.rows ;;
  }

  dimension: size {
    type: number
    sql: ${TABLE}.size ;;
  }

  dimension: sort {
    type: number
    sql: ${TABLE}.sort ;;
  }

  dimension: type {
    sql: ${TABLE}.type ;;
  }

  dimension: width {
    type: number
    sql: ${TABLE}.width ;;
  }

  measure: count {
    type: count
    drill_fields: [id, display_name]
  }
}
