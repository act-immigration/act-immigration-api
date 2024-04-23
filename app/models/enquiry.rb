class Enquiry < ApplicationRecord
  belongs_to :contact_info
  has_many_attached :documents
end
