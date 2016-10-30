class SongsController < ApplicationController

  def create
    @song = Song.new(song_params)
    @track = RSpotify::Track.search(@song.name).first
    @song.preview_url = @track.preview_url
    @song.artist = @track.artists.first.name
    respond_to do |format|
      if @song.save
        p "In song save"
        # render "index/index"
        format.html { render "index/index" }
        format.json { render json: { url: @song.preview_url , name: @song.name } }
      else
        @errors = ["Sorry couldn't find that song!"]
        redirect_to root_path
      end
    end
  end

  private
    def song_params
      params.require(:song).permit(:name)
    end


end
