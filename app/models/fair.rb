class Fair < ActiveRecord::Base
  has_many :contacts
  has_many :messages, through: :contacts
end
