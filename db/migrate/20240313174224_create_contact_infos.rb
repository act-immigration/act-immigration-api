class CreateContactInfos < ActiveRecord::Migration[7.1]
  def change
    create_table :contact_infos do |t|
      t.string :name
      t.string :surname
      t.string :phonenumber
      t.string :email

      t.timestamps
    end
  end
end
