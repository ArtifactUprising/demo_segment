# Derived Table of Event Names used for Filter Suggestions

view: event_list {
  derived_table: {
    sql_trigger_value: SELECT FLOOR((EXTRACT(EPOCH FROM NOW() AT TIME ZONE 'US/Pacific') - 60*60*2)/(60*60*24)) ;;
    sortkeys: ["event_types"]
    distribution_style: all
    sql: SELECT
        event as event_types
      FROM artifact_web_prod.tracks
      where received_at >= '2017-01-01'
      GROUP BY 1
       ;;
  }

  dimension: event_types {
    type: string
    sql: ${TABLE}.event_types ;;
  }
}
