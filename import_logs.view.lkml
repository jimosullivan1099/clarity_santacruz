view: import_logs {
  derived_table: {
    indexes: ["FileID"]
    sql: SELECT
        CASE ie.ref_category
          WHEN 0 THEN 'Data'
          WHEN 1 THEN 'Client'
          WHEN 2 THEN 'Client Group'
          WHEN 3 THEN 'Client Enrollment'
          WHEN 4 THEN 'Client Group Enrollment'
          WHEN 5 THEN 'Program Status'
          WHEN 6 THEN 'Client Service'
          WHEN 7 THEN 'Program Map'
          WHEN 8 THEN 'Service Map'
        ELSE 'Data'
        END AS Category,
          ie.ref_file AS 'FileID',
          REPLACE(SUBSTRING_INDEX(SUBSTRING_INDEX(CAST(data AS CHAR CHARACTER SET utf8),';',2),':',-1), '"', '')  AS ClarityID,
         SUBSTRING_INDEX(SUBSTRING_INDEX(SUBSTRING_INDEX(CAST(ie.data AS CHAR CHARACTER SET utf8), '"ExternalID";', -1), '"', 2), '"', -1) AS ExternalID,
         SUBSTRING_INDEX(SUBSTRING_INDEX(SUBSTRING_INDEX(CAST(ie.data AS CHAR CHARACTER SET utf8), '"Message";', -1), ':"', -1), '";}', 1) AS Message
      FROM import_entries ie
      WHERE
          {% condition file_id_filter %} ref_file {% endcondition %}
          limit 100000
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }


  # filter: date_filter {
  #   label: "Reporting Period Filter"
  #   description: "([Project Exit Date] >= Reporting Period Filter start date OR is null) AND [Project Start Date] <= Reporting Period Filter end date. Requires two \"dates\" to set the filter"
  #   type: date
  #   sql: ${start_raw} < {% date_end date_filter %}
  #     AND (${end_raw} >= {% date_start date_filter %} OR ${end_raw} is NULL)
  #     ;;
  # }

  filter: file_id_filter {
    label: "File Id (needed for log analysis)"
  type:  number

  }

  dimension: category {
    type: string
    sql: ${TABLE}.Category ;;
  }

  dimension: file_id {
  hidden:  yes
    type: number
    sql: ${TABLE}.FileID ;;
  }

  dimension: clarity_id {
    type: string
    sql: ${TABLE}.ClarityID ;;
  }

  dimension: external_id {
    type: string
    sql: ${TABLE}.ExternalID ;;
  }

  dimension: message {
    type: string
    sql: ${TABLE}.Message ;;
  }

  set: detail {
    fields: [category, file_id, clarity_id, external_id, message]
  }
}
