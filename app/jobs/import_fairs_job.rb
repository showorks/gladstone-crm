class ImportFairsJob < GladstoneJob
  require 'csv'
  queue_as :default

  def perform(*args)
    @filename_with_path = "#{Rails.root}/tmp/uploads/Fairs.csv"
    CSV.foreach(@filename_with_path, :headers => true, :header_converters => :symbol) do |row|
      fair = Fair.find_by_fid(row[:fid])
      unless fair
        fair = Fair.new
        fair.fid = row[:fid]
      end
      fair.is_fair = gs_convert_boolean(row[:is_fair])
      fair.fair_name = row[:fair_name]
      fair.fair_state = row[:fair_state]
      fair.fair_notes = row[:fair_notes]
      fair.video_key = row[:video_key]
      fair.video_key_2009 = row[:video_key_2009]
      fair.video_key_2006 = row[:video_key_2006]
      fair.purchased = gs_convert_boolean(row[:purchased])
      fair.returned_product = gs_convert_boolean(row[:returned_product])
      fair.converted_from_competition = gs_convert_boolean(row[:converted_from_competition])
      fair.feather_in_hat = gs_convert_boolean(row[:feather_in_hat])
      fair.fair_time = row[:fair_time]
      fair.incidents_remaining = row[:incidents_remaining]
      fair.service_plan_number = row[:service_plan_number]
      fair.old_service_plan_ended = gs_convert_date(row[:old_service_plan_ended])
      fair.old_service_plan_number = row[:old_service_plan_number]
      fair.international = gs_convert_boolean(row[:international])
      fair.showorks_web_user = gs_convert_boolean(row[:showorks_web_user])
      fair.temp_flag = gs_convert_boolean(row[:temp_flag])
      fair.free_upgrade = gs_convert_boolean(row[:free_upgrade])
      fair.poor_payment = gs_convert_boolean(row[:poor_payment])
      fair.christmas_2010 = gs_convert_boolean(row[:christmas_2010])
      fair.christmas_2011 = gs_convert_boolean(row[:christmas_2011])
      fair.processed_2012 = gs_convert_boolean(row[:processed_2012])
      fair.mailed_2012_invoice = gs_convert_boolean(row[:mailed_2012_invoice])
      fair.courtesy_late_pmt = gs_convert_boolean(row[:courtesy_late_pmt])
      fair.bulk_ne = gs_convert_boolean(row[:bulk_ne])
      fair.judas = gs_convert_boolean(row[:judas])
      fair.save
    end
  end
end
