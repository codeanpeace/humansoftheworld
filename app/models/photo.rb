class Photo < ActiveRecord::Base
  attr_accessible :created_time, :fb_id, :latitude, :likes_count, :link, :longitude, :picture, :page_id

  belongs_to :page

  delegate :latitude, to: :page
  delegate :longitude, to: :page
end
