class Page < ActiveRecord::Base
  attr_accessible :about, :cover_source, :description, :fb_id, :likes, :link, :name, :talking_about_count, :place, :address, :latitude, :longitude

  has_many :photos

  geocoded_by :place
  reverse_geocoded_by :latitude, :longitude

  after_validation :geocode, :reverse_geocode
end
