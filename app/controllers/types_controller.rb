class TypesController < ApplicationController
  before_action :set_type, only: [:destroy]
  skip_before_action :authorize_request, only: :index

  # GET /types
  def index
    @types = Type.all
    json_response(@types)
  end

  # GET /types/stroll
  def index_stroll
    @types = current_stroll.types
    json_response(@types)
  end

  # POST /types/stroll
  def create
    type = Type.find(type_params[:id])
    @types = current_stroll.types.push(type)
    json_response(@types)
  end

  def createType
    type = Type.create!(type_params)
    json_response(type, :created)
  end

  # DELETE /types/stroll
  def destroy
    @types = current_stroll.types.destroy(@type)
    response = { message: Message.entry_deleted }
    json_response(response)
  end

  def deleteType
    Type.destroy(params[:id])
    head :no_content
  end

  private

  def type_params
    # whitelist params
    params.permit(:id, :name, :color, :description)
  end

  def set_type
    @type = current_stroll.types.find(params[:id])
  end
end
