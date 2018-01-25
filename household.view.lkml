view: household_makeup {
  derived_table: {
    sql: SELECT  enrollments.ref_household AS `ref_household`,
        COUNT(DISTINCT CASE WHEN (YEAR(DATE(enrollments.start_date)) - YEAR(DATE(clients.birth_date)) - (DATE_FORMAT(DATE(enrollments.start_date), '%m%d') < DATE_FORMAT(DATE(clients.birth_date), '%m%d')) >= 18) THEN enrollments.ref_client ELSE NULL END) AS `count_adults`,
        COUNT(DISTINCT CASE WHEN (YEAR(DATE(enrollments.start_date)) - YEAR(DATE(clients.birth_date)) - (DATE_FORMAT(DATE(enrollments.start_date), '%m%d') < DATE_FORMAT(DATE(clients.birth_date), '%m%d')) < 18) THEN enrollments.ref_client ELSE NULL END) AS `count_children`,
        COUNT(DISTINCT enrollments.ref_client) as 'count_hh'
      FROM  client_programs as enrollments
       LEFT JOIN clients
       AS clients ON enrollments.ref_client = clients.id
      INNER JOIN household  AS household ON enrollments.ref_household = household.id
      group by enrollments.ref_household
       ;;
    sql_trigger_value: SELECT CURRENT_DATE() ;;
    indexes: ["ref_household"]
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: id {
    hidden: yes
    type: number
    sql: ${TABLE}.ref_household ;;
  }

  dimension: count_adults {
    description: "The Number of People in the Household that are 18 Years or Older"
    type: number
    sql: ${TABLE}.count_adults ;;
  }

  dimension: count_children {
    type: number
    sql: ${TABLE}.count_children ;;
  }

  dimension: household_type {
    type: string

    case: {
      when: {
        sql: ${count_adults} > 0 and ${count_children} >0 ;;
        label: "Household with Children"
      }

      when: {
        sql: ${count_adults} > 0 and ${count_children} = 0 ;;
        label: "Household without Children"
      }

      when: {
        sql: ${count_adults} = 0 and ${count_children} > 0 ;;
        label: "Households with only Children"
      }

      else: "Unknown"
    }
  }

  #   - dimension: total_clients
  #     sql: |
  #          (Select count(distinct ref_client) from client_programs where ref_household = ${TABLE}.ref_household)


  set: detail {
    fields: [household_type,count_adults,count_children]
  }
}
