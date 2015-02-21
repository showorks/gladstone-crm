class Message < ActiveRecord::Base
  belongs_to :contact

  scope :sorted, -> { order('incident_date desc') }
end
