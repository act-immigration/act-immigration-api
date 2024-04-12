class CreateDocuments < ActiveRecord::Migration[7.1]
  def change
    create_table :documents do |t|
      t.string :name
      t.string :file_path
      t.datetime :upload_date
      t.references :documentable, polymorphic: true, null: false

      t.timestamps
    end
  end
end
