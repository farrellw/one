class WeatherController < ApplicationController
  require 'open_weather'

  def create
    p "In weather controller"
    weather = Weather.new(weather_params)
    options = { APPID: ENV['OPEN_WEATHER_TOKEN']}
    @conditions = OpenWeather::Current.city("#{weather.city}, #{weather.state}", options)
    p @conditions
    # if params[:song][:name].length < 1
    #   @song = Song.new(name: "Sorry")
    # else
    #   @song = Song.new(song_params)
    # end
    # @track = RSpotify::Track.search(@song.name).first
    # @song.preview_url = @track.preview_url
    # @song.artist = @track.artists.first.name
    # respond_to do |format|
    #   if @song.save
    #     format.html { render "index/index" }
    #     format.json { render json: { url: @song.preview_url , name: @song.name, artist: @song.artist } }
    respond_to do |format|
      format.html { render "index/index" }
      format.json { render json: { urls: media_urls , username: @media.first.user.username } }
      end
  end

  private
    def weather_params
      params.require(:weathers).permit(:state, :city)
    end


end
