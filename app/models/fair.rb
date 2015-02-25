class Fair < ActiveRecord::Base
  has_many :contacts
  has_many :serial_numbers
  has_many :activations, through: :serial_numbers
  has_many :messages, through: :contacts

  def fair_time_month_name
    return Date::MONTHNAMES[fair_time] if fair_time.present?
  end
end
