class SerialNumber < ActiveRecord::Base
  belongs_to :fair
  has_many :activations

  scope :sorted, ->{order('issue_date desc')}
end
