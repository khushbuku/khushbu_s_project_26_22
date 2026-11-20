view: nested_fields_attempt1 {
  sql_table_name: `baseball_schedules.nested_fields_attempt1` ;;

  dimension: location {
    type: string
    sql: ${TABLE}.location ;;
  }
  dimension: messages {
    hidden: yes
    sql: ${TABLE}.messages ;;
  }
  dimension: project_id {
    type: string
    sql: ${TABLE}.project_id ;;
  }
  measure: count {
    type: count
  }
}

view: nested_fields_attempt1__messages {

  dimension: chunks {
    type: string
    sql: chunks ;;
  }
  dimension_group: event {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: event_time ;;
  }
  dimension: nested_fields_attempt1__messages {
    type: string
    hidden: yes
    sql: nested_fields_attempt1__messages ;;
  }
  dimension: role {
    type: string
    sql: role ;;
  }
}
