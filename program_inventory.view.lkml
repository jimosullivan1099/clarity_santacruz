view: program_inventory {
  sql_table_name: program_inventory ;;

  dimension: id {
    primary_key: yes
    description: "ID number for the bed inventory"
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension_group: added {
    type: time
    description: "Date bed inventory was added to Clarity HS (or legacy system)"
    timeframes: [time, date, week, month]
    sql: ${TABLE}.added_date ;;
  }

  dimension: availability {
    description: "Bed Inventory Availability, (Year-Round, Seasonal, etc.) (HMIS Data Element 2.7.4)"
    sql: fn_getPicklistValueName('availability',${TABLE}.availability) ;;
  }

  dimension: ref_bed_type {
    label: "Bed Type"
    description: "Emergency Shelter Programs only: Facility-Based, Voucher, etc (HMIS Data Element 2.7.8"
    bypass_suggest_restrictions: yes
    sql: fn_getPicklistValueName('bed_types',${TABLE}.ref_bed_type) ;;
  }

  measure: total_bed_inventory {
    label: "Bed Inventory"
    description: "Sum of number of beds (HMIS Data Element 2.7.5)"
    type: sum
    sql: ${TABLE}.bed_inventory ;;
  }

  dimension: total_rrh_bed_inventory {
    label: "Total RRH Bed Inventory"
    description: "Number of RRH bed inventory, based on enrollment and move-in date"
    sql: (select count(distinct cp.ref_client)
            from client_programs cp
            inner join client_program_demographics cpd on cpd.ref_program = cp.id
            inner join programs p on cp.ref_program = p.id
            where cp.status = 1 and p.ref_category = 13 and cpd.move_in_date <= date(now()) and cp.end_date is null and p.id = ${TABLE}.ref_program) ;;
  }

  dimension: total_rrh_unit_inventory {
    label: "Total RRH Unit Inventory"
    description: "Number of RRH unit inventory, based on enrollment households and move-in date"
    sql: (select count(distinct ref_household)
            from client_programs cp
            inner join client_program_demographics cpd on cpd.ref_program = cp.id
            inner join programs p on cp.ref_program = p.id
            where cp.status = 1 and p.ref_category = 13 and cpd.move_in_date <= date(now()) and cp.end_date is null and p.id = ${TABLE}.ref_program) ;;
  }

  measure: total_bed_inventory_between_18_24 {
    description: "Number of youth beds for Ages 18 to 24 (HMIS Data Element 2.7.5.3.2)"
    hidden: yes
    # retired data element
    type: sum
    sql: ${TABLE}.between_18_24 ;;
  }

  measure: total_bed_chronic_inventory {
    label: "Chronically Homeless Bed Inventory"
    description: "PSH Programs only: Sum of number of beds designated for Chronic Homeless (HMIS Data Element 2.7.5.1)"
    type: sum
    sql: ${TABLE}.chronic_inventory ;;
  }

  dimension: coc {
    label: "CoC"
    description: "The CoC code where the beds will be located (HMIS Data Element 2.7.4"
    type: string
    sql: ${TABLE}.coc ;;
  }

  dimension: deleted {
    type: yesno
    description: "Has the bed inventory been deleted from Clarity HS (or legacy system) "
    sql: ${TABLE}.deleted ;;
  }

  dimension_group: end {
    description: "End Date for Bed Inventory (HMIS Data Element 2.7.8)"
    type: time
    timeframes: [date, week, month]
    convert_tz: no
    sql: ${TABLE}.end_date ;;
  }

  dimension_group: information {
    description: "Date the Bed Inventory was updated (User entered date) (HMIS Data Element 2.7.1)"
    type: time
    timeframes: [date, week, month]
    convert_tz: no
    sql: ${TABLE}.information_date ;;
  }

#  dimension: is_between_18_24 {
#    hidden: yes
#    type: yesno
#    sql: ${TABLE}.is_between_18_24 ;;
#  }

  dimension: is_chronic {
    hidden: yes
    type: yesno
    sql: ${TABLE}.is_chronic ;;
  }

  dimension: is_hmis_participating {
    label: "HMIS Participating?"
    description: "Is the bed usage tracked in HMIS"
    type: yesno
    sql: ${TABLE}.is_hmis_participating ;;
  }

#  dimension: is_under_18 {
#    hidden: yes
#    type: yesno
#    sql: ${TABLE}.is_under_18 ;;
#  }

#  dimension: is_under_24 {
#    hidden: yes
#    type: yesno
#    sql: ${TABLE}.is_under_24 ;;
#  }

  dimension: is_veteran {
    hidden: yes
    type: yesno
    sql: ${TABLE}.is_veteran ;;
  }

  dimension: is_youth {
    hidden: yes
    type: yesno
    sql: ${TABLE}.is_youth ;;
  }

  dimension_group: last_updated {
    label: "Updated"
    description: "Date last updated"
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.last_updated ;;
  }

  measure: total_participating_beds {
    label: "HMIS Participating Beds"
    description: "Sum of number of beds where usage is being tracked in HMIS (HMIS Data Element 2.7.9)"
    type: sum
    sql: ${TABLE}.participating_beds ;;
  }

  dimension: ref_agency_deleted {
    hidden: yes
    type: number
    sql: ${TABLE}.ref_agency_deleted ;;
  }

  dimension: household_type {
    description: "Type of Households will be using the Bed Inventory (HMIS Data Element 2.7.2)"
    sql: fn_getPicklistValueName('household_types',${TABLE}.ref_household_type) ;;
  }

  dimension: ref_program {
    hidden: yes
    type: number
    sql: ${TABLE}.ref_program ;;
  }

  dimension: ref_user_updated {
    hidden: yes
    type: number
    sql: ${TABLE}.ref_user_updated ;;
  }

  dimension_group: start {
    description: "Bed Inventory Start (HMIS Data Element 2.7.7)"
    type: time
    timeframes: [date, week, month]
    convert_tz: no
    sql: ${TABLE}.start_date ;;
  }

  measure: total_bed_inventory_under_18 {
    hidden: yes
    # Retired data element
    description: "Number of youth beds for Under 18 (HMIS Data Element 2.7.5.3.1)"
    type: sum
    sql: ${TABLE}.under_18 ;;
  }

  measure: total_bed_inventory_under_24 {
    hidden: yes
    # Retired data element
    description: "Sum of number of youth beds for Under 24 (HMIS Data Element 2.7.5.3.3)"
    type: sum
    sql: ${TABLE}.under_24 ;;
  }

  measure: total_unit_inventory {
    label: "Unit Inventory"
    description: "Sum of number of Units (Rooms, Apartments, etc.) (HMIS Data Element 2.7.6)"
    type: sum
    sql: ${TABLE}.unit_inventory ;;
  }

  measure: veteran_inventory {
    label: "Veteran Bed Inventory"
    description: "Sum of number of beds designated for Veterans (HMIS Data Element 2.7.5.2)"
    type: sum
    sql: ${TABLE}.veteran_inventory ;;
  }

  measure: total_bed_youth_inventory {
    label: "Youth Bed Inventory"
    description: "Sum of number of beds designated for Youth (HMIS Data Element 2.7.5.3)"
    type: sum
    sql: ${TABLE}.youth_inventory ;;
  }

  measure: count {
    description: "Count of bed inventories (Count of bed inventory ID)"
    type: count
    drill_fields: [id]
  }
}
