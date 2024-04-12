class AddUserEmailToDocuments < ActiveRecord::Migration[7.1]
  def change
    add_column :documents, :user_email, :string
  end
end
