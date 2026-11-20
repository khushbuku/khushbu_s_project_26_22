view: nestedfieldsattempt2 {
  sql_table_name: `baseball_schedules.nested-fields-attempt2` ;;

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

view: nested-fields-attempt2__messages {

  dimension: chunks {
    type: string
    sql: chunks ;;
  }
  dimension_group: event {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: event_time ;;
  }
  dimension: nestedfieldsattempt2__messages {
    type: string
    hidden: yes
    sql: `nested-fields-attempt2__messages` ;;
  }
  dimension: role {
    type: string
    sql: role ;;
  }
}
