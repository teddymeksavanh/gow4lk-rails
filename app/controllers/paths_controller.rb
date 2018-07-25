# app/controllers/paths_controller.rb
class PathsController < ApplicationController
    before_action :set_stroll
    before_action :set_stroll_path, only: [:show, :update, :destroy]
  
    # GET /strolls/:stroll_id/paths
    def index
      json_response(@stroll.paths.order('id ASC').all)
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
      json_response(@path)
    end
  
    # DELETE /strolls/:stroll_id/paths/:id
    def destroy
      # puts 'EARPKAEORKZOAKRAO'
      # puts @stroll.paths.inspect
      @path.destroy
      head :no_content
    end

    def deleteAllPaths
      @allPath = @stroll.paths
      @allPath.destroy
      head :no_content
    end
  
    private
  
    def path_params
      params.permit(
        :name,
        :longitude,
        :latitude,
        :description,
        :photo,
        :photo_seed
      )
    end
  
    def set_stroll
      @stroll = Stroll.find(params[:stroll_id])
    end
  
    def set_stroll_path
      @path = @stroll.paths.find_by!(id: params[:id]) if @stroll
    end
  end