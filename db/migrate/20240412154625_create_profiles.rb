class CreateProfiles < ActiveRecord::Migration[7.1]
  def change
    create_table :profiles do |t|
      t.references :user, null: false, foreign_key: true
      t.string :name
      t.string :surname
      t.string :passport_number
      t.string :immigration_status
      t.string :residential_address
      t.string :age

      t.timestamps
    end
  end
end
