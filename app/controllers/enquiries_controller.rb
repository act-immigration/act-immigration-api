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
  # POST /enquiries
  def create
    # Check if the contact_info exists or create a new one
    contact_info = ContactInfo.find_or_create_by(contact_info_params)

    # Associate the enquiry with the contact_info
    @enquiry = contact_info.enquiries.new(enquiry_params)

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

  def contact_info_params
    params.require(:contact_info).permit(:name, :surname, :phonenumber, :email)
  end
end
