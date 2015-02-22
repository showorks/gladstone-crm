class Contact < ActiveRecord::Base
  belongs_to :fair
  has_many :messages
  scope :sorted, -> { order('contact_last_edited desc') }

  def contact_phone_numbers
    return [contact_phone_1, contact_phone_2, contact_phone_cell].reject! { |c| c.blank? }
  end

  def contact_full_address
    return [contact_address, "#{contact_city} #{contact_state} #{contact_zip_code}", contact_country == "US" ? nil : contact_country].reject! { |c| c.blank? }
  end

end
