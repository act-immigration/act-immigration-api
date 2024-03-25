class AddAppointmentTypeToAppointments < ActiveRecord::Migration[7.1]
  def change
    add_column :appointments, :appointmentType, :string
  end
end
