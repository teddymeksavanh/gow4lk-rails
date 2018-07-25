class TypesController < ApplicationController
  before_action :set_type, only: [:show, :update, :destroy]
  # before_action :set_stroll_type, only: [:show, :updateStrollType, :destroy]
  # skip_before_action :authorize_request, only: :index

  # GET /types
  def index
    @types = Type.all
    json_response(@types)
  end

  # # GET /types/stroll
  # def index_stroll
  #   @types = @stroll.types.all
  #   json_response(@types)
  # end

  def show
    json_response(@type)
  end

  # POST /types/stroll
  def update
    @type.update(type_params)
    head :no_content
  end

  # def postStrollType
  #   type = Type.find(type_params[:id])
  #   @types = @stroll.types.push(type)
  #   json_response(@types)
  # end

  def create
    type = Type.create!(type_params)
    json_response(type, :created)
  end

  # DELETE /types/stroll
  def destroy
    @type.destroy
    head :no_content
  end

  # def deleteType
  #   Type.destroy(params[:id])
  #   head :no_content
  # end

  # def deleteStrollType
  #   stroll = Stroll.find(params[:stroll_id])
  #   type = stroll.types.find(params[:id])
  #   type.destroy
  #   head :no_content
  # end

  private

  def type_params
    # whitelist params
    params.permit(:id, :name, :color, :description)
  end

  def set_type
    @type = Type.find(params[:id])
  end

  # def set_stroll_type
  #   @type = @stroll.types.find(params[:id]) if @stroll
  # end
end
