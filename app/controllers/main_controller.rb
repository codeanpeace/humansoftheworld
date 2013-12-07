class MainController < ApplicationController
  include MainHelper

  def main
    gon.pages = Page.all.map(&:attributes)
    # apples.cool
  end

  def ajax_page
    @page = Page.where(name: params[:name]).first
    @photos = @page.photos
    render partial: 'ajax_page', locals: {page: @page, photos: @photos}, layout: false
    # respond_to do |format|
    #  format.html
    #  format.js
    # end

    # respond_to do |format|
    #   format.js do
    #     render json: {
    #       page: @page.to_json,
    #       photos: @photos.to_json
    #     }
    #   end
    # end
  end

  def ajax_photos
    @page = Page.where(name: params[:name]).first
    @photos = @page.photos
    render partial: 'ajax_photos', locals: {page: @page, photos: @photos}, layout: false
  end

end
