- dashboard: Sample 1
  title: Sample LookML Dashboard
  layout: tile
  tile_size: 100

  filters:

  elements:
    - name: Enrollments By Race per Year
      type: looker_column
      explore: base
      dimensions: [static_demographics.race_text, enrollments.start_year]
      pivots: [enrollments.start_year]
      measures: [clients.count]
      filters:
        enrollments.date_filter: 2013/01/01 to today
        enrollments.start_year: after 2013/01/01
      sorts: [clients.count desc, enrollments.start_year]
      limit: '500'
      column_limit: '50'
      query_timezone: America/Los_Angeles
      stacking: ''
      show_value_labels: false
      label_density: 25
      legend_position: center
      x_axis_gridlines: false
      y_axis_gridlines: true
      show_view_names: true
      limit_displayed_rows: false
      y_axis_combined: true
      show_y_axis_labels: true
      show_y_axis_ticks: true
      y_axis_tick_density: default
      y_axis_tick_density_custom: 5
      show_x_axis_label: true
      show_x_axis_ticks: true
      x_axis_scale: auto
      y_axis_scale_mode: linear
      ordering: none
      show_null_labels: false
      show_totals_labels: false
      show_silhouette: false
      totals_color: '#808080'
