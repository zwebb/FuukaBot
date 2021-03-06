require_relative "search.rb"

class GoogleCommand < SearchCommand
  def initialize
    super
    @description = "Search Google and fetch the first result."
    @base_url = "http://google.com/search?q="
    @result_regex = /<h3 class="r"><a href="\/url\?q=(.*?)&amp;sa.*?">(.*?)<\/a><\/h3>/
  end
end
