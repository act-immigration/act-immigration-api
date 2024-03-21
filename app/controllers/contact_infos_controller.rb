class ContactInfosController < ApplicationController
  before_action :set_contact_info, only: %i[show update destroy]

  # GET /contact_infos
  def index
    @contact_infos = ContactInfo.all

    render json: @contact_infos
  end

  # GET /contact_infos/1
  def show
    render json: @contact_info
  end

  # POST /contact_infos
  def create
    @contact_info = ContactInfo.new(contact_info_params)

    if @contact_info.save
      render json: @contact_info, status: :created, location: @contact_info
    else
      render json: @contact_info.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /contact_infos/1
  def update
    if @contact_info.update(contact_info_params)
      render json: @contact_info
    else
      render json: @contact_info.errors, status: :unprocessable_entity
    end
  end

  # DELETE /contact_infos/1
  def destroy
    @contact_info.destroy!
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_contact_info
    @contact_info = ContactInfo.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def contact_info_params
    params.require(:contact_info).permit(:name, :surname, :phonenumber, :email)
  end
end
