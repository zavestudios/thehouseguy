class HomeController < ApplicationController
  def index
    @last_two_posts = Post.order('created_at DESC').limit(2)
    @get_homepage_props = RetsWebService.new.get_homepage_props 
    #@image = RetsWebService.new.get_homepage_props
    @latest_posts = Post.order('created_at DESC').limit(3)
    feed = Feed.first
    @latest_rss_entries = feed ? feed.entries.order('published DESC').limit(2) : []
  end
end
