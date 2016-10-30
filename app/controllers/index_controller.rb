class IndexController < ApplicationController
  def index
    # client = Instagram.client(:access_token => ENV['INSTAGRAM_ACCESS_TOKEN'])
    # @media = client.user_recent_media
  end

  def instagram
    # p "In the instagram method"
    # redirect_to Instagram.authorize_url(:redirect_uri => "http://localhost:3000/oauth/callback/")
    # redirect_to 'https://api.instagram.com/oauth/authorize?client_id=' + "#{ENV['INSTAGRAM_CLIENT_ID']}" + '&redirect_uri=http://localhost:3000&response_type=token'
  end

  # def create_instagram
  #   response = Instagram.get_access_token(params[:code], :redirect_uri => "http://localhost:3000/oauth/callback/")
  #   session[:access_token] = response.access_token
  #   render "index/index"
  # end



end
