class EnquiriesController < ApplicationController
  before_action :set_enquiry, only: %i[show update destroy]
  # GET /enquiries
  def index
    @enquiries = Enquiry.all
    render json: @enquiries
  end

  # GET /enquiries/1
  def show
    if params[:id] == 'by_email'
      contact_info = ContactInfo.find_by(email: params[:email])
      if contact_info
        @enquiries = contact_info.enquiries
        render json: @enquiries.as_json(include: { documents: { only: [:file_path] } })
      else
        render json: { error: 'No enquiries found for this email' }, status: :not_found
      end
    else
      @enquiry = Enquiry.find(params[:id])
      if @enquiry.documents.attached?
        render json: @enquiry.as_json(include: { documents: { only: [:file_path] } })
      else
        render json: @enquiry
      end
    end
  end

  # POST /enquiries
  def create
  puts "Received params: #{params.inspect}"
  contact_info_params = JSON.parse(params[:enquiry].delete(:contact_info))
  document_uploads = params[:enquiry].delete(:documentUpload)

  # Find or create a ContactInfo based on the email
  contact_info = ContactInfo.find_or_create_by(email: contact_info_params["email"]) do |contact|
    contact.name = contact_info_params["name"]
    contact.surname = contact_info_params["surname"]
    contact.phonenumber = contact_info_params["phonenumber"]
  end

  @enquiry = contact_info.enquiries.new(enquiry_params)

  # Save @enquiry before attaching files
  if @enquiry.save
    # Attach uploaded files to the enquiry
    if document_uploads.present?
      document_uploads.each do |file|
        # Get the file's IO stream and original filename
        io = file.tempfile
        filename = file.original_filename

        # Create an ActiveStorage attachment and associate it with the enquiry
        @enquiry.documents.attach(io: io, filename: filename)

        # Log the attachment
        Rails.logger.info "Document attached: #{filename}"
      end
    else
      Rails.logger.info "No documents to attach"
    end

    render json: @enquiry, status: :created, location: @enquiry
  else
    Rails.logger.info "Enquiry not saved: #{@enquiry.errors.full_messages.join(', ')}"
    render json: @enquiry.errors, status: :unprocessable_entity
  end
  end

  # DELETE /enquiries/1
  def destroy
    @enquiry.destroy!
  end

  def by_email
    @enquiries = Enquiry.where(email: params[:email])
    render json: @enquiries
  end

  def contact_info
    # Find the ContactInfo associated with the provided email
    contact_info = ContactInfo.find_by(email: params[:email])
    # If the ContactInfo exists, fetch all enquiries associated with it
    if contact_info
      @enquiries = contact_info.enquiries
      render json: @enquiries
    else
      render json: { error: 'No enquiries found for this email' }, status: :not_found
    end
  end

  def upload
    # Extract document upload parameters from the request
    document_params = params.require(:enquiry).permit(document_upload: [])
    # Create a new document object from file upload
    document = Document.new(document_params)
    # Save the document to the database on upload
    if document.save
      render json: { message: 'Document uploaded successfully' }, status: :ok
    else
      render json: { error: 'Failed to upload document' }, status: :unprocessable_entity
    end
  end

  def update
    @enquiry = Enquiry.find(params[:id])

    if @enquiry.update(enquiry_params)
      render json: @enquiry
    else
      render json: @enquiry.errors, status: :unprocessable_entity
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_enquiry
    @enquiry = Enquiry.find(params[:id])
  end

  def enquiry_with_documents(enquiry)
    if enquiry&.document_upload&.attached?
      redirect_to rails_blob_path(enquiry.document_upload, disposition: 'attachment')
    elsif enquiry
      render json: { error: 'Document not found for this enquiry' }, status: :not_found
    else
      render json: { error: 'Enquiry not found' }, status: :not_found
    end
  end

  def documents_by_email
    user = User.find_by(email: params[:email])
    if user
      documents = Document.where(user_id: user.id)
      documents = rails_blob_path(user.documents, only_path: true) if user.documents.attached?
      render json: documents
    else
      render json: { error: 'User not found' }, status: :not_found
    end
  end

  # Only allow a list of trusted parameters through.
  def enquiry_params
    params.require(:enquiry).permit(:name, :surname, :phonenumber, :email, :gender, :dob, :maritalStatus, :residentialAddress, :immigrationStatus, :entryDate, :passportNumber, :referenceNumber,
                                    :serviceType, :elaborate, :contact_info, document_upload: [])
  end
end
