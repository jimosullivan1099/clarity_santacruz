 view: program_screens {
#   # Or, you could make this view a derived table, like this:
   derived_table: {
     sql: select a.name as Agency,
          p.name as Program,
          pt.name as Template,
          pt.enroll_screen,
          pt.exit_screen,
          pt.followup_screen,
          (select name from screens s where s.id = pt.enroll_screen) as Enroll,
          (select name from screens s where s.id = pt.exit_screen) as Exits,
          (select name from screens s where s.id = pt.followup_screen) as Followup,
          sf.*
          from program_templates pt
          inner join programs p on p.ref_template = pt.id
          inner join agencies a on p.ref_agency = a.id
          inner join screen_fields sf on (sf.ref_screen = pt.enroll_screen or sf.ref_screen = pt.exit_screen or sf.ref_screen = pt.followup_screen)

       ;;
   }
#
#   # Define your dimensions and measures here, like this:
#   dimension: user_id {
#     description: "Unique ID for each user that has ordered"
#     type: number
#     sql: ${TABLE}.user_id ;;
#   }
#
#   dimension: lifetime_orders {
#     description: "The total number of orders for each user"
#     type: number
#     sql: ${TABLE}.lifetime_orders ;;
#   }
#
#   dimension_group: most_recent_purchase {
#     description: "The date when each user last ordered"
#     type: time
#     timeframes: [date, week, month, year]
#     sql: ${TABLE}.most_recent_purchase_at ;;
#   }
#
#   measure: total_lifetime_orders {
#     description: "Use this for counting lifetime orders across many users"
#     type: sum
#     sql: ${lifetime_orders} ;;
#   }
 }
