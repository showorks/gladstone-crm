class ImportActivationsJob < GladstoneJob
  require 'csv'
  queue_as :default

  def perform(*args)
    # Download file from S3
    get_file_from_s3(arguments.first[:filename])

    # Remove existing data
    Activation.delete_all

    # Import data from CSV
    @filename_with_path = "#{Rails.root}/tmp/uploads/Activations.csv"
    CSV.foreach(@filename_with_path, :headers => true, :header_converters => :symbol, :encoding => 'ISO-8859-1:utf-8') do |row|
      activation = Activation.find_by_aid(row[:aid])
      unless activation
        activation = Activation.new
        activation.aid = row[:aid]
      end
      activation.snid = row[:snid]
      activation.system_code = row[:system_code]
      activation.activation_id = row[:activation_id]
      activation.computer_description = row[:computer_description]
      activation.activation_date = gs_convert_date(row[:activation_date])
      activation.active_activation = gs_convert_boolean(row[:active_activation])
      activation.deactivation_date = gs_convert_date(row[:deactivation_date])
      activation.deactivation_by = row[:deactivation_by]

      # Link up to Fair and Serial Number
      activation.serial_number = SerialNumber.find_by_snid(row[:snid])

      activation.save
    end
  end
end
