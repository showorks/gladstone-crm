class Activation < ActiveRecord::Base
  belongs_to :serial_number

  scope :sorted, ->{ joins(:serial_number).order('serial_numbers.issue_date desc') }
end
