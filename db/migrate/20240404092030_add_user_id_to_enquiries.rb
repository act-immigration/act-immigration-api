class AddUserIdToEnquiries < ActiveRecord::Migration[7.1]
  def change
    add_reference :enquiries, :user, null: true, foreign_key: true
  end
end
