class WeatherController < ApplicationController
  require 'open_weather'

  def create
    weather = Weather.new(weather_params)
    options = { APPID: ENV['OPEN_WEATHER_TOKEN']}
    @conditions = OpenWeather::Current.city("#{weather.city}, #{weather.state}", options)
    @description = @conditions['weather'].first['description']
    @temperature = ((@conditions['main']['temp'] * 9 / 5) - 459).round(2)
    @city = weather.city
    respond_to do |format|
      format.html { render "index/index" }
      format.json { render json: { description: @description, temperature: @temperature, city: @city } }
      end
  end

  private
    def weather_params
      params.require(:weathers).permit(:state, :city)
    end


end
