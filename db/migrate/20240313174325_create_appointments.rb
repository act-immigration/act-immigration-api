class CreateAppointments < ActiveRecord::Migration[7.1]
  def change
    create_table :appointments do |t|
      t.datetime :appointment_date
      t.string :service_type
      t.string :venue
      t.text :elaborate
      t.references :contact_info, null: false, foreign_key: true

      t.timestamps
    end
  end
end
