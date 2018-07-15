class CommentsController < ApplicationController
    before_action :set_stroll
    before_action :set_stroll_comment, only: [:show, :update, :destroy]
  
    # GET /strolls/:stroll_id/comments
    def index
      json_response(@stroll.comments.all)
    end
  
    # GET /strolls/:stroll_id/comments/:id
    def show
      json_response(@comment)
    end
  
    # POST /strolls/:stroll_id/comments
    def create
      comment = @stroll.comments.create!(comment_params)
      # currentU = current_user.comments.create!(comment_params)
      # comment.commented_by = current_user.id
      puts params.inspect
      json_response(comment, :created)
    end
  
    # PUT /strolls/:stroll_id/comments/:id
    def update
      @comment.update(comment_params)
      head :no_content
    end
  
    # DELETE /strolls/:stroll_id/comments/:id
    def destroy
      # puts 'EARPKAEORKZOAKRAO'
      # puts @stroll.comments.inspect
      @comment.destroy
      head :no_content
    end

    def deleteAllcomments
      @allcomment = @stroll.comments
      @allcomment.destroy
      head :no_content
    end
  
    private
  
    def comment_params
      params.permit(
        :description,
        :created_by
      )
    end
  
    def set_stroll
      @stroll = Stroll.find(params[:stroll_id])
    end
  
    def set_stroll_comment
      @comment = @stroll.comments.find_by!(id: params[:id]) if @stroll
    end
end
