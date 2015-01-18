require 'open-uri'
require 'json'

class Api::StreamsController < ApplicationController

  # for example {base_url}/api/streams/search?q=cats
  def search

    search_terms = URI::encode(params[:q])

    base_url = "https://www.googleapis.com/youtube/v3"
    url = "#{base_url}/search?q=#{search_terms}&type=video&eventType=live&key=#{ENV['youtube_api_key']}&part=snippet"
    videos = JSON.parse(open(url).read)
    video_urls = videos["items"].map{|item| "https://www.youtube.com/watch?v=#{item['id']['videoId']}" }


    render json: video_urls.map{ |url| EmbedlyClient.extract(:url => url, :autoplay => true) }
  end
end

