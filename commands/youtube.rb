require_relative "search.rb"

class YoutubeCommand < SearchCommand
  def initialize
    super
    @description = "Search Youtube and fetch the first result."
    @base_url = "https://youtube.com/results?search_query="
    @result_regex = /<h3 class="yt-lockup-title "><a href="(.*?)"/
    @result_url = "https://youtube.com"
  end
end
