class AddDocumentUploadToEnquiries < ActiveRecord::Migration[7.1]
  def change
    add_column :enquiries, :document_upload, :string
  end
end
