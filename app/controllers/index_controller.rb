class IndexController < ApplicationController
  def index
    @track = RSpotify::Track.search('Bad, Bad Leroy Brown').first
  end
end
