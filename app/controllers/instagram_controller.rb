class InstagramController < ApplicationController

  def create
    p "got to create!"
    client = Instagram.client(:access_token => ENV['INSTAGRAM_ACCESS_TOKEN'])
    @media = client.user_recent_media
    media_urls = []
    @media.each do | media |
      media_urls << media.images.low_resolution.url
    end
    respond_to do |format|
      format.html { render "index/index" }
      format.json { render json: { urls: media_urls , username: @media.first.user.username } }
      end
  end

  private
end
