class SongsController < ApplicationController

  def create
    @song = Song.new(song_params)
    @track = RSpotify::Track.search(@song.name).first
    @song.preview_url = @track.preview_url
    @song.artist = @track.artist
    if @song.save
      render "index/index"
    else
      @errors = ["Sorry couldn't find that song!"]
      redirect_to root_path
    end
  end

  private
    def song_params
      params.require(:song).permit(:name)
    end


end
