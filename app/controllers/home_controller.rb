class HomeController < ApplicationController
  def index
    @last_two_posts = Post.order('created_at DESC').limit(2)
    @homepage_listings = Listing.order(sold_at: :desc).limit(3)
    @latest_posts = Post.order('created_at DESC').limit(3)
    feed = Feed.first
    @latest_rss_entries = feed ? feed.entries.order('published DESC').limit(2) : []
  end
end
