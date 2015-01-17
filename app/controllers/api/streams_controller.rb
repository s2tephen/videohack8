require 'open-uri'
require 'json'

class Api::StreamsController < ApplicationController
  def search
    # search_terms = params[:q]
    # videos = YoutubeClient.videos_by(:query => search_terms, :event_type => "live", :type => "video")
    # #make call to youtube API
    # #return results as JSON

    search_terms = URI::encode(params[:q])

    base_url = "https://www.googleapis.com/youtube/v3"
    url = "#{base_url}/search?part=snippet&q=#{search_terms}&type=video&eventType=live&key=#{ENV['youtube_api_key']}"
    videos = open(url).read

    render json: JSON.parse(videos)
  end
end

