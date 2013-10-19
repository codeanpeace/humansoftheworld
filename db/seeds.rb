@oauth = Koala::Facebook::OAuth.new(ENV['FB_ID'], ENV['FB_SECRET'])

@graph = Koala::Facebook::API.new(@oauth.get_app_access_token)

search = @graph.search('humans of', {type: 'page'})

search = search.next_page

search.delete_if {|results| results['name'][0..9] != 'Humans of ' }

search.each do |result|
  jsonpage = @graph.get_object(result['id'])
  if jsonpage['cover'] != nil
    @page = Page.find_or_create_by_fb_id(
      fb_id: jsonpage['id'],
      about: jsonpage['about'],
      cover_source: jsonpage['cover']['source'],
      description: jsonpage['description'],
      likes: jsonpage['likes'],
      link: jsonpage['link'],
      name: jsonpage['name'],
      talking_about_count: jsonpage['talking_about_count'],
      place: jsonpage['name'][10..-1]
    )
    puts @page
  end
end
