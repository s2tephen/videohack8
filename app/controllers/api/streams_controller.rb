class Api::StreamsController < ApplicationController
  def search
    search_terms = params[:q]
    videos = YoutubeClient.videos_by(:query => search_terms, :eventType => "live", :type => "video")
    #make call to youtube API
    #return results as JSON
    render json: videos
  end
end
