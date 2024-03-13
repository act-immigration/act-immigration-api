class AddContactInfoToEnquiries < ActiveRecord::Migration[7.1]
  def change
    add_reference :enquiries, :contact_info, null: false, foreign_key: true
  end
end
