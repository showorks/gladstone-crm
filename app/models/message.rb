class Message < ActiveRecord::Base
  belongs_to :contact
  has_one :fair, through: :contact
  has_one :created_by_name, class_name: "User", foreign_key: "id"

  scope :sorted, -> { order('incident_date desc') }
  scope :to_sync, -> { where(sync: true) }

  records_with_operator_on :create, :update
  before_create :set_cid
  after_save :update_sync

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
    self.cid = self.contact.cid if self.contact && self.cid.blank?
  end

  def update_sync
    self.update_column(:sync, true) unless self.sync?
  end

end
