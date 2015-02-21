class Contact < ActiveRecord::Base
  belongs_to :fair
  has_many :messages
end
