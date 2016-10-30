class SongsController < ApplicationController

  def create
    @song = Song.new(song_params)
    @track = RSpotify::Track.search(@song.name)
    @song.preview_url = @track.preview_url
    @song.artist = @track.artists.first.name
    respond_to do |format|
      if @song.save
        format.html { render "index/index" }
        format.json { render json: { url: @song.preview_url , name: @song.name, artist: @song.artist } }
      else
        @errors = ["Sorry couldn't find that song!"]
        format.html { redirect_to root_path }
        format.json { render json: { errors: "Sorry, couldn't find that song" } }
      end
    end
  end

  private
    def song_params
      params.require(:song).permit(:name) if params[:song][:name].length > 0
      {name: "Sorry"} if params[:song][:name].length < 1
    end


end
