@oauth = Koala::Facebook::OAuth.new(ENV['FB_ID'], ENV['FB_SECRET'])

@graph = Koala::Facebook::API.new(@oauth.get_app_access_token)

search = @graph.search('humans of', {type: 'page'})

search.delete_if {|results| results['name'][0..9] != 'Humans of ' }

search.each do |result|
  jsonpage = @graph.get_object(result['id'])
  if jsonpage['cover'] != nil
    page = Page.find_or_create_by_fb_id(
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
    puts page
  end
end

Page.all.each do |page|
  posts = @graph.graph_call("/#{page.fb_id}/posts", args = {type: 'photos', fields: ['object_id', 'created_time', 'link', 'picture', 'message']})
  posts.each do |post|
    puts "attempting post #{post['object_id']}"
    if post.keys.length == 6
      likes = @graph.fql_query("select like_info from photo where object_id = \"#{post['object_id']}\"")[0]['like_info']['like_count']
      shares = @graph.fql_query("select share_count from link_stat where url = \"#{post['link']}\"")[0]['share_count']
      photo = Photo.find_or_create_by_fb_id(
        fb_id: post['object_id'],
        created_time: post['created_time'],
        likes: likes,
        link: post['link'],
        picture: post['picture'],
        shares: shares,
        message: post['message'],
        page_id: page.id
      )
      puts photo
    end
  end
end
