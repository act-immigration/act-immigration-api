class EnquiriesController < ApplicationController
  before_action :set_enquiry, only: %i[show update destroy]
  # GET /enquiries
  def index
    @enquiries = Enquiry.all

    render json: @enquiries
  end

  # GET /enquiries/1
  def show
    render json: @enquiry
  end

  # POST /enquiries
  def create
    # Parse the contact_info parameter from JSON string to a Ruby hash
    contact_info_data = JSON.parse(params[:enquiry][:contact_info])
    # Check if the contact_info exists or create a new one
    contact_info = ContactInfo.find_or_create_by(contact_info_data)
    # Set the user_id to nil if there is no logged-in user
    user_id = current_user ? current_user.id : nil
    # Associate the enquiry with the contact_info and set the user_id
    @enquiry = contact_info.enquiries.new(enquiry_params.except(:document_upload).merge(user_id:))
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
end

# def show_by_email
#   # Find the ContactInfo associated with the current user's email
#   contact_info = ContactInfo.find_by(email: current_user.email)

#   # If the ContactInfo exists, fetch all enquiries associated with it
#   if contact_info
#     @enquiries = contact_info.enquiries
#     render json: @enquiries
#   else
#     render json: { error: 'No enquiries found for this email' }, status: :not_found
#   end
#  end
