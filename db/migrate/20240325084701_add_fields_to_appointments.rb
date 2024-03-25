class AddFieldsToAppointments < ActiveRecord::Migration[7.1]
  def change
    add_column :appointments, :name, :string
    add_column :appointments, :surname, :string
    add_column :appointments, :phonenumber, :string
    add_column :appointments, :email, :string
  end
end
