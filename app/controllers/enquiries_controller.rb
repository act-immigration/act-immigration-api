class EnquiriesController < ApplicationController
  before_action :set_enquiry, only: %i[ show update destroy ]

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
    @enquiry = Enquiry.new(enquiry_params)

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
      params.require(:enquiry).permit(:name, :surname, :phonenumber, :email, :gender, :dob, :marital_status, :residential_address, :immigration_status, :entry_date, :passport_number, :reference_number, :service_type, :elaborate)
    end
end
