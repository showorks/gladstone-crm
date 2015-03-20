class ConvertDatesToDateTimes < ActiveRecord::Migration
  def up
    change_column :activations, :activation_date, :datetime
    change_column :activations, :deactivation_date, :datetime


    change_column :contacts, :contact_date_registered, :datetime
    change_column :contacts, :contact_last_edited, :datetime
    change_column :contacts, :contact_date_address_last_active, :datetime
    change_column :contacts, :contact_last_mailed, :datetime
    change_column :contacts, :date_last_emailed_for_service_reminder, :datetime

    change_column :fairs, :old_service_plan_ended, :datetime

    change_column :messages, :incident_date, :datetime
    change_column :messages, :incident_follow_up_date, :datetime

    change_column :serial_numbers, :issue_date, :datetime
  end

  def down
  end
end


















