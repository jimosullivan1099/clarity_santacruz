view: referrals {
  dimension: id {
    primary_key: yes
    type: number

    link: {
      label: "Edit Referral"
      url: "https://{{ _access_filters[\"site.name\"]] }}.clarityhs.com/referrals/modify/{{ value }}"
    }

    sql: ${TABLE}.id ;;
  }

  dimension_group: added {
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.added_date ;;
  }

  dimension_group: date {
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.date ;;
  }

  dimension: days_pending {
    type: number
    sql: ${TABLE}.days_pending ;;
  }

  dimension: deleted {
    type: number
    sql: ${TABLE}.deleted ;;
  }

  dimension: denied_message {
    type: string
    sql: ${TABLE}.denied_message ;;
  }

  dimension: denied_reason {
    sql: fn_getPicklistValueName('referral_denied_reason',${TABLE}.denied_reason) ;;
  }

  dimension: in_progress {
    type: number
    sql: ${TABLE}.in_progress ;;
  }

  dimension_group: last_updated {
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.last_updated ;;
  }

  dimension: private {
    type: number
    sql: ${TABLE}.private ;;
  }

  dimension: queue {
    type: number
    sql: ${TABLE}.queue ;;
  }

  dimension: reassigned {
    type: number
    sql: ${TABLE}.reassigned ;;
  }

  dimension: referring_agency {
    sql: ${referring_agencies.name} ;;
  }

  dimension: ref_agency {
    hidden: yes
    sql: ${TABLE}.ref_agency ;;
  }

  #   - dimension: ref_agency_deleted
  #     type:number
  #     sql: ${TABLE}.ref_agency_deleted

  dimension: assessment_id {
    type: number
    sql: ${TABLE}.ref_assessment ;;
  }

  dimension: ref_client {
    hidden: yes
    type: number
    sql: ${TABLE}.ref_client ;;
  }

  #
  #   - dimension: ref_navigator
  #     type:number
  #     sql: ${TABLE}.ref_navigator
  #
  dimension: ref_opening {
    type: number
    sql: ${TABLE}.ref_opening ;;
  }

  #
  dimension: ref_program {
    hidden: yes
    type: number
    sql: ${TABLE}.ref_program ;;
  }

  dimension: user {
    sql: fn_getUserNameById(${TABLE}.ref_user) ;;
  }

  #
  #   - dimension: ref_user_updated
  #     type:number
  #     sql: ${TABLE}.ref_user_updated

  dimension: replaced_with {
    type: number
    sql: ${TABLE}.replaced_with ;;
  }

  dimension: status {
    case: {
      when: {
        sql: ${TABLE}.status = 0 ;;
        label: "Pending"
      }

      when: {
        sql: ${TABLE}.status = 1 ;;
        label: "Reassigned"
      }

      when: {
        sql: ${TABLE}.status = 2 ;;
        label: "Denied"
      }

      else: "Unknown"
    }
  }

  dimension: last_referral_note {
    label: "Last Referral Note"
    type: string
    sql: (select replace(replace(body,'<p>',''),'</p>','') from messages m where m.id = (
        select max(ref_message) from referral_notes rn where rn.ref_referral =  ${TABLE}.id )) ;;
#(select max(id) as ID from referrals where ref_client = ${TABLE}.ref_client))

  }


  dimension: Currently_On_Queue {
    type: string

    case: {
      when: {
        sql: ${TABLE}.queue= 1 and ${TABLE}.status=0 ;;
        label: "Yes"
      }

      else: "No"
    }
  }

  dimension_group: date_accepted_in_program {
    type: time
    timeframes: [time, date, week, month]
    sql: (select cp.start_date from referral_connections rf_c, client_programs cp where rf_c.ref_client_program=cp.id and
       rf_c.ref_referral = ${TABLE}.id limit 0,1)
       ;;
  }

  # - dimension_group: date_denied
  #   type: time
  #   timeframes: [time, date, week, month]
  #   sql: |
  #     (SELECT rh.date FROM referral_history AS rh WHERE rh.ref_referral = rf.id
  #               ORDER BY rh.date DESC LIMIT 0,1)


  dimension: ever_on_queue {
    type: yesno
    sql: ${TABLE}.queue is not null ;;
  }

  dimension: type {
    type: number
    sql: ${TABLE}.type ;;
  }

  dimension: queue_remove_reason {
    sql: fn_getPicklistValueName('queue_remove_reason',${TABLE}.ref_queue_removed_reason) ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
