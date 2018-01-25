view: household_entry_screen {
  derived_table: {
    sql: SELECT  enrollments.ref_household AS `ref_household`,
        SUM(income_individual) as `total_household_income`,
        COUNT(distinct enrollments.ref_client) as `total_household_members`
FROM  client_programs as enrollments
 INNER JOIN client_program_demographics as cpd
  ON enrollments.id = cpd.ref_program and cpd.screen_type=2
  where (enrollments.deleted=0 or enrollments.deleted is NULL) AND (cpd.deleted IS NULL OR cpd.deleted=0)
  group by 1
 ;;
    sql_trigger_value: SELECT CURRENT_DATE() ;;
    indexes: ["ref_household"]
  }

  dimension: screen_id {
    hidden: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: household_id {
    hidden: yes
    type: number
    sql: ${TABLE}.ref_household ;;
  }

  dimension: total_household_income {
    description: "Sum of all monthly income amounts from all enrolled household members"
    group_label: "Household Demographics"
    type: number
    value_format_name: usd
    sql: ${TABLE}.total_household_income ;;
  }

  dimension: total_household_annual_income {
    description: "Annual total all income amounts from all enrolled household members"
    group_label: "Household Demographics"
    type: number
    value_format_name: usd
    sql: ${TABLE}.total_household_income * 12 ;;
  }

  dimension: total_household_clients {
    description: "Count of enrolled household members"
    group_label: "Household Demographics"
    type: number
    sql: ${TABLE}.total_household_members ;;
  }

  dimension: area_median_income_in_dollars {
    type: number
    hidden: yes
    sql: (select income_amount from area_median_incomes where ref_county = ${agencies.ref_county}
      and persons_count = ${TABLE}.total_household_members and income_amount < (${TABLE}.total_household_income * 12) order by income_amount desc limit 1)
       ;;
  }

  dimension: area_median_income_internal {
    hidden: yes
    type: number
    group_label: "household demographics"
    sql: (select ref_income_type from area_median_incomes where ref_county = ${agencies.ref_county}
      and persons_count = ${TABLE}.total_household_members and income_amount < (${TABLE}.total_household_income * 12) order by income_amount desc limit 1)
       ;;
  }

  dimension: area_median_income {
    description: "Household AMI category based on \"Total Household Annual Income\" and the County of Agency. Requires uploading HUD Income Limits into Clarity Human Services"
    group_label: "Household Demographics"

    case: {
      when: {
        sql: (${total_household_income} >= 0 or ${total_household_income} is null)  and ${area_median_income_internal} is null ;;
        label: "Extremely Low Income (<30% AMI)"
      }

      when: {
        sql: ${area_median_income_internal} = 1 ;;
        label: "Very Low Income (31-50% AMI)"
      }

      when: {
        sql: ${area_median_income_internal} = 2 ;;
        label: "Low Income (51-80% AMI)"
      }

      when: {
        sql: ${area_median_income_internal} = 3 ;;
        label: "Moderate Income (>80% AMI)"
      }

      else: "unknown"
    }
  }

  set: detail {
    fields: [household_id]
  }
}
