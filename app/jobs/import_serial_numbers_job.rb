class ImportSerialNumbersJob < GladstoneJob
  require 'csv'
  queue_as :default

  def perform(*args)
    @filename_with_path = "#{Rails.root}/tmp/uploads/Serial Numbers.csv"
    CSV.foreach(@filename_with_path, :headers => true, :header_converters => :symbol) do |row|
      serial_number = SerialNumber.find_by_snid(row[:snid])
      unless serial_number
        serial_number = SerialNumber.new
        serial_number.snid = row[:snid]
      end
      serial_number.fid = row[:fid]
      serial_number.version = row[:version]
      serial_number.edition = row[:edition]
      serial_number.fair_name = row[:fair_name]
      serial_number.serial_number = row[:serial_number]
      serial_number.issue_date = gs_convert_date(row[:issue_date])
      serial_number.active_serial_number = gs_convert_boolean(row[:active_serial_number])
      serial_number.extras = row[:extras]
      serial_number.service_plan_override = row[:service_plan_override]

      # Link up to Fair
      serial_number.fair = Fair.find_by_fid(row[:fid])

      serial_number.save
    end
  end
end
