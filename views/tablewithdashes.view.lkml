view: tablewithdashes {
  sql_table_name: `baseball_schedules.table-with-dashes` ;;

  dimension: location {
    type: string
    sql: ${TABLE}.location ;;
  }
  dimension: project_id {
    type: string
    sql: ${TABLE}.project_id ;;
  }
  measure: count {
    type: count
  }
}
