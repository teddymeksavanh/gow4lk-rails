# app/controllers/paths_controller.rb
class PathsController < ApplicationController
    before_action :set_stroll
    before_action :set_stroll_path, only: [:show, :update, :destroy]
  
    # GET /strolls/:stroll_id/paths
    def index
      json_response(@stroll.paths)
    end
  
    # GET /strolls/:stroll_id/paths/:id
    def show
      json_response(@path)
    end
  
    # POST /strolls/:stroll_id/paths
    def create
      @stroll.paths.create!(path_params)
      json_response(@stroll, :created)
    end
  
    # PUT /strolls/:stroll_id/paths/:id
    def update
      @path.update(path_params)
      head :no_content
    end
  
    # DELETE /strolls/:stroll_id/paths/:id
    def destroy
      @path.destroy
      head :no_content
    end
  
    private
  
    def path_params
      params.permit(
        :name,
        :longitude,
        :latitude,
        :description
      )
    end
  
    def set_stroll
      @stroll = Stroll.find(params[:stroll_id])
    end
  
    def set_stroll_path
      @path = @stroll.paths.find_by!(id: params[:id]) if @stroll
    end
  end