class Contact < ActiveRecord::Base
  belongs_to :fair
  has_many :messages, dependent: :destroy

  scope :sorted, -> { order('cid IS NULL DESC, sync, contact_active desc, contact_name') }
  scope :to_sync, -> { where(sync: true) }

  records_with_operator_on :create, :update
  before_create :set_fid
  after_save :update_sync

  def to_s
    contact_name
  end

  def contact_phone_numbers
    return [contact_phone_1, contact_phone_2, contact_phone_cell].reject &:blank?
  end

  def contact_full_address
    return [contact_address, "#{contact_city} #{contact_state} #{contact_zip_code}", contact_country == "US" ? nil : contact_country].reject! { |c| c.blank? }
  end

  def set_fid
    self.fid = self.fair.fid if self.fair
  end

  def update_sync
    self.update_column(:sync, true) unless self.sync?
  end

end
