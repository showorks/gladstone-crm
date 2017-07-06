class ImportActivationsJob < GladstoneJob
  require 'csv'

  def perform(*args)
    filename_with_path = "#{Rails.root}/tmp/uploads/Activations.csv"
    activations = []
    serial_numbers = SerialNumber.pluck(:snid, :id) # Load serial numbers into array so we don't hit the DB each time

    # Import data from CSV into an array
    CSV.foreach(filename_with_path, :headers => true, :header_converters => :symbol, :encoding => 'ISO-8859-1:utf-8') do |row|

      # Look in serial numbers array for snid and get id
      if row[:snid].present? && serial_numbers.select{ |snid, id| snid == row[:snid].to_i }.size > 0
        serial_number_id = serial_numbers.select{ |snid, id| snid == row[:snid].to_i }[0][1].to_i
      else
        serial_number_id = 0
      end

      # Import CSV into activations array
      #Activation.create!(
      activations << Activation.new(
        aid:                  row[:aid],
        snid:                 row[:snid],
        system_code:          row[:system_code],
        activation_id:        row[:activation_id],
        computer_description: row[:computer_description],
        activation_date:      gs_convert_date(row[:activation_date]),
        active_activation:    gs_convert_boolean(row[:active_activation]),
        deactivation_date:    gs_convert_date(row[:deactivation_date]),
        deactivation_by:      row[:deactivation_by],
        serial_number_id:     serial_number_id
      )
      Activation.import(activations) and activations = [] if activations.size > 49
    end

    Activation.import(activations)
  end
end
