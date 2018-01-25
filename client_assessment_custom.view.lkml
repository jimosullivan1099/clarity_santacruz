view: client_assessment_custom {
  sql_table_name: client_assessment_data
    ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: ref_client_assessment_demographics {
    hidden: yes
    type: number
    sql: ${TABLE}.ref_client_assessment_demographics ;;
  }

  dimension: age_13_17 {
    type: number
    sql: ${TABLE}.age_13_17 ;;
  }

  dimension: age_18_24 {
    type: number
    sql: ${TABLE}.age_18_24 ;;
  }

  dimension: age_25_59 {
    type: number
    sql: ${TABLE}.age_25_59 ;;
  }

  dimension: age_4_12 {
    type: number
    sql: ${TABLE}.age_4_12 ;;
  }

  dimension: age_60 {
    type: number
    sql: ${TABLE}.age_60 ;;
  }

  dimension: asian_number {
    type: number
    sql: ${TABLE}.asian_number ;;
  }

  dimension: birth_city {
    sql: ${TABLE}.birth_city ;;
  }

  dimension: black_number {
    type: number
    sql: ${TABLE}.black_number ;;
  }

  dimension: c_able_pay_utilities {
    type: number
    sql: ${TABLE}.c_able_pay_utilities ;;
  }

  dimension: c_able_to_pay_rent {
    type: number
    sql: ${TABLE}.c_able_to_pay_rent ;;
  }

  dimension: c_abuse_more_than_one_drug {
    type: number
    sql: ${TABLE}.c_abuse_more_than_one_drug ;;
  }

  dimension: c_accepted_services {
    type: number
    sql: ${TABLE}.c_accepted_services ;;
  }

  dimension: c_access_food_bank {
    type: number
    sql: ${TABLE}.c_access_food_bank ;;
  }

  dimension: c_additional_agencies {
    type: number
    sql: ${TABLE}.c_additional_agencies ;;
  }

  dimension: c_additional_agencies_where {
    type: number
    sql: ${TABLE}.c_additional_agencies_where ;;
  }

  dimension: c_address {
    sql: ${TABLE}.c_address ;;
  }

  dimension: c_address_alternate {
    sql: ${TABLE}.c_address_alternate ;;
  }

  dimension: c_address_main {
    sql: ${TABLE}.c_address_main ;;
  }

  dimension: c_adjudicated {
    type: number
    sql: ${TABLE}.c_adjudicated ;;
  }

  dimension: c_age_0_5 {
    type: number
    sql: ${TABLE}.c_age_0_5 ;;
  }

  dimension: c_age_13_17 {
    type: number
    sql: ${TABLE}.c_age_13_17 ;;
  }

  dimension: c_age_18_24 {
    type: number
    sql: ${TABLE}.c_age_18_24 ;;
  }

  dimension: c_age_25_44 {
    type: number
    sql: ${TABLE}.c_age_25_44 ;;
  }

  dimension: c_age_45_54 {
    type: number
    sql: ${TABLE}.c_age_45_54 ;;
  }

  dimension: c_age_55_64 {
    type: number
    sql: ${TABLE}.c_age_55_64 ;;
  }

  dimension: c_age_65_plus {
    type: number
    sql: ${TABLE}.c_age_65_plus ;;
  }

  dimension: c_age_6_12 {
    type: number
    sql: ${TABLE}.c_age_6_12 ;;
  }

  dimension: c_ambulation {
    type: number
    sql: ${TABLE}.c_ambulation ;;
  }

  dimension: c_american_indian_alaska_native {
    type: number
    sql: ${TABLE}.c_american_indian_alaska_native ;;
  }

  dimension: c_anyone_paying_childcare {
    type: number
    sql: ${TABLE}.c_anyone_paying_childcare ;;
  }

  dimension: c_art_hours {
    type: number
    sql: ${TABLE}.c_art_hours ;;
  }

  dimension: c_asian {
    type: number
    sql: ${TABLE}.c_asian ;;
  }

  dimension: c_assigned_cm {
    sql: ${TABLE}.c_assigned_cm ;;
  }

  dimension: c_assigned_pd {
    sql: ${TABLE}.c_assigned_pd ;;
  }

  dimension: c_attempted_suicide {
    type: number
    sql: ${TABLE}.c_attempted_suicide ;;
  }

  dimension: c_been_abjudicated {
    type: number
    sql: ${TABLE}.c_been_abjudicated ;;
  }

  dimension: c_been_at_west_hills_hospital {
    type: number
    sql: ${TABLE}.c_been_at_west_hills_hospital ;;
  }

  dimension: c_black_african_american {
    type: number
    sql: ${TABLE}.c_black_african_american ;;
  }

  dimension: c_blackouts_flashbacks {
    type: number
    sql: ${TABLE}.c_blackouts_flashbacks ;;
  }

  dimension: c_casas_scores_improved {
    type: number
    sql: ${TABLE}.c_casas_scores_improved ;;
  }

  dimension: c_casemanager_name {
    sql: ${TABLE}.c_casemanager_name ;;
  }

  dimension: c_characteristics {
    sql: ${TABLE}.c_characteristics ;;
  }

  dimension: c_chronic {
    type: number
    sql: ${TABLE}.c_chronic ;;
  }

  dimension: c_church_org_referred_to {
    sql: ${TABLE}.c_church_org_referred_to ;;
  }

  dimension: c_city_county {
    sql: ${TABLE}.c_city_county ;;
  }

  dimension: c_client_enrolled_school {
    type: number
    sql: ${TABLE}.c_client_enrolled_school ;;
  }

  dimension_group: c_closure {
    type: time
    timeframes: [date, week, month]
    convert_tz: no
    sql: ${TABLE}.c_closure_date ;;
  }

  dimension: c_community_service_hours {
    type: number
    sql: ${TABLE}.c_community_service_hours ;;
  }

  dimension: c_complaints_about_drug_use {
    type: number
    sql: ${TABLE}.c_complaints_about_drug_use ;;
  }

  dimension: c_current_legal_issues {
    type: number
    sql: ${TABLE}.c_current_legal_issues ;;
  }

  dimension: c_cut_down_drinking {
    type: number
    sql: ${TABLE}.c_cut_down_drinking ;;
  }

  dimension_group: c_date_last_dr_visit {
    type: time
    timeframes: [date, week, month]
    convert_tz: no
    sql: ${TABLE}.c_date_last_dr_visit ;;
  }

  dimension: c_diagnosis {
    sql: ${TABLE}.c_diagnosis ;;
  }

  dimension: c_drink_to_get_going {
    type: number
    sql: ${TABLE}.c_drink_to_get_going ;;
  }

  dimension: c_drug_choice {
    sql: ${TABLE}.c_drug_choice ;;
  }

  dimension: c_earned_ged {
    type: number
    sql: ${TABLE}.c_earned_ged ;;
  }

  dimension: c_english {
    type: number
    sql: ${TABLE}.c_english ;;
  }

  dimension: c_english_explain {
    sql: ${TABLE}.c_english_explain ;;
  }

  dimension: c_everything_makes_you_tired {
    type: number
    sql: ${TABLE}.c_everything_makes_you_tired ;;
  }

  dimension: c_failed_to_do_expected {
    type: number
    sql: ${TABLE}.c_failed_to_do_expected ;;
  }

  dimension: c_fall_cause {
    type: number
    sql: ${TABLE}.c_fall_cause ;;
  }

  dimension: c_fall_concern {
    type: number
    sql: ${TABLE}.c_fall_concern ;;
  }

  dimension_group: c_fall_last {
    type: time
    timeframes: [date, week, month]
    convert_tz: no
    sql: ${TABLE}.c_fall_last ;;
  }

  dimension: c_fall_reoccurring {
    type: number
    sql: ${TABLE}.c_fall_reoccurring ;;
  }

  dimension: c_fall_where {
    type: number
    sql: ${TABLE}.c_fall_where ;;
  }

  dimension: c_family_counseling_hours {
    type: number
    sql: ${TABLE}.c_family_counseling_hours ;;
  }

  dimension: c_family_relations_improved {
    type: number
    sql: ${TABLE}.c_family_relations_improved ;;
  }

  dimension: c_family_wellness_hours {
    type: number
    sql: ${TABLE}.c_family_wellness_hours ;;
  }

  dimension: c_feel_bad_drug_use {
    type: number
    sql: ${TABLE}.c_feel_bad_drug_use ;;
  }

  dimension: c_followup {
    type: number
    sql: ${TABLE}.c_followup ;;
  }

  dimension: c_food_pantry_hours {
    type: number
    sql: ${TABLE}.c_food_pantry_hours ;;
  }

  dimension: c_fpoutreach {
    type: number
    sql: ${TABLE}.c_fpoutreach ;;
  }

  dimension: c_frequency_alcohol_consumption {
    type: number
    sql: ${TABLE}.c_frequency_alcohol_consumption ;;
  }

  dimension: c_frequency_unable_stop_drinking {
    type: number
    sql: ${TABLE}.c_frequency_unable_stop_drinking ;;
  }

  dimension: c_functional_status {
    type: number
    sql: ${TABLE}.c_functional_status ;;
  }

  dimension: c_gained_employment {
    type: number
    sql: ${TABLE}.c_gained_employment ;;
  }

  dimension: c_gang_activity {
    type: number
    sql: ${TABLE}.c_gang_activity ;;
  }

  dimension: c_gang_affiliiation {
    sql: ${TABLE}.c_gang_affiliiation ;;
  }

  dimension: c_goals_not_met {
    type: number
    sql: ${TABLE}.c_goals_not_met ;;
  }

  dimension: c_grade_in_school {
    type: number
    sql: ${TABLE}.c_grade_in_school ;;
  }

  dimension: c_grasp_adapt_hours {
    type: number
    sql: ${TABLE}.c_grasp_adapt_hours ;;
  }

  dimension: c_guilt_remorse_drinking {
    type: number
    sql: ${TABLE}.c_guilt_remorse_drinking ;;
  }

  dimension: c_hawaiian_pacific_islander {
    type: number
    sql: ${TABLE}.c_hawaiian_pacific_islander ;;
  }

  dimension: c_hispanic_number {
    type: number
    sql: ${TABLE}.c_hispanic_number ;;
  }

  dimension: c_id_type {
    sql: ${TABLE}.c_id_type ;;
  }

  dimension: c_if_divorced_court_ordered_custody {
    type: number
    sql: ${TABLE}.c_if_divorced_court_ordered_custody ;;
  }

  dimension: c_illegal_activities_obtain_obtain_drugs {
    type: number
    sql: ${TABLE}.c_illegal_activities_obtain_obtain_drugs ;;
  }

  dimension: c_immunizations_current {
    type: number
    sql: ${TABLE}.c_immunizations_current ;;
  }

  dimension: c_impairment_explain {
    sql: ${TABLE}.c_impairment_explain ;;
  }

  dimension: c_income_received {
    sql: ${TABLE}.c_income_received ;;
  }

  dimension: c_increase_extracurricular_activities {
    type: number
    sql: ${TABLE}.c_increase_extracurricular_activities ;;
  }

  dimension: c_injured_from_drinking {
    type: number
    sql: ${TABLE}.c_injured_from_drinking ;;
  }

  dimension_group: c_intake {
    type: time
    timeframes: [date, week, month]
    convert_tz: no
    sql: ${TABLE}.c_intake_date ;;
  }

  dimension: c_intervention_site {
    sql: ${TABLE}.c_intervention_site ;;
  }

  dimension: c_ivdu {
    type: number
    sql: ${TABLE}.c_ivdu ;;
  }

  dimension: c_jurisdiction {
    type: number
    sql: ${TABLE}.c_jurisdiction ;;
  }

  dimension: c_language_barrier {
    type: number
    sql: ${TABLE}.c_language_barrier ;;
  }

  dimension: c_legal_type {
    sql: ${TABLE}.c_legal_type ;;
  }

  dimension: c_less_energy {
    type: number
    sql: ${TABLE}.c_less_energy ;;
  }

  dimension: c_livingwithadult1_bestcontact {
    sql: ${TABLE}.c_livingwithadult1_bestcontact ;;
  }

  dimension: c_livingwithadult1_cellcontact {
    sql: ${TABLE}.c_livingwithadult1_cellcontact ;;
  }

  dimension: c_livingwithadult1_language {
    sql: ${TABLE}.c_livingwithadult1_language ;;
  }

  dimension: c_livingwithadult1_name {
    sql: ${TABLE}.c_livingwithadult1_name ;;
  }

  dimension: c_livingwithadult1_workcontact {
    sql: ${TABLE}.c_livingwithadult1_workcontact ;;
  }

  dimension: c_livingwithadult2_bestcontact {
    sql: ${TABLE}.c_livingwithadult2_bestcontact ;;
  }

  dimension: c_livingwithadult2_cellcontact {
    sql: ${TABLE}.c_livingwithadult2_cellcontact ;;
  }

  dimension: c_livingwithadult2_language {
    sql: ${TABLE}.c_livingwithadult2_language ;;
  }

  dimension: c_livingwithadult2_name {
    sql: ${TABLE}.c_livingwithadult2_name ;;
  }

  dimension: c_livingwithadult2_workcontact {
    sql: ${TABLE}.c_livingwithadult2_workcontact ;;
  }

  dimension: c_location_description {
    sql: ${TABLE}.c_location_description ;;
  }

  dimension: c_lvfr_notes {
    sql: ${TABLE}.c_lvfr_notes ;;
  }

  dimension: c_medical_changes {
    type: number
    sql: ${TABLE}.c_medical_changes ;;
  }

  dimension: c_medical_declined {
    type: number
    sql: ${TABLE}.c_medical_declined ;;
  }

  dimension: c_medical_different {
    type: number
    sql: ${TABLE}.c_medical_different ;;
  }

  dimension: c_medical_medication {
    type: number
    sql: ${TABLE}.c_medical_medication ;;
  }

  dimension: c_medical_medication_filled {
    type: number
    sql: ${TABLE}.c_medical_medication_filled ;;
  }

  dimension: c_medical_physician {
    type: number
    sql: ${TABLE}.c_medical_physician ;;
  }

  dimension: c_medical_physician_name {
    sql: ${TABLE}.c_medical_physician_name ;;
  }

  dimension: c_medical_problems_drug_use {
    type: number
    sql: ${TABLE}.c_medical_problems_drug_use ;;
  }

  dimension: c_medical_specialty {
    type: number
    sql: ${TABLE}.c_medical_specialty ;;
  }

  dimension: c_medical_specialty_name {
    sql: ${TABLE}.c_medical_specialty_name ;;
  }

  dimension: c_medically_fragile {
    type: number
    sql: ${TABLE}.c_medically_fragile ;;
  }

  dimension: c_medication_taken {
    sql: ${TABLE}.c_medication_taken ;;
  }

  dimension: c_meds_go_with_youth_to_shelter {
    type: number
    sql: ${TABLE}.c_meds_go_with_youth_to_shelter ;;
  }

  dimension: c_met_goals {
    type: number
    sql: ${TABLE}.c_met_goals ;;
  }

  dimension: c_metro {
    type: number
    sql: ${TABLE}.c_metro ;;
  }

  dimension: c_multiagency {
    type: number
    sql: ${TABLE}.c_multiagency ;;
  }

  dimension: c_name_parole_probation_officer {
    sql: ${TABLE}.c_name_parole_probation_officer ;;
  }

  dimension: c_need_help_paying_childcare {
    type: number
    sql: ${TABLE}.c_need_help_paying_childcare ;;
  }

  dimension: c_needs_to_be_addressed {
    type: number
    sql: ${TABLE}.c_needs_to_be_addressed ;;
  }

  dimension: c_neglected_family_drug_use {
    type: number
    sql: ${TABLE}.c_neglected_family_drug_use ;;
  }

  dimension: c_no_interest {
    type: number
    sql: ${TABLE}.c_no_interest ;;
  }

  dimension: c_not_as_good_as_others {
    type: number
    sql: ${TABLE}.c_not_as_good_as_others ;;
  }

  dimension: c_not_remained_approved_location_why {
    sql: ${TABLE}.c_not_remained_approved_location_why ;;
  }

  dimension: c_number_african_american {
    type: number
    sql: ${TABLE}.c_number_african_american ;;
  }

  dimension: c_number_asian {
    type: number
    sql: ${TABLE}.c_number_asian ;;
  }

  dimension: c_number_caucasian {
    type: number
    sql: ${TABLE}.c_number_caucasian ;;
  }

  dimension: c_number_daily_drinks {
    type: number
    sql: ${TABLE}.c_number_daily_drinks ;;
  }

  dimension: c_number_family_members {
    type: number
    sql: ${TABLE}.c_number_family_members ;;
  }

  dimension: c_number_native_american {
    type: number
    sql: ${TABLE}.c_number_native_american ;;
  }

  dimension: c_number_other {
    type: number
    sql: ${TABLE}.c_number_other ;;
  }

  dimension: c_number_pacific_islander {
    type: number
    sql: ${TABLE}.c_number_pacific_islander ;;
  }

  dimension: c_nv_healthlink {
    type: number
    sql: ${TABLE}.c_nv_healthlink ;;
  }

  dimension: c_nv_reason {
    sql: ${TABLE}.c_nv_reason ;;
  }

  dimension: c_nv_stay {
    type: number
    sql: ${TABLE}.c_nv_stay ;;
  }

  dimension: c_offended_reoffended_while_managed {
    type: number
    sql: ${TABLE}.c_offended_reoffended_while_managed ;;
  }

  dimension: c_other_agencies_providing_services {
    sql: ${TABLE}.c_other_agencies_providing_services ;;
  }

  dimension: c_other_grade {
    sql: ${TABLE}.c_other_grade ;;
  }

  dimension: c_other_multiracial {
    type: number
    sql: ${TABLE}.c_other_multiracial ;;
  }

  dimension: c_parenting_classes_hours {
    type: number
    sql: ${TABLE}.c_parenting_classes_hours ;;
  }

  dimension: c_parents_marital_status {
    type: number
    sql: ${TABLE}.c_parents_marital_status ;;
  }

  dimension: c_parole_probation_officer {
    type: number
    sql: ${TABLE}.c_parole_probation_officer ;;
  }

  dimension: c_partially_met_goals {
    type: number
    sql: ${TABLE}.c_partially_met_goals ;;
  }

  dimension: c_pet_type {
    sql: ${TABLE}.c_pet_type ;;
  }

  dimension: c_pets {
    type: number
    sql: ${TABLE}.c_pets ;;
  }

  dimension: c_phone {
    sql: ${TABLE}.c_phone ;;
  }

  dimension: c_print_name {
    sql: ${TABLE}.c_print_name ;;
  }

  dimension: c_prior_city {
    sql: ${TABLE}.c_prior_city ;;
  }

  dimension: c_probation_while_being_managed {
    type: number
    sql: ${TABLE}.c_probation_while_being_managed ;;
  }

  dimension: c_receiving_services_from_other_agencies {
    type: number
    sql: ${TABLE}.c_receiving_services_from_other_agencies ;;
  }

  dimension: c_ref_dme {
    type: number
    sql: ${TABLE}.c_ref_dme ;;
  }

  dimension: c_ref_infant {
    type: number
    sql: ${TABLE}.c_ref_infant ;;
  }

  dimension: c_ref_nhap {
    type: number
    sql: ${TABLE}.c_ref_nhap ;;
  }

  dimension: c_ref_pregnancy {
    type: number
    sql: ${TABLE}.c_ref_pregnancy ;;
  }

  dimension: c_ref_tanf {
    type: number
    sql: ${TABLE}.c_ref_tanf ;;
  }

  dimension: c_ref_vision {
    type: number
    sql: ${TABLE}.c_ref_vision ;;
  }

  dimension: c_ref_well {
    type: number
    sql: ${TABLE}.c_ref_well ;;
  }

  dimension: c_referred_medicaid_exchange {
    type: number
    sql: ${TABLE}.c_referred_medicaid_exchange ;;
  }

  dimension: c_refused {
    type: number
    sql: ${TABLE}.c_refused ;;
  }

  dimension: c_relation_to_head_of_household {
    type: number
    sql: ${TABLE}.c_relation_to_head_of_household ;;
  }

  dimension: c_remained_in_home_parent_approved_location {
    type: number
    sql: ${TABLE}.c_remained_in_home_parent_approved_location ;;
  }

  dimension: c_requesting_familiy_planning {
    type: number
    sql: ${TABLE}.c_requesting_familiy_planning ;;
  }

  dimension: c_residence_prior_to_entry {
    type: number
    sql: ${TABLE}.c_residence_prior_to_entry ;;
  }

  dimension: c_resourcenetwork {
    type: number
    sql: ${TABLE}.c_resourcenetwork ;;
  }

  dimension: c_run_away {
    type: number
    sql: ${TABLE}.c_run_away ;;
  }

  dimension: c_s_address_main {
    sql: ${TABLE}.c_s_address_main ;;
  }

  dimension: c_s_african_american {
    type: number
    sql: ${TABLE}.c_s_african_american ;;
  }

  dimension: c_s_age_0_5 {
    type: number
    sql: ${TABLE}.c_s_age_0_5 ;;
  }

  dimension: c_s_age_13_17 {
    type: number
    sql: ${TABLE}.c_s_age_13_17 ;;
  }

  dimension: c_s_age_18_24 {
    type: number
    sql: ${TABLE}.c_s_age_18_24 ;;
  }

  dimension: c_s_age_25_44 {
    type: number
    sql: ${TABLE}.c_s_age_25_44 ;;
  }

  dimension: c_s_age_45_54 {
    type: number
    sql: ${TABLE}.c_s_age_45_54 ;;
  }

  dimension: c_s_age_55_64 {
    type: number
    sql: ${TABLE}.c_s_age_55_64 ;;
  }

  dimension: c_s_age_65_plus {
    type: number
    sql: ${TABLE}.c_s_age_65_plus ;;
  }

  dimension: c_s_age_6_12 {
    type: number
    sql: ${TABLE}.c_s_age_6_12 ;;
  }

  dimension: c_s_asian {
    type: number
    sql: ${TABLE}.c_s_asian ;;
  }

  dimension: c_s_caucasian {
    type: number
    sql: ${TABLE}.c_s_caucasian ;;
  }

  dimension: c_s_city_county {
    sql: ${TABLE}.c_s_city_county ;;
  }

  dimension: c_s_hispanic {
    type: number
    sql: ${TABLE}.c_s_hispanic ;;
  }

  dimension: c_s_native_american {
    type: number
    sql: ${TABLE}.c_s_native_american ;;
  }

  dimension: c_s_number_family_members {
    type: number
    sql: ${TABLE}.c_s_number_family_members ;;
  }

  dimension: c_s_number_females {
    type: number
    sql: ${TABLE}.c_s_number_females ;;
  }

  dimension: c_s_number_males {
    type: number
    sql: ${TABLE}.c_s_number_males ;;
  }

  dimension: c_s_other {
    type: number
    sql: ${TABLE}.c_s_other ;;
  }

  dimension: c_s_pacific_islander {
    type: number
    sql: ${TABLE}.c_s_pacific_islander ;;
  }

  dimension: c_s_phone {
    sql: ${TABLE}.c_s_phone ;;
  }

  dimension: c_s_print_name {
    sql: ${TABLE}.c_s_print_name ;;
  }

  dimension: c_s_time_in_city {
    type: number
    sql: ${TABLE}.c_s_time_in_city ;;
  }

  dimension: c_s_zipcode {
    type: number
    sql: ${TABLE}.c_s_zipcode ;;
  }

  dimension_group: c_sa {
    type: time
    timeframes: [date, week, month]
    convert_tz: no
    sql: ${TABLE}.c_sa_date ;;
  }

  dimension: c_sbirt_id_number {
    type: number
    sql: ${TABLE}.c_sbirt_id_number ;;
  }

  dimension: c_school_attendance_improved {
    type: number
    sql: ${TABLE}.c_school_attendance_improved ;;
  }

  dimension: c_school_credits_increased {
    type: number
    sql: ${TABLE}.c_school_credits_increased ;;
  }

  dimension: c_self_harming {
    type: number
    sql: ${TABLE}.c_self_harming ;;
  }

  dimension: c_self_harming_frequency_triggers {
    sql: ${TABLE}.c_self_harming_frequency_triggers ;;
  }

  dimension: c_sibling1_gender {
    type: number
    sql: ${TABLE}.c_sibling1_gender ;;
  }

  dimension: c_sibling1_name {
    sql: ${TABLE}.c_sibling1_name ;;
  }

  dimension: c_sibling1_relation {
    type: number
    sql: ${TABLE}.c_sibling1_relation ;;
  }

  dimension: c_sibling2_gender {
    type: number
    sql: ${TABLE}.c_sibling2_gender ;;
  }

  dimension: c_sibling2_name {
    sql: ${TABLE}.c_sibling2_name ;;
  }

  dimension: c_sibling2_relation {
    type: number
    sql: ${TABLE}.c_sibling2_relation ;;
  }

  dimension: c_sibling3_gender {
    type: number
    sql: ${TABLE}.c_sibling3_gender ;;
  }

  dimension: c_sibling3_name {
    sql: ${TABLE}.c_sibling3_name ;;
  }

  dimension: c_sibling3_relation {
    type: number
    sql: ${TABLE}.c_sibling3_relation ;;
  }

  dimension: c_sibling4_gender {
    type: number
    sql: ${TABLE}.c_sibling4_gender ;;
  }

  dimension: c_sibling4_name {
    sql: ${TABLE}.c_sibling4_name ;;
  }

  dimension: c_sibling4_relation {
    type: number
    sql: ${TABLE}.c_sibling4_relation ;;
  }

  dimension: c_sibling5_gender {
    type: number
    sql: ${TABLE}.c_sibling5_gender ;;
  }

  dimension: c_sibling5_name {
    sql: ${TABLE}.c_sibling5_name ;;
  }

  dimension: c_sibling5_relation {
    type: number
    sql: ${TABLE}.c_sibling5_relation ;;
  }

  dimension: c_sibling6_gender {
    type: number
    sql: ${TABLE}.c_sibling6_gender ;;
  }

  dimension: c_sibling6_name {
    sql: ${TABLE}.c_sibling6_name ;;
  }

  dimension: c_sibling6_relation {
    type: number
    sql: ${TABLE}.c_sibling6_relation ;;
  }

  dimension: c_sibling7_gender {
    type: number
    sql: ${TABLE}.c_sibling7_gender ;;
  }

  dimension: c_sibling7_name {
    sql: ${TABLE}.c_sibling7_name ;;
  }

  dimension: c_sibling7_relation {
    type: number
    sql: ${TABLE}.c_sibling7_relation ;;
  }

  dimension: c_sibling8_gender {
    type: number
    sql: ${TABLE}.c_sibling8_gender ;;
  }

  dimension: c_sibling8_name {
    sql: ${TABLE}.c_sibling8_name ;;
  }

  dimension: c_sibling8_relation {
    type: number
    sql: ${TABLE}.c_sibling8_relation ;;
  }

  dimension: c_siblings_number {
    type: number
    sql: ${TABLE}.c_siblings_number ;;
  }

  dimension: c_site_condition {
    sql: ${TABLE}.c_site_condition ;;
  }

  dimension: c_six_plus_drinks {
    type: number
    sql: ${TABLE}.c_six_plus_drinks ;;
  }

  dimension: c_sn_arrived {
    sql: ${TABLE}.c_sn_arrived ;;
  }

  dimension: c_stand_dizzy {
    type: number
    sql: ${TABLE}.c_stand_dizzy ;;
  }

  dimension: c_status_of_transportation {
    type: number
    sql: ${TABLE}.c_status_of_transportation ;;
  }

  dimension: c_student_age {
    type: number
    sql: ${TABLE}.c_student_age ;;
  }

  dimension: c_student_ethnicity {
    type: number
    sql: ${TABLE}.c_student_ethnicity ;;
  }

  dimension: c_student_gender {
    type: number
    sql: ${TABLE}.c_student_gender ;;
  }

  dimension: c_substance_abuse_decreased {
    type: number
    sql: ${TABLE}.c_substance_abuse_decreased ;;
  }

  dimension: c_suicide {
    type: number
    sql: ${TABLE}.c_suicide ;;
  }

  dimension: c_support_person_for_youth {
    type: number
    sql: ${TABLE}.c_support_person_for_youth ;;
  }

  dimension: c_support_person_name_phone {
    sql: ${TABLE}.c_support_person_name_phone ;;
  }

  dimension: c_tds_hours {
    type: number
    sql: ${TABLE}.c_tds_hours ;;
  }

  dimension: c_thinking_clearly {
    type: number
    sql: ${TABLE}.c_thinking_clearly ;;
  }

  dimension: c_time_in_city {
    type: number
    sql: ${TABLE}.c_time_in_city ;;
  }

  dimension: c_total_cm_hours {
    type: number
    sql: ${TABLE}.c_total_cm_hours ;;
  }

  dimension: c_toys {
    type: number
    sql: ${TABLE}.c_toys ;;
  }

  dimension: c_transfer_status {
    type: number
    sql: ${TABLE}.c_transfer_status ;;
  }

  dimension: c_transport_where {
    sql: ${TABLE}.c_transport_where ;;
  }

  dimension: c_transportation_type {
    type: number
    sql: ${TABLE}.c_transportation_type ;;
  }

  dimension: c_treated_for_depression {
    type: number
    sql: ${TABLE}.c_treated_for_depression ;;
  }

  dimension: c_trusted_adult_outside_school {
    sql: ${TABLE}.c_trusted_adult_outside_school ;;
  }

  dimension: c_trusted_adult_school {
    sql: ${TABLE}.c_trusted_adult_school ;;
  }

  dimension: c_tutoring_hours {
    type: number
    sql: ${TABLE}.c_tutoring_hours ;;
  }

  dimension: c_type_of_insurance {
    type: number
    sql: ${TABLE}.c_type_of_insurance ;;
  }

  dimension_group: c_umc_discharge {
    type: time
    timeframes: [date, week, month]
    convert_tz: no
    sql: ${TABLE}.c_umc_discharge ;;
  }

  dimension: c_umc_los {
    type: number
    sql: ${TABLE}.c_umc_los ;;
  }

  dimension: c_umc_room {
    type: number
    sql: ${TABLE}.c_umc_room ;;
  }

  dimension: c_umc_socialworker {
    sql: ${TABLE}.c_umc_socialworker ;;
  }

  dimension: c_umc_socialworker_email {
    sql: ${TABLE}.c_umc_socialworker_email ;;
  }

  dimension: c_umc_socialworker_phone {
    sql: ${TABLE}.c_umc_socialworker_phone ;;
  }

  dimension: c_unable_to_remember_lastnight {
    type: number
    sql: ${TABLE}.c_unable_to_remember_lastnight ;;
  }

  dimension: c_unable_to_stop_drug_use {
    type: number
    sql: ${TABLE}.c_unable_to_stop_drug_use ;;
  }

  dimension: c_used_drugs_not_for_medical_reasons {
    type: number
    sql: ${TABLE}.c_used_drugs_not_for_medical_reasons ;;
  }

  dimension: c_vet_eligibility {
    type: number
    sql: ${TABLE}.c_vet_eligibility ;;
  }

  dimension: c_vet_verified {
    type: number
    sql: ${TABLE}.c_vet_verified ;;
  }

  dimension: c_vispdat_score {
    type: number
    sql: ${TABLE}.c_vispdat_score ;;
  }

  dimension: c_walk_assistance {
    type: number
    sql: ${TABLE}.c_walk_assistance ;;
  }

  dimension: c_warrant {
    type: number
    sql: ${TABLE}.c_warrant ;;
  }

  dimension: c_what_is_psychiatric_diagnosis {
    sql: ${TABLE}.c_what_is_psychiatric_diagnosis ;;
  }

  dimension: c_what_needs_to_be_addressed {
    sql: ${TABLE}.c_what_needs_to_be_addressed ;;
  }

  dimension: c_white {
    type: number
    sql: ${TABLE}.c_white ;;
  }

  dimension: c_who_requesting_family_planning {
    sql: ${TABLE}.c_who_requesting_family_planning ;;
  }

  dimension: c_why_casas_scores_not_improved {
    sql: ${TABLE}.c_why_casas_scores_not_improved ;;
  }

  dimension: c_why_family_relations_not_improved {
    sql: ${TABLE}.c_why_family_relations_not_improved ;;
  }

  dimension: c_why_goals_not_met {
    sql: ${TABLE}.c_why_goals_not_met ;;
  }

  dimension: c_why_increase_extracurricular_activities {
    sql: ${TABLE}.c_why_increase_extracurricular_activities ;;
  }

  dimension: c_why_no_ged {
    sql: ${TABLE}.c_why_no_ged ;;
  }

  dimension: c_why_not_employed {
    sql: ${TABLE}.c_why_not_employed ;;
  }

  dimension: c_why_not_enrolled_school {
    sql: ${TABLE}.c_why_not_enrolled_school ;;
  }

  dimension: c_why_not_remained_in_approved_housing {
    sql: ${TABLE}.c_why_not_remained_in_approved_housing ;;
  }

  dimension: c_why_school_attendance_not_improved {
    sql: ${TABLE}.c_why_school_attendance_not_improved ;;
  }

  dimension: c_why_school_credits_not_increased {
    sql: ${TABLE}.c_why_school_credits_not_increased ;;
  }

  dimension: c_why_substance_abuse_decreased {
    sql: ${TABLE}.c_why_substance_abuse_decreased ;;
  }

  dimension: c_wishes_linked_church_communityorg {
    type: number
    sql: ${TABLE}.c_wishes_linked_church_communityorg ;;
  }

  dimension: c_withdrawal_symptoms {
    type: number
    sql: ${TABLE}.c_withdrawal_symptoms ;;
  }

  dimension: c_work_readiness_hours {
    type: number
    sql: ${TABLE}.c_work_readiness_hours ;;
  }

  dimension: c_ybusa_sbirt_program {
    sql: ${TABLE}.c_ybusa_sbirt_program ;;
  }

  dimension: c_youth_diagnosed_add_adhd {
    type: number
    sql: ${TABLE}.c_youth_diagnosed_add_adhd ;;
  }

  dimension: c_yth_recieved_psychiatric_diagnosis {
    type: number
    sql: ${TABLE}.c_yth_recieved_psychiatric_diagnosis ;;
  }

  dimension: client_new {
    type: number
    sql: ${TABLE}.client_new ;;
  }

  dimension: cref_medical {
    type: number
    sql: ${TABLE}.cref_medical ;;
  }

  dimension: description {
    sql: ${TABLE}.description ;;
  }

  dimension: diabetic {
    type: number
    sql: ${TABLE}.diabetic ;;
  }

  dimension: disability_proof {
    type: number
    sql: ${TABLE}.disability_proof ;;
  }

  dimension: disability_proof_type {
    type: number
    sql: ${TABLE}.disability_proof_type ;;
  }

  dimension: eye_color {
    type: number
    sql: ${TABLE}.eye_color ;;
  }

  dimension: felony {
    type: number
    sql: ${TABLE}.felony ;;
  }

  dimension: felony_register {
    type: number
    sql: ${TABLE}.felony_register ;;
  }

  dimension: females_number {
    type: number
    sql: ${TABLE}.females_number ;;
  }

  dimension: guide_dog {
    type: number
    sql: ${TABLE}.guide_dog ;;
  }

  dimension: hair_color {
    type: number
    sql: ${TABLE}.hair_color ;;
  }

  dimension: health_afford_rx {
    type: number
    sql: ${TABLE}.health_afford_rx ;;
  }

  dimension: health_er {
    type: number
    sql: ${TABLE}.health_er ;;
  }

  dimension: health_ins_under {
    type: number
    sql: ${TABLE}.health_ins_under ;;
  }

  dimension: health_insurance_type {
    type: number
    sql: ${TABLE}.health_insurance_type ;;
  }

  dimension: health_knt {
    type: number
    sql: ${TABLE}.health_knt ;;
  }

  dimension: health_no_van {
    type: number
    sql: ${TABLE}.health_no_van ;;
  }

  dimension: health_pcp {
    type: number
    sql: ${TABLE}.health_pcp ;;
  }

  dimension: health_rx {
    type: number
    sql: ${TABLE}.health_rx ;;
  }

  dimension: health_van {
    type: number
    sql: ${TABLE}.health_van ;;
  }

  dimension: health_van_ref {
    type: number
    sql: ${TABLE}.health_van_ref ;;
  }

  dimension: hispanic_number {
    type: number
    sql: ${TABLE}.hispanic_number ;;
  }

  dimension: homeless {
    type: number
    sql: ${TABLE}.homeless ;;
  }

  dimension: homeless_cause {
    type: number
    sql: ${TABLE}.homeless_cause ;;
  }

  dimension: homeless_minor {
    type: number
    sql: ${TABLE}.homeless_minor ;;
  }

  dimension: household_adults {
    type: number
    sql: ${TABLE}.household_adults ;;
  }

  dimension: household_children {
    type: number
    sql: ${TABLE}.household_children ;;
  }

  dimension: household_multifamily {
    type: number
    sql: ${TABLE}.household_multifamily ;;
  }

  dimension: household_seniors {
    type: number
    sql: ${TABLE}.household_seniors ;;
  }

  dimension: household_total {
    type: number
    sql: ${TABLE}.household_total ;;
  }

  dimension: hp_access {
    type: number
    sql: ${TABLE}.hp_access ;;
  }

  dimension: hp_dairy {
    type: number
    sql: ${TABLE}.hp_dairy ;;
  }

  dimension: hp_fruit {
    type: number
    sql: ${TABLE}.hp_fruit ;;
  }

  dimension: hp_grains {
    type: number
    sql: ${TABLE}.hp_grains ;;
  }

  dimension: hp_headofhousehold {
    type: number
    sql: ${TABLE}.hp_headofhousehold ;;
  }

  dimension: hp_meat {
    type: number
    sql: ${TABLE}.hp_meat ;;
  }

  dimension: hp_missed_meals {
    type: number
    sql: ${TABLE}.hp_missed_meals ;;
  }

  dimension: hp_q1 {
    type: number
    sql: ${TABLE}.hp_q1 ;;
  }

  dimension: hp_q2 {
    type: number
    sql: ${TABLE}.hp_q2 ;;
  }

  dimension: hp_q3 {
    type: number
    sql: ${TABLE}.hp_q3 ;;
  }

  dimension: hp_q4 {
    type: number
    sql: ${TABLE}.hp_q4 ;;
  }

  dimension: identification {
    type: number
    sql: ${TABLE}.identification ;;
  }

  dimension: identification_birthcert {
    type: number
    sql: ${TABLE}.identification_birthcert ;;
  }

  dimension: identification_other {
    type: number
    sql: ${TABLE}.identification_other ;;
  }

  dimension: income_earned_monthly {
    type: number
    sql: ${TABLE}.income_earned_monthly ;;
  }

  dimension: income_level {
    type: number
    sql: ${TABLE}.income_level ;;
  }

  dimension: income_monthly_inheritence {
    type: number
    sql: ${TABLE}.income_monthly_inheritence ;;
  }

  dimension: income_monthly_total {
    type: number
    sql: ${TABLE}.income_monthly_total ;;
  }

  dimension: income_range {
    type: number
    sql: ${TABLE}.income_range ;;
  }

  dimension: interpreter {
    type: number
    sql: ${TABLE}.interpreter ;;
  }

  dimension: isamount {
    type: number
    sql: ${TABLE}.isamount ;;
  }

  dimension: ksk_caseworker {
    type: number
    sql: ${TABLE}.ksk_caseworker ;;
  }

  dimension: ksk_snap {
    type: number
    sql: ${TABLE}.ksk_snap ;;
  }

  dimension: ksk_snap_amount {
    type: number
    sql: ${TABLE}.ksk_snap_amount ;;
  }

  dimension: ksk_snap_app {
    type: number
    sql: ${TABLE}.ksk_snap_app ;;
  }

  dimension_group: ksk_snap_app {
    type: time
    timeframes: [date, week, month]
    convert_tz: no
    sql: ${TABLE}.ksk_snap_app_date ;;
  }

  dimension: ksk_snap_applied {
    type: number
    sql: ${TABLE}.ksk_snap_applied ;;
  }

  dimension: ksk_snap_ccnnapp {
    type: number
    sql: ${TABLE}.ksk_snap_ccnnapp ;;
  }

  dimension: ksk_snap_gaveapp {
    type: number
    sql: ${TABLE}.ksk_snap_gaveapp ;;
  }

  dimension: ksk_snap_pending {
    type: number
    sql: ${TABLE}.ksk_snap_pending ;;
  }

  dimension: ksk_snap_qualify {
    type: number
    sql: ${TABLE}.ksk_snap_qualify ;;
  }

  dimension: ksk_snap_recert {
    type: number
    sql: ${TABLE}.ksk_snap_recert ;;
  }

  dimension: ksk_snap_refer {
    type: number
    sql: ${TABLE}.ksk_snap_refer ;;
  }

  dimension: ksk_snap_referto {
    sql: ${TABLE}.ksk_snap_referto ;;
  }

  dimension: ksk_snap_refused {
    type: number
    sql: ${TABLE}.ksk_snap_refused ;;
  }

  dimension: ksk_snap_status {
    type: number
    sql: ${TABLE}.ksk_snap_status ;;
  }

  dimension: language {
    type: number
    sql: ${TABLE}.language ;;
  }

  dimension: law_consult {
    type: number
    sql: ${TABLE}.law_consult ;;
  }

  dimension: law_location {
    type: number
    sql: ${TABLE}.law_location ;;
  }

  dimension: limit_bathing {
    type: number
    sql: ${TABLE}.limit_bathing ;;
  }

  dimension: limit_bladder {
    type: number
    sql: ${TABLE}.limit_bladder ;;
  }

  dimension: limit_bowelcare {
    type: number
    sql: ${TABLE}.limit_bowelcare ;;
  }

  dimension: limit_dressing {
    type: number
    sql: ${TABLE}.limit_dressing ;;
  }

  dimension: limit_eating {
    type: number
    sql: ${TABLE}.limit_eating ;;
  }

  dimension: limit_housework {
    type: number
    sql: ${TABLE}.limit_housework ;;
  }

  dimension: limit_hygiene {
    type: number
    sql: ${TABLE}.limit_hygiene ;;
  }

  dimension: limit_locomotion {
    type: number
    sql: ${TABLE}.limit_locomotion ;;
  }

  dimension: limit_meals {
    type: number
    sql: ${TABLE}.limit_meals ;;
  }

  dimension: limit_mobility {
    type: number
    sql: ${TABLE}.limit_mobility ;;
  }

  dimension: limit_money {
    type: number
    sql: ${TABLE}.limit_money ;;
  }

  dimension: limit_shopping {
    type: number
    sql: ${TABLE}.limit_shopping ;;
  }

  dimension: limit_telephone {
    type: number
    sql: ${TABLE}.limit_telephone ;;
  }

  dimension: limit_transfer {
    type: number
    sql: ${TABLE}.limit_transfer ;;
  }

  dimension: living_arrangement {
    type: number
    sql: ${TABLE}.living_arrangement ;;
  }

  dimension: males_number {
    type: number
    sql: ${TABLE}.males_number ;;
  }

  dimension: member_number {
    type: number
    sql: ${TABLE}.member_number ;;
  }

  dimension: nativeamerican_number {
    type: number
    sql: ${TABLE}.nativeamerican_number ;;
  }

  dimension: needs_adoptions {
    type: number
    sql: ${TABLE}.needs_adoptions ;;
  }

  dimension: needs_diningroom {
    type: number
    sql: ${TABLE}.needs_diningroom ;;
  }

  dimension: needs_emergency {
    type: number
    sql: ${TABLE}.needs_emergency ;;
  }

  dimension: needs_hcelc {
    type: number
    sql: ${TABLE}.needs_hcelc ;;
  }

  dimension: needs_immigration {
    type: number
    sql: ${TABLE}.needs_immigration ;;
  }

  dimension: needs_k2s {
    type: number
    sql: ${TABLE}.needs_k2s ;;
  }

  dimension: needs_pantry {
    type: number
    sql: ${TABLE}.needs_pantry ;;
  }

  dimension: needs_residence {
    type: number
    sql: ${TABLE}.needs_residence ;;
  }

  dimension: needs_thriftstore {
    type: number
    sql: ${TABLE}.needs_thriftstore ;;
  }

  dimension: nevada_region {
    type: number
    sql: ${TABLE}.nevada_region ;;
  }

  dimension: nv_location {
    type: number
    sql: ${TABLE}.nv_location ;;
  }

  dimension: other_number {
    type: number
    sql: ${TABLE}.other_number ;;
  }

  dimension: pacificislander_number {
    type: number
    sql: ${TABLE}.pacificislander_number ;;
  }

  dimension: pantry_bags {
    type: number
    sql: ${TABLE}.pantry_bags ;;
  }

  dimension: ref_agency {
    type: number
    sql: ${TABLE}.ref_agency ;;
  }

  dimension: ref_assessment {
    type: number
    sql: ${TABLE}.ref_assessment ;;
  }

  dimension: ref_childfind {
    type: number
    sql: ${TABLE}.ref_childfind ;;
  }

  dimension: ref_childrenscab {
    type: number
    sql: ${TABLE}.ref_childrenscab ;;
  }

  dimension: ref_client {
    type: number
    sql: ${TABLE}.ref_client ;;
  }

  dimension: ref_clothing {
    type: number
    sql: ${TABLE}.ref_clothing ;;
  }

  dimension: ref_dental {
    type: number
    sql: ${TABLE}.ref_dental ;;
  }

  dimension: ref_dis {
    type: number
    sql: ${TABLE}.ref_dis ;;
  }

  dimension: ref_earlychild {
    type: number
    sql: ${TABLE}.ref_earlychild ;;
  }

  dimension: ref_employment {
    type: number
    sql: ${TABLE}.ref_employment ;;
  }

  dimension: ref_energy {
    type: number
    sql: ${TABLE}.ref_energy ;;
  }

  dimension: ref_er {
    type: number
    sql: ${TABLE}.ref_er ;;
  }

  dimension: ref_esl {
    type: number
    sql: ${TABLE}.ref_esl ;;
  }

  dimension: ref_food {
    type: number
    sql: ${TABLE}.ref_food ;;
  }

  dimension: ref_ged {
    type: number
    sql: ${TABLE}.ref_ged ;;
  }

  dimension: ref_hawc {
    type: number
    sql: ${TABLE}.ref_hawc ;;
  }

  dimension: ref_health_other {
    type: number
    sql: ${TABLE}.ref_health_other ;;
  }

  dimension: ref_healthc {
    type: number
    sql: ${TABLE}.ref_healthc ;;
  }

  dimension: ref_help {
    type: number
    sql: ${TABLE}.ref_help ;;
  }

  dimension: ref_homemaker {
    type: number
    sql: ${TABLE}.ref_homemaker ;;
  }

  dimension: ref_hopes {
    type: number
    sql: ${TABLE}.ref_hopes ;;
  }

  dimension: ref_immigration {
    type: number
    sql: ${TABLE}.ref_immigration ;;
  }

  dimension: ref_literacy {
    type: number
    sql: ${TABLE}.ref_literacy ;;
  }

  dimension: ref_medicaid {
    type: number
    sql: ${TABLE}.ref_medicaid ;;
  }

  dimension: ref_medicare {
    type: number
    sql: ${TABLE}.ref_medicare ;;
  }

  dimension: ref_mental {
    type: number
    sql: ${TABLE}.ref_mental ;;
  }

  dimension: ref_nutrition {
    type: number
    sql: ${TABLE}.ref_nutrition ;;
  }

  dimension: ref_nvcheckup {
    type: number
    sql: ${TABLE}.ref_nvcheckup ;;
  }

  dimension: ref_orvis {
    type: number
    sql: ${TABLE}.ref_orvis ;;
  }

  dimension: ref_othercommunity {
    type: number
    sql: ${TABLE}.ref_othercommunity ;;
  }

  dimension: ref_parenting {
    type: number
    sql: ${TABLE}.ref_parenting ;;
  }

  dimension: ref_pca {
    type: number
    sql: ${TABLE}.ref_pca ;;
  }

  dimension: ref_pcp {
    type: number
    sql: ${TABLE}.ref_pcp ;;
  }

  dimension: ref_salvarmy {
    type: number
    sql: ${TABLE}.ref_salvarmy ;;
  }

  dimension: ref_shelter {
    type: number
    sql: ${TABLE}.ref_shelter ;;
  }

  dimension: ref_smoking {
    type: number
    sql: ${TABLE}.ref_smoking ;;
  }

  dimension: ref_social {
    type: number
    sql: ${TABLE}.ref_social ;;
  }

  dimension: ref_socsec {
    type: number
    sql: ${TABLE}.ref_socsec ;;
  }

  dimension: ref_spcneeds {
    type: number
    sql: ${TABLE}.ref_spcneeds ;;
  }

  dimension: ref_status {
    type: number
    sql: ${TABLE}.ref_status ;;
  }

  dimension: ref_stmary {
    type: number
    sql: ${TABLE}.ref_stmary ;;
  }

  dimension: ref_transportation {
    type: number
    sql: ${TABLE}.ref_transportation ;;
  }

  dimension: ref_user {
    label: "User Creating"
    sql: fn_getUserNameById(${TABLE}.ref_user) ;;
  }

  dimension: ref_user_updated {
    label: "User Updating"
    sql: fn_getUserNameById(${TABLE}.ref_user_updated) ;;
  }

  dimension: ref_va {
    type: number
    sql: ${TABLE}.ref_va ;;
  }

  dimension: ref_washoe {
    type: number
    sql: ${TABLE}.ref_washoe ;;
  }

  dimension: ref_wic {
    type: number
    sql: ${TABLE}.ref_wic ;;
  }

  dimension: resources_ahcn {
    type: number
    sql: ${TABLE}.resources_ahcn ;;
  }

  dimension: resources_aps {
    type: number
    sql: ${TABLE}.resources_aps ;;
  }

  dimension: resources_benefits {
    type: number
    sql: ${TABLE}.resources_benefits ;;
  }

  dimension: resources_childcare {
    type: number
    sql: ${TABLE}.resources_childcare ;;
  }

  dimension: resources_counseling {
    type: number
    sql: ${TABLE}.resources_counseling ;;
  }

  dimension: resources_cps {
    type: number
    sql: ${TABLE}.resources_cps ;;
  }

  dimension: resources_dv {
    type: number
    sql: ${TABLE}.resources_dv ;;
  }

  dimension: resources_eps {
    type: number
    sql: ${TABLE}.resources_eps ;;
  }

  dimension: resources_frcs {
    type: number
    sql: ${TABLE}.resources_frcs ;;
  }

  dimension: resources_legal {
    type: number
    sql: ${TABLE}.resources_legal ;;
  }

  dimension: resources_sa {
    type: number
    sql: ${TABLE}.resources_sa ;;
  }

  dimension: resources_senior {
    type: number
    sql: ${TABLE}.resources_senior ;;
  }

  dimension: retired {
    type: number
    sql: ${TABLE}.retired ;;
  }

  dimension: session_idle_limit_warning {
    type: number
    sql: ${TABLE}.session_idle_limit_warning ;;
  }

  dimension: smoker {
    type: number
    sql: ${TABLE}.smoker ;;
  }

  dimension: sports_release {
    type: number
    sql: ${TABLE}.sports_release ;;
  }

  dimension: support_system {
    type: number
    sql: ${TABLE}.support_system ;;
  }

  dimension: total_amount {
    type: number
    sql: ${TABLE}.total_amount ;;
  }

  dimension: transgender_number {
    type: number
    sql: ${TABLE}.transgender_number ;;
  }

  dimension: vet_selfreported {
    type: number
    sql: ${TABLE}.vet_selfreported ;;
  }

  dimension: white_number {
    type: number
    sql: ${TABLE}.white_number ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      id,
      c_sibling4_name,
      c_sibling5_name,
      c_sibling6_name,
      c_sibling7_name,
      c_sibling8_name,
      c_medical_physician_name,
      c_livingwithadult2_name,
      c_sibling1_name,
      c_livingwithadult1_name,
      c_casemanager_name,
      c_medical_specialty_name,
      c_sibling2_name,
      c_sibling3_name,
      c_s_print_name,
      c_print_name
    ]
  }
}
