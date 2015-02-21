json.array!(@fairs) do |fair|
  json.extract! fair, :id, :fid, :is_fair, :fair_name, :fair_state, :fair_notes, :video_key, :video_key_2009, :video_key_2006, :purchased, :returned_product, :converted_from_competition, :feather_in_hat, :fair_time, :incidents_remaining, :service_plan_number, :old_service_plan_ended, :old_service_plan_number, :international, :showorks_web_user, :temp_flag, :free_upgrade, :poor_payment, :christmas_2010, :christmas_2011, :processed_2012, :mailed_2012_invoice, :courtesy_late_pmt, :bulk_ne, :judas
  json.url fair_url(fair, format: :json)
end
