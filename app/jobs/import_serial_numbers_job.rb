class ImportSerialNumbersJob < GladstoneJob
  require 'csv'

  def perform(*args)
    filename_with_path = "#{Rails.root}/tmp/uploads/Serial Numbers.csv"
    serial_numbers = []
    fairs = Fair.pluck(:fid, :id) # Load fairs into fairs array so we don't hit the DB each time

    # Import data from CSV
    CSV.foreach(filename_with_path, :headers => true, :header_converters => :symbol, :encoding => 'ISO-8859-1:utf-8') do |row|

      # Look in fairs array for fid and get id
      if row[:fid].present? && fairs.select{ |fid, id| fid == row[:fid].to_i }.size > 0
        fair_id = fairs.select{ |fid, id| fid == row[:fid].to_i }[0][1].to_i
      else
        fair_id = 0
      end

      # Import CSV into serial numbers array
      serial_numbers << SerialNumber.new(
        snid:                  row[:snid],
        fid:                   row[:fid],
        version:               row[:version],
        edition:               row[:edition],
        fair_name:             row[:fair_name],
        serial_number:         row[:serial_number],
        issue_date:            gs_convert_date(row[:issue_date]),
        active_serial_number:  gs_convert_boolean(row[:active_serial_number]),
        extras:                row[:extras],
        service_plan_override: row[:service_plan_override],
        fair_id:               fair_id
      )
      SerialNumber.import(serial_numbers) and serial_numbers = [] if serial_numbers.size > 49
    end

    SerialNumber.import(serial_numbers)
  end
end
