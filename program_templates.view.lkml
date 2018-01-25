view: program_templates {
  derived_table: {
    sql: select pt.id as id,
      pt.name,
      ref_case_status,
      es.name as enrollment_screen,
      cs.name as update_screen,
      xs.name as exit_screen,
      fs.name as followup_screen,
      pt.auto_provision
      from program_templates pt
      LEFT JOIN screens es ON pt.enroll_screen = es.id
      LEFT JOIN screens cs ON pt.case_screen = cs.id
      LEFT JOIN screens xs ON pt.exit_screen = xs.id
      LEFT JOIN screens fs ON pt.followup_screen = cs.id;
       ;;
  }


  dimension: id {
    primary_key: yes
    hidden:  yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: auto_provision {
    group_label: "Template Details"
    type: yesno
    sql: ${TABLE}.auto_provision ;;
  }

  dimension: update_screen {
    group_label: "Template Details"
    sql: ${TABLE}.update_screen ;;
  }

  dimension: enrollment_screen {
    group_label: "Template Details"
    sql: ${TABLE}.enrollment_screen ;;
  }

  dimension: exit_screen {
    group_label: "Template Details"
    sql: ${TABLE}.exit_screen ;;
  }

  dimension: followup_screen {
    group_label: "Template Details"
    sql: ${TABLE}.followup_screen ;;
  }

  dimension: name {
    group_label: "Template Details"
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: ref_case_status {
    hidden: yes
    type: number
    sql: ${TABLE}.ref_case_status ;;
  }

  dimension: status {
   hidden:  yes
   type: number
    sql: ${TABLE}.status ;;
  }

  measure: count {
    hidden:  yes
    type: count
    drill_fields: [id, name]
  }
}
