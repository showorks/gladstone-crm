class ImportMessagesJob < GladstoneJob
  require 'csv'
  queue_as :default

  def perform(*args)
    # Download file from S3
    get_file_from_s3(arguments.first[:filename])

    # Import data from CSV
    @filename_with_path = "#{Rails.root}/tmp/uploads/Incidents.csv"
    CSV.foreach(@filename_with_path, :headers => true, :header_converters => :symbol, :encoding => 'ISO-8859-1:utf-8') do |row|
      message = Message.find_by_iid(row[:iid])
      unless message
        message = Message.new
        message.iid = row[:iid]
      end
      message.cid = row[:cid]
      message.incident_date	= gs_convert_date(row[:incident_date])
      message.incident_type = row[:incident_type]
      message.incident_memo = row[:incident_memo]
      message.incident_follow_up_date	= gs_convert_date(row[:incident_follow_up_date])
      message.incident_closed	= gs_convert_boolean(row[:incident_closed])
      message.incident_charge = gs_convert_boolean(row[:incident_charge])

      # Link up to Contacts
      message.contact = Contact.find_by_cid(row[:cid])

      message.save
    end
  end
end
