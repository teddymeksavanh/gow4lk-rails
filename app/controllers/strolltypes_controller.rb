class StrolltypesController < ApplicationController
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
      # language = Language.find(language_params[:id])
      # @languages = current_user.languages.push(language)
      # json_response(@languages)
      # typeModel = Type.find(strolltype_params[:type_id])
      # respo = @stroll.strolltypes.push(strolltype_params)
      # currentU = current_user.types.create!(type_params)
      # type.typeed_by = current_user.id
      # puts params.inspect
      # strolltype = @strollStrolltype.create(strolltype_params)
      # json_response(strolltype)
      strolltype = @stroll.strolltypes.create!(strolltype_params)
      json_response(strolltype, :created)
    end
  
    # PUT /strolls/:stroll_id/types/:id
    def update
      @type.update(strolltype_params)
      head :no_content
    end
  
    # DELETE /strolls/:stroll_id/types/:id
    def destroy
      # puts 'EARPKAEORKZOAKRAO'
      # puts @stroll.types.inspect
      @type.destroy
      head :no_content
    end

    # def deleteAlltypes
    #   @alltype = @stroll.types
    #   @alltype.destroy
    #   head :no_content
    # end
  
    private
  
    def strolltype_params
      params.permit(
        :type_id
      )
    end
  
    def set_stroll
      @stroll = Stroll.find(params[:stroll_id])
    end
  
    def set_stroll_type
      @type = @stroll.strolltypes.find_by!(id: params[:id]) if @stroll
    end
end
