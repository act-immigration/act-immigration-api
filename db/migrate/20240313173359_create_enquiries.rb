class CreateEnquiries < ActiveRecord::Migration[7.1]
  def change
    create_table :enquiries do |t|
      t.string :name
      t.string :surname
      t.string :phonenumber
      t.string :email
      t.string :gender
      t.date :dob
      t.string :maritalStatus
      t.string :residentialAddress
      t.string :immigrationStatus
      t.date :entryDate
      t.string :passportNumber
      t.string :referenceNumber
      t.string :serviceType
      t.string :elaborate

      t.timestamps
    end
  end
end
