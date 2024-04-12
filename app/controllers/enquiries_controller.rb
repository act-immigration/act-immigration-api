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
      @enquiries = Enquiry.where(email: params[:email])
      render json: @enquiries
    else
      @enquiry = Enquiry.find(params[:id])
      if @enquiry.document.attached?
      render json: @enquiry.as_json.merge(document_url: url_for(@document.document))
    else
      render json: @document_url.as_json.merge(document_url: nil)
    end
  end
  end

  # POST /enquiries
  def create
    # Find or create a ContactInfo based on the email
    contact_info = ContactInfo.find_or_create_by(email: params[:enquiry][:email]) do |contact|
      contact.name = params[:enquiry][:name]
      contact.surname = params[:enquiry][:surname]
      contact.phonenumber = params[:enquiry][:phonenumber]
    end
    # Build the enquiry with the provided parameters and associate it with the contact_info
    @enquiry = contact_info.enquiries.new(enquiry_params.except(:document_upload))

    # Handle file upload
    @enquiry.document_upload.attach(enquiry_params[:document_upload]) if enquiry_params[:document_upload].present?

    if @enquiry.save
      render json: @enquiry, status: :created, location: @enquiry
    else
      render json: @enquiry.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /enquiries/1
  def update
    if @enquiry.update(enquiry_params)
      render json: @enquiry
    else
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

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_enquiry
    @enquiry = Enquiry.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def enquiry_params
    params.require(:enquiry).permit(:name, :surname, :phonenumber, :email, :gender, :dob, :maritalStatus, :residentialAddress, :immigrationStatus, :entryDate, :passportNumber, :referenceNumber,
                                    :serviceType, :elaborate, :document_upload)
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
      render json: documents
    else
      render json: { error: 'User not found' }, status: :not_found
    end
  end
end
