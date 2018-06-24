# app/controllers/types_controller.rb
class TypesController < ApplicationController
    before_action :set_stroll
    before_action :set_stroll_type, only: [:show, :update, :destroy]
  
    # GET /strolls/:stroll_id/types
    def index
      json_response(@stroll.types)
    end
  
    # GET /strolls/:stroll_id/types/:id
    def show
      json_response(@type)
    end
  
    # POST /strolls/:stroll_id/types
    def create
      @stroll.types.create!(type_params)
      json_response(@stroll, :created)
    end
  
    # PUT /strolls/:stroll_id/types/:id
    def update
      @type.update(type_params)
      head :no_content
    end
  
    # DELETE /strolls/:stroll_id/types/:id
    def destroy
      @type.destroy
      head :no_content
    end
  
    private
  
    def type_params
      params.permit(
        :name,
        :description,
        :color
      )
    end
  
    def set_stroll
      @stroll = Stroll.find(params[:stroll_id])
    end
  
    def set_stroll_type
      @type = @stroll.types.find_by!(id: params[:id]) if @stroll
    end
  end