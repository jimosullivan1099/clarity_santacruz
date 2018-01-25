view: program_openings_history {
  derived_table: {
    sql: SELECT
      po.id as id,
      po.note as opening,
      po.date as date_posted,
      po.added_date as added_date,
      po.last_updated as last_updated,
      r.date as date_reserved,
      po.ref_program,
      r.ref_opening,
      p.ref_agency,
      a.id as agency_id,
      r.deleted as ref_deleted,
      min(po.date) as first_posted,
      max(po.date) as last_posted,
      min(r.last_updated) as first_reserved,
      max(r.last_updated) as last_reserved,
      po.deleted as deleted
      FROM program_openings po
      INNER JOIN programs p on p.id = po.ref_program
      INNER JOIN referrals r on r.ref_opening = po.id and r.type = 2
      INNER JOIN agencies a on p.ref_agency = a.id
      GROUP BY po.note, r.last_updated
       ;;
  }

  dimension: id {
    type: number
    value_format_name: id
    sql: ${TABLE}.id ;;
  }

  dimension: deleted {
    description: "Was the opening deleted?"
    type: yesno
    sql: ${TABLE}.deleted ;;
  }

  dimension: opening {
    label: "Program Opening"
    description: "Unique Identifier for Opening"
    sql: ${TABLE}.opening ;;
  }

  dimension: date_posted {
    label: "Date Opening Entered"
    description: "Date program opening entered"
    sql: ${TABLE}.date_posted ;;
  }

  dimension: date_reserved {
    label: "Referral Created Date"
    description: "Date the referral was created"
    sql: ${TABLE}.date_reserved ;;
  }

  dimension: added_date {
    label: "Date Added"
    description: "Date the opening was added"
    sql: ${TABLE}.added_date ;;
  }

  dimension: last_updated {
    label: "Date Last Updated"
    description: "Date the program opening was last updated"
    sql: ${TABLE}.last_updated ;;
  }

  dimension: ref_user_updated {
    label: "User Last Updating"
    description: "Use who last updated the program opening"
    sql: ${TABLE}.ref_user_updated ;;
  }

  dimension: ref_agency {
    hidden: yes
    type: number
    value_format_name: id
    sql: ${TABLE}.ref_agency ;;
  }

  dimension: ref_agency_deleted {
    label: "Agency Deleted Opening"
    description: "The Agency which deleted the program opening"
    type: string
    sql: (select name from agencies a where a.id = ${TABLE}.ref_agency_deleted) ;;
  }

  dimension: agency {
    type: string
    sql: (select name from agencies a where a.id = ${TABLE}.ref_agency) ;;
  }

  dimension: ref_program {
    hidden: yes
    type: number
    value_format_name: id
    sql: ${TABLE}.ref_program ;;
  }

  dimension: program {
    type: string
    sql: (select name from programs p where p.id = ${TABLE}.ref_program) ;;
  }

  dimension: ref_opening {
    label: "Opening Id"
    type: number
    value_format_name: id
    sql: ${TABLE}.ref_opening ;;
  }

  dimension: ref_deleted {
    hidden: yes
    label: "Deleted"
    type: number
    sql: ${TABLE}.ref_deleted ;;
  }

  dimension: first_posted {
    hidden: yes
    label: "First Posted"
    sql: ${TABLE}.first_posted ;;
  }

  dimension: last_posted {
    hidden: yes
    label: "Last Posted"
    sql: ${TABLE}.last_posted ;;
  }

  dimension: first_reserved {
    label: "Opening Reserved"
    sql: ${TABLE}.first_reserved ;;
  }

  dimension: last_reserved {
    hidden: yes
    label: "Last Reserved"
    sql: ${TABLE}.last_reserved ;;
  }

  measure: opening_count {
    label: "Opening Count"
    type: sum
    sql: ${opening} ;;
  }
}
