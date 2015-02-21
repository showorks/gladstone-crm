json.array!(@messages) do |message|
  json.extract! message, :id, :iid, :cid, :incident_date, :incident_type, :incident_memo, :incident_follow_up_date, :incident_closed, :incident_charge
  json.url message_url(message, format: :json)
end
