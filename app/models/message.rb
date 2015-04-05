class Message < ActiveRecord::Base

  belongs_to :contact
  has_one :fair, through: :contact
  scope :sorted, -> { order('incident_date desc') }

  after_create :set_cid

  INCIDENT_TYPES = [
    ["Misc.", 0],
    ["Urgent Care", 1],
    ["Online Entries", 2],
    ["Sales", 3],
    ["Service Renew", 4],
  ]

  def incident_type_string
    if incident_type
      INCIDENT_TYPES.select{ |i| i[1] == incident_type}[0][0]
    end
  end

  def set_cid
    self.update_attribute(:cid, self.contact.cid) if self.contact
  end

end
