class ImportMessagesJob < GladstoneJob
  require 'csv'

  def perform(*args)
    filename_with_path = "#{Rails.root}/tmp/uploads/Incidents.csv"
    messages = []
    contacts = Contact.pluck(:cid, :id) # Load contacts into contacts array so we don't hit the DB each time

    # Import data from CSV
    CSV.foreach(filename_with_path, :headers => true, :header_converters => :symbol, :encoding => 'ISO-8859-1:utf-8') do |row|

      # Look in contacts array for cid and get id
      if row[:cid].present? && contacts.select{ |cid, id| cid == row[:cid].to_i }.size > 0
        contact_id = contacts.select{ |cid, id| cid == row[:cid].to_i }[0][1].to_i
      else
        contact_id = 0
      end

      # Import CSV into messages array
      #Message.create!(
      messages << Message.new(
        iid:                     row[:iid],
        cid:                     row[:cid],
        incident_date:           gs_convert_date(row[:incident_date]),
        incident_type:           row[:incident_type],
        incident_memo:           row[:incident_memo],
        incident_follow_up_date: gs_convert_date(row[:incident_follow_up_date]),
        incident_closed:         gs_convert_boolean(row[:incident_closed]),
        incident_charge:         gs_convert_boolean(row[:incident_charge]),
        contact_id:              contact_id
      )
     Message.import(messages) and messages = [] if messages.size > 49
    end

    # Bulk import messages array
  end
end

