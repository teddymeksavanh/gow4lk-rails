# app/controllers/strolls_controller.rb
class StrollsController < ApplicationController
    before_action :set_stroll, only: [:show, :update, :destroy]
  
    # GET /strolls
    def index
      @strolls = current_user.strolls
      json_response(@strolls)
    end

    def strollsAll
      @strolls = Stroll.unscoped.all
      json_response(@strolls.order("RANDOM()"))
    end

    # def strollsAllAdmin
    #   @strolls = Stroll.unscoped.all
    #   json_response(@strolls.order("RANDOM()"))
    # end
  
    # POST /strolls
    def create
      @stroll = current_user.strolls.create!(stroll_params)
      json_response(@stroll, :created)
    end
  
    # GET /strolls/:id
    def show
      json_response(@stroll)
    end
  
    # PUT /strolls/:id
    def update
      @stroll.update(stroll_params)
      head :no_content
    end
  
    # DELETE /strolls/:id
    def destroy
      @stroll.destroy
      head :no_content
    end
  
    private
  
        def stroll_params
          # whitelist params
          params.permit(
              :name,
              :description,
              :created_date,
              :length,
              :city,
              :country,
              :latitude,
              :longitude,
              :gallery,
              :is_active
          )
        end
    
        def set_stroll
          @stroll = Stroll.find(params[:id])
        end
end