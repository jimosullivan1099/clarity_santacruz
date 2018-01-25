view: agency_services {
  derived_table: {
    sql: select
      services.id as id,
      services.name as name,
      service_items.name as service_item_name,
      service_items.id as service_item_id,
      service_items.end_availability,
      service_items.start_availability,
      service_items.deleted,
      services.status,
      services.ref_agency,
      services.ref_category,
      service_items.ref_delivery_type,
      si_cat1,
      si_cat2,
      si_cat3,
      ref_taxonomy
      from services
      INNER JOIN service_items on services.id = service_items.ref_service
      left join service_item_taxonomy on service_items.id = service_item_taxonomy.ref_service_item
       ;;
  }

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: name {
    bypass_suggest_restrictions: yes
    sql: ${TABLE}.name ;;
  }

  dimension: service_item_name {
    sql: ${TABLE}.service_item_name ;;
  }

  dimension: service_item_id {
    sql: ${TABLE}.service_item_id ;;
  }

  dimension: ref_taxonomy {
    label: "Service Item Taxonomy"
    sql: ${TABLE}.ref_taxonomy ;;
  }

  dimension: service_item_category1 {
    label: "Service Item Category 1"
    sql:fn_getPicklistValueName('service_categories',${TABLE}.si_cat1) ;;
  }

  dimension: service_item_category2 {
    label: "Service Item Category 2"
    sql:fn_getPicklistValueName('service_categories',${TABLE}.si_cat2) ;;
  }

  dimension: service_item_category3 {
    label: "Service Item Category 3"
    sql:fn_getPicklistValueName('service_categories',${TABLE}.si_cat3) ;;
  }

  dimension_group: service_items_end_availability {
    label: "Service Item End Availability"
    type: time
    timeframes: [date, week, month]
    convert_tz: no
    sql: ${TABLE}.end_availability ;;
  }

  dimension_group: service_items_start_availability {
    label: "Service Item Start Availability"
    type: time
    timeframes: [date, week, month]
    convert_tz: no
    sql: ${TABLE}.start_availability ;;
  }

  dimension: deleted {
    label: "Service Item Deleted"
    type: yesno
    sql: ${TABLE}.deleted ;;
  }

  dimension: status {
    label: "Service Active"

    case: {
      when: {
        sql: ${TABLE}.status = 1 ;;
        label: "Active"
      }

      when: {
        sql: ${TABLE}.status = 2 ;;
        label: "Inactive"
      }
    }
  }

  dimension: ref_agency {
    hidden: yes
    type: number
    sql: ${TABLE}.ref_agency ;;
  }

  dimension: ref_category {
    label: "Service Category"
    bypass_suggest_restrictions: yes
    sql: fn_getPicklistValueName('service_categories',${TABLE}.ref_category) ;;
  }

  dimension: delivery_type {
    bypass_suggest_restrictions: yes

    case: {
      when: {
        sql: ${TABLE}.ref_delivery_type = 1 ;;
        label: "Long Term"
      }

      when: {
        sql: ${TABLE}.ref_delivery_type = 2 ;;
        label: "Daily Attendance"
      }

      when: {
        sql: ${TABLE}.ref_delivery_type = 3 ;;
        label: "Multiple Attendance"
      }
    }
  }

  measure: count {
    type: count
  }
}
