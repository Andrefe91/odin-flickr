class FlickrPhotosController < ApplicationController
  require 'flickr'

  def index
    @photos = []
    @flickr = Flickr.new
    @photos = @flickr.people.getPublicPhotos(user_id: "200153722@N03")
  end
end
