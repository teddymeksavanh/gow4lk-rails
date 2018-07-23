# app/controllers/types_controller.rb
class TypesController < ApplicationController
    before_action :set_stroll
    before_action :set_stroll_type, only: [:show, :update, :destroy]

    # GET /strolls/:stroll_id/types
    def index
      json_response(@stroll.types.all)
    end

  
    # GET /strolls/:stroll_id/types/:id
    def show
      json_response(@type)
    end
  
    # POST /strolls/:stroll_id/types
    def create
      type = @stroll.types.create!(type_params)
      # currentU = current_user.types.create!(type_params)
      # type.typeed_by = current_user.id
      # puts params.inspect
      json_response(type, :created)
    end
  
    # PUT /strolls/:stroll_id/types/:id
    def update
      @type.update(type_params)
      head :no_content
    end
  
    # DELETE /strolls/:stroll_id/types/:id
    def destroy
      # puts 'EARPKAEORKZOAKRAO'
      # puts @stroll.types.inspect
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

  # getTypes(strollId: number) {
  #   return this.api.get(`strolls/${strollId}/types`);
  # }

  # getAllTypes() {
  #   return this.api.get(`types`);
  # }

  # addType(type) {
  #   return this.api.post(`types`, type);
  # }

  # deleteType(strollId: number, typeId: number) {
  #   return this.api.delete(`types/${typeId}`);
  # }