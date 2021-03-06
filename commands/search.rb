require "uri"
require "open-uri"
require_relative "command.rb"

class SearchCommand < Command
  def initialize
    super
    @usage = "[search term]"
  end

  def call(event, args)
    unsafe_term = args.join(" ")
    safe_term = URI.escape(unsafe_term, "@#$%&+=;:,/? ")

    response = open("#{@base_url}#{safe_term}").read.gsub("\n", "")
    if response =~ @result_regex
      url = "#{@result_url}#{URI.unescape($~[1])}#{@result_url_suffix}"
      event.respond(url)
    else
      event.respond("No results found!")
    end
  end
end
