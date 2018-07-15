class NotesController < ApplicationController
    before_action :set_stroll
    before_action :set_stroll_note, only: [:show, :update, :destroy]
  
    # GET /strolls/:stroll_id/notes
    def index
      json_response(@stroll.notes.all)
    end
  
    # GET /strolls/:stroll_id/notes/:id
    def show
      json_response(@note)
    end
  
    # POST /strolls/:stroll_id/notes
    def create
      @stroll.notes.create!(note_params)
      json_response(@stroll, :created)
    end
  
    # PUT /strolls/:stroll_id/notes/:id
    def update
      @note.update(note_params)
      head :no_content
    end
  
    # DELETE /strolls/:stroll_id/notes/:id
    def destroy
      # puts 'EARPKAEORKZOAKRAO'
      # puts @stroll.notes.inspect
      @note.destroy
      head :no_content
    end

    def deleteAllnotes
      @allnote = @stroll.notes
      @allnote.destroy
      head :no_content
    end
  
    private
  
    def note_params
      params.permit(
        :description
      )
    end
  
    def set_stroll
      @stroll = Stroll.find(params[:stroll_id])
    end
  
    def set_stroll_note
      @note = @stroll.notes.find_by!(id: params[:id]) if @stroll
    end
end
