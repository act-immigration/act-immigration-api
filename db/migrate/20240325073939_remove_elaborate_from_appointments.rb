class RemoveElaborateFromAppointments < ActiveRecord::Migration[7.1]
  def change
    remove_column :appointments, :elaborate, :string
  end
end
