#!/usr/bin/ruby

require 'rubygems'
gem 'google-api-client', '>0.7'
require 'google/api_client'
require 'trollop'
require 'launchy'
# Set DEVELOPER_KEY to the API key value from the APIs & auth > Credentials
# tab of
# {{ Google Cloud Console }} <{{ https://cloud.google.com/console }}>
# Please ensure that you have enabled the YouTube Data API for your project.
DEVELOPER_KEY = 'AIzaSyCe6n0L2EubR31ImDpMQi2jf-B5N2awVjg'
YOUTUBE_API_SERVICE_NAME = 'youtube'
YOUTUBE_API_VERSION = 'v3'

def get_service
  client = Google::APIClient.new(
    :key => DEVELOPER_KEY,
    :authorization => nil,
    :application_name => $PROGRAM_NAME,
    :application_version => '1.0.0'
  )
  youtube = client.discovered_api(YOUTUBE_API_SERVICE_NAME, YOUTUBE_API_VERSION)

  return client, youtube
end

def main
  opts = Trollop::options do
    opt :q, 'Search term', :type => String, :default => 'Karaoke Song'
    opt :max_results, 'Max results', :type => :int, :default => 5
  end

  client, youtube = get_service

  begin
    # Call the search.list method to retrieve results matching the specified
    # query term.
    search_response = client.execute!(
      :api_method => youtube.search.list,
      :parameters => {
        :part => 'snippet',
        :q => opts[:q],
        :maxResults => opts[:max_results]
      }
    )

    videos = []
    

    # Add each result to the appropriate list, and then display the lists of
    # matching videos, channels, and playlists.
    search_response.data.items.each do |search_result|
      case search_result.id.kind
        when 'youtube#video'
          videos << "#{search_result.snippet.title} (#{search_result.id.videoId})"
      end
    end

     returned_video = videos[0].split("(").last
     video_id_string = returned_video.delete(")")
    Launchy.open("http://www.youtube.com/watch?v=#{video_id_string}")
    #puts videos[0]
   
  rescue Google::APIClient::TransmissionError => e
    puts e.result.body
  end
end

main
