view: reservations {
  derived_table: {
    sql: select
      r.id,
      r.ref_service_item,
      r.ref_client,
      r.slot_id,
      r.slot_num,
      r.date,
      r.status,
      r.ref_user,
      r.ref_client_service_date,
      r.ref_user_updated,
      r.ref_user_check,
      r.ref_client_program,
      r.last_updated,
      r.deleted,
      rss.name as reservation_slot_section,
      rs.name as reservation_slot,
      rs.number as reservation_slot_number



      from reservation r
      inner join reservation_slots rs on r.slot_id = rs.id
      inner join reservation_slot_sections rss on rs.ref_section = rss.id


       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: id {
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: ref_service_item {
    type: number
    sql: ${TABLE}.ref_service_item ;;
  }

  dimension: ref_client {
    type: number
    sql: ${TABLE}.ref_client ;;
  }

  dimension: slot_id {
    type: number
    sql: ${TABLE}.slot_id ;;
  }

  dimension: slot_num {
    type: number
    sql: ${TABLE}.slot_num ;;
  }

  dimension: date {
    type: date
    sql: ${TABLE}.date ;;
  }

  dimension: status {
    type: yesno
    sql: ${TABLE}.status ;;
  }

  dimension: ref_user {
    type: number
    sql: ${TABLE}.ref_user ;;
  }

  dimension: ref_client_service_date {
    type: number
    sql: ${TABLE}.ref_client_service_date ;;
  }

  dimension: ref_user_updated {
    type: number
    sql: ${TABLE}.ref_user_updated ;;
  }

  dimension: ref_user_check {
    type: number
    sql: ${TABLE}.ref_user_check ;;
  }

  dimension: ref_client_program {
    type: number
    sql: ${TABLE}.ref_client_program ;;
  }

  dimension_group: last_updated {
    type: time
    sql: ${TABLE}.last_updated ;;
  }

  dimension: deleted {
    type: yesno
    sql: ${TABLE}.deleted ;;
  }

  dimension: reservation_slot_section {
    type: string
    sql: ${TABLE}.reservation_slot_section ;;
  }

  dimension: reservation_slot {
    type: string
    sql: ${TABLE}.reservation_slot ;;
  }

  dimension: reservation_slot_number {
    type: number
    sql: ${TABLE}.reservation_slot_number ;;
  }

  set: detail {
    fields: [
      id,
      ref_service_item,
      ref_client,
      slot_id,
      slot_num,
      date,
      status,
      ref_user,
      ref_client_service_date,
      ref_user_updated,
      ref_user_check,
      ref_client_program,
      last_updated_time,
      deleted,
      reservation_slot_section,
      reservation_slot,
      reservation_slot_number
    ]
  }
}
