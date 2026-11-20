connection: "bq-santiago"

# include all the views
include: "/views/**/*.view.lkml"

datagroup: khushbu_s_project_default_datagroup {
  sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: khushbu_s_project_default_datagroup

explore: nested_fields_attempt1 {
    join: nested_fields_attempt1__messages {
      view_label: "Nested Fields Attempt1: Messages"
      sql: LEFT JOIN UNNEST(${nested_fields_attempt1.messages}) as nested_fields_attempt1__messages ;;
      relationship: one_to_many
    }
}

explore: baseball_schedule_testing {
  aggregate_table: rollup__baseball_schedule_testing__season_summary {
    materialization: {
      datagroup_trigger: khushbu_s_project_default_datagroup
      # For BigQuery, you can optionally partition/cluster the aggregate table:
      # partition_keys: ["created_date"]
      # cluster_keys: ["home_team_name"]
    }
    query: {
      dimensions: [
        baseball_schedule_testing.year,
        baseball_schedule_testing.season_id,
        baseball_schedule_testing.created_month,
        baseball_schedule_testing.home_team_name,
        baseball_schedule_testing.away_team_name,
        baseball_schedule_testing.day_night
      ]
      measures: [
        baseball_schedule_testing.count,
        baseball_schedule_testing.test_count
      ]
      timezone: "America/Edmonton"
    }
  }
}

explore: fiscal_calendar_table {}

# explore: nestedfieldsattempt2 {
#     join: nested-fields-attempt2__messages {
#       view_label: "Nested-fields-attempt2: Messages"
#       sql: LEFT JOIN UNNEST(${nested-fields-attempt2.messages}) as nested-fields-attempt2__messages ;;
#       relationship: one_to_many
#     }
# }

explore: _9_m_baseball_reyesarroyo_sql_runner_issue_test_pdt2 {}

explore: baseball_schedule {}

explore: connection_reg_r3 {}

explore: newtable {}

explore: newpartition {}

explore: newtable2 {}

explore: tablewithdashes {}

explore: newtable4 {}

explore: north_america_indirect_tax_detail_us_pr_pr4_historical_v_tdh_north_america_indirect_tax_detail_us_pr4 {}

explore: hourly_table {}

explore: vrfy_view_c2b772aeb2d9b00ef9a2bb5cef16168c {}

explore: newtable3 {}
