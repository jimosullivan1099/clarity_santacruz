view: program_openings_custom {
    sql_table_name: program_openings ;;

    dimension: id {
      primary_key: yes
      hidden:  yes
      type: number
      sql: ${TABLE}.id ;;
    }

 }
