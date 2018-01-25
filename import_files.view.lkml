view: import_files {
    derived_table: {
      indexes: ["id"]
      sql: select f.id, extension, f.version, f.ref_agency, ref_user, ref_user_updated, added_date, ref_source, last_updated, is_imported, import_date, valid, validation_date, errors_count, sources.name as source_name, s.name as import_standard, states.name as file_state from import_files f
              INNER JOIN import_file_sources sources on f.ref_source = sources.id
              INNER JOIN import_file_standards s  on s.id = f.ref_standard
              INNER JOIN import_file_states states on states.id = f.ref_state
              where ref_type = 1 and ref_source = 2 /* ref_type=1 is only data file and not mapping files*/
               ;;
  persist_for: "24 hours"
   }

    measure: count {
      type: count
      drill_fields: [detail*]
    }

    dimension: id {
      primary_key: yes
      type: number
      sql: ${TABLE}.id ;;
    }

    dimension: extension {
      type: string
      sql: ${TABLE}.extension ;;
    }


    dimension: version {
      type: number
      sql: ${TABLE}.version ;;
    }


  dimension: agency_id {
    type: number
    sql: ${TABLE}.ref_agency ;;
  }

  dimension: ref_source {
    hidden: yes
    type: number
    sql: ${TABLE}.ref_source ;;
  }


    dimension: user_uploading {
      type: number
      sql:  fn_getUserNameById(${TABLE}.ref_user) ;;
    }


    dimension_group: added_date {
      type: time
      sql: ${TABLE}.added_date ;;
    }

    dimension_group: last_updated {
      type: time
      sql: ${TABLE}.last_updated ;;
    }

    dimension: is_imported {
      type: yesno
      sql: ${TABLE}.is_imported ;;
    }

    dimension_group: import_date {
      type: time
      sql: ${TABLE}.import_date ;;
    }

    dimension: valid {
      type: yesno
      sql: ${TABLE}.valid ;;
    }

    dimension_group: validation_date {
      type: time
      sql: ${TABLE}.validation_date ;;
    }

    dimension: errors_count {
      type: number
      sql: ${TABLE}.errors_count ;;
    }

    dimension: source_name {
      type: string
      sql: ${TABLE}.source_name ;;
    }

    dimension: import_standard {
      type: string
      sql: ${TABLE}.import_standard ;;
    }

    dimension: file_state {
      type: string
      sql: ${TABLE}.file_state ;;
    }

    set: detail {
      fields: [
        id,
        extension,
        version,
        added_date_time,
        last_updated_time,
        is_imported,
        import_date_time,
        valid,
        validation_date_time,
        errors_count,
        source_name,
        import_standard,
        file_state
      ]
    }
  }
