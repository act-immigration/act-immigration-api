class AppointmentsController < ApplicationController
  before_action :set_appointment, only: %i[show update destroy]
  # GET /appointments
  def index
    @appointments = Appointment.all
    render json: @appointments
  end

  # GET /appointments/1
  def show
    render json: @appointment
  end

  # POST /appointments
  # POST /appointments
def create
  # Find or create a ContactInfo based on the email
  contact_info = ContactInfo.find_or_create_by(email: params[:appointment][:contact_info][:email]) do |contact|
    contact.name = params[:appointment][:contact_info][:name]
    contact.surname = params[:appointment][:contact_info][:surname]
    contact.phonenumber = params[:appointment][:contact_info][:phonenumber]
  end

  # Build the appointment with the provided parameters and associate it with the contact_info
  @appointment = contact_info.appointments.new(appointment_params)

  if @appointment.save
    render json: @appointment, status: :created, location: @appointment
  else
    render json: @appointment.errors, status: :unprocessable_entity
  end
end

  # PATCH/PUT /appointments/1
  def update
    if @appointment.update(appointment_params)
      render json: @appointment
    else
      render json: @appointment.errors, status: :unprocessable_entity
    end
  end

  # DELETE /appointments/1
  def destroy
    @appointment.destroy!
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_appointment
    @appointment = Appointment.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def appointment_params
    params.require(:appointment).permit(:appointmentDate, :serviceType, :appointmentType, :venue, :name, :surname, :phonenumber, :email)
  end
end
