class CreateEnquiries < ActiveRecord::Migration[7.1]
  def change
    create_table :enquiries do |t|
      t.string :name
      t.string :surname
      t.string :phonenumber
      t.string :email
      t.string :gender
      t.date :dob
      t.string :marital_status
      t.text :residential_address
      t.string :immigration_status
      t.date :entry_date
      t.string :passport_number
      t.string :reference_number
      t.string :service_type
      t.text :elaborate

      t.timestamps
    end
  end
end
