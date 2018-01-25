view: dates {
  derived_table: {
    sql_trigger_value: SELECT CURRENT_DATE() ;;
    indexes: ["date"]
    sql: SELECT date
      FROM (
          SELECT curdate() - interval (a.a + (10 * b.a) + (100 * c.a) + (1000 * d.a) + (10000 * e.a)) day as date
          FROM (select 0 as a union all select 1 union all select 2 union all select 3 union all select 4 union all select 5 union all select 6 union all select 7 union all select 8 union all select 9) as a
          CROSS JOIN (select 0 as a union all select 1 union all select 2 union all select 3 union all select 4 union all select 5 union all select 6 union all select 7 union all select 8 union all select 9) as b
          CROSS JOIN (select 0 as a union all select 1 union all select 2 union all select 3 union all select 4 union all select 5 union all select 6 union all select 7 union all select 8 union all select 9) as c
          CROSS JOIN (select 0 as a union all select 1 union all select 2 union all select 3 union all select 4 union all select 5 union all select 6 union all select 7 union all select 8 union all select 9) as d
          CROSS JOIN (select 0 as a union all select 1 union all select 2 union all select 3 union all select 4 union all select 5 union all select 6 union all select 7 union all select 8 union all select 9) as e
           ) dates
      WHERE date >= '2014-01-01'
      and date <= CURRENT_DATE()
       ;;
  }

  dimension: ref_date {
    sql: ${TABLE}.date ;;
  }

  set: detail {
    fields: [ref_date]
  }
}
