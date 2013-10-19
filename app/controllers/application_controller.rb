class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :koala

  def koala
    @oauth = Koala::Facebook::OAuth.new(ENV['FB_ID'], ENV['FB_SECRET'], root_url)
    @graph = Koala::Facebook::API.new(@oauth.get_app_access_token)
  end

end
