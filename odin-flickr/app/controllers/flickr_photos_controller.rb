class FlickrPhotosController < ApplicationController
  before_action :initiate_flickr
  require 'flickr'

  def index
    begin #Necessary in case the user is not found
      @photos_json = @flickr.people.getPublicPhotos(user_id: params[:user_id]) unless params[:user_id].nil?
      process_links
    rescue => e
      flash.alert = "User Not Found... Sorry. Check and try again"
    end
  end

  private

  def initiate_flickr
    @photos_json = []
    @photos = []
    @flickr = Flickr.new
  end

  def process_links #Here we construct the url link for each of the photos
    @photos = @photos_json.map {|photo| "https://live.staticflickr.com/#{photo["server"]}/#{photo["id"]}_#{photo["secret"]}.jpg"}
  end
end
