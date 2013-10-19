class MainController < ApplicationController
  include MainHelper

  def main
    gon.pages = Page.all.map(&:attributes)
    # apples.cool
  end

end
