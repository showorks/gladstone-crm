class ImportFairsJob < GladstoneJob
  require 'csv'

  def perform(*args)
    filename_with_path = "#{Rails.root}/tmp/uploads/Fairs.csv"
    fairs = []

    # Import data from CSV
    CSV.foreach(filename_with_path, :headers => true, :header_converters => :symbol, :encoding => 'ISO-8859-1:utf-8') do |row|

      # Import CSV into fairs array
      #Fair.create!(
      fairs << Fair.new(
        fid:                        row[:fid],
        is_fair:                    gs_convert_boolean(row[:is_fair]),
        fair_name:                  row[:fair_name],
        fair_state:                 row[:fair_state],
        fair_notes:                 row[:fair_notes],
        video_key:                  row[:video_key],
        video_key_2009:             row[:video_key_2009],
        video_key_2006:             row[:video_key_2006],
        purchased:                  gs_convert_boolean(row[:purchased]),
        returned_product:           gs_convert_boolean(row[:returned_product]),
        converted_from_competition: gs_convert_boolean(row[:converted_from_competition]),
        feather_in_hat:             gs_convert_boolean(row[:feather_in_hat]),
        fair_time:                  row[:fair_time],
        incidents_remaining:        row[:incidents_remaining],
        service_plan_number:        row[:service_plan_number],
        old_service_plan_ended:     gs_convert_date(row[:old_service_plan_ended]),
        old_service_plan_number:    row[:old_service_plan_number],
        international:              gs_convert_boolean(row[:international]),
        showorks_web_user:          gs_convert_boolean(row[:showorks_web_user]),
        temp_flag:                  gs_convert_boolean(row[:temp_flag]),
        free_upgrade:               gs_convert_boolean(row[:free_upgrade]),
        poor_payment:               gs_convert_boolean(row[:poor_payment]),
        christmas_2010:             gs_convert_boolean(row[:christmas_2010]),
        christmas_2011:             gs_convert_boolean(row[:christmas_2011]),
        processed_2012:             gs_convert_boolean(row[:processed_2012]),
        mailed_2012_invoice:        gs_convert_boolean(row[:mailed_2012_invoice]),
        courtesy_late_pmt:          gs_convert_boolean(row[:courtesy_late_pmt]),
        bulk_ne:                    gs_convert_boolean(row[:bulk_ne]),
        judas:                      gs_convert_boolean(row[:judas])
      )
      Fair.import(fairs) and fairs = [] if fairs.size > 49
    end

    Fair.import(fairs)
  end
end


