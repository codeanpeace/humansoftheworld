module ApplicationHelper

  def viewer
    html = "<h3 id='name'><a href=#{@page.link}>#{@page.name}</a>"
    html += "<h5 id='about'>#{@page.about}"
    html += "<div id='cover-source'><a href=#{@page.cover_source}><img src=#{@page.cover_source}</a></div>"
    html += "<p id='description'>#{@page.description}</p>"
    html += "<p id='created-updated'>Created On #{@page.created_at} | Updated At #{@page.updated_at}</p>"
    html += "<p id='talking_about_count>Talking About Count: #{@page.talking_about_count}</p>"
    html += "<p id='likes'>Likes: #{@page.likes}</p>"
  end

end

