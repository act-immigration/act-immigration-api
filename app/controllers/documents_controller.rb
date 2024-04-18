# app/controllers/documents_controller.rb

class DocumentsController < ApplicationController
  before_action :document, only: %i[show update destroy]

  def index
    @documents = Document.all.map do |document|
      {
        id: document.id,
        url: rails_blob_url(document.file)
      }
    end

    render json: @documents
  end

  def show
    @document = Document.find(params[:id])
  end

  def update
    @document.update(document_params)
  end

  def destroy
    @document.destroy
  end

  def upload_document
    puts "Current User: #{current_user.inspect}" # Debugging statement
    uploaded_file = params[:file]
    @document = Document.new(file_path: uploaded_file)

    if @document.save
    render json: @document, status: :created
    else
    render json: @document.errors, status: :unprocessable_entity
    end
  end

  def upload
  @document = Document.new(document_params)

  if @document.save
    render json: @document, status: :created
  else
    render json: @document.errors, status: :unprocessable_entity
  end
  end

  def documents_by_email
    email = params[:email]
    @documents = Document.where(user_email: email)

    if @documents.empty?
      render json: { message: 'No documents found' }, status: :not_found
    else
      # Retrieve URLs for documents
      @document_urls = @documents.map { |document| rails_blob_url(document.file_path) }
      render json: @document_urls
    end
  end

  private

  def document_params
   params.permit(:file)
  end

  def document
    @document = Document.find(params[:id])
  end
end
