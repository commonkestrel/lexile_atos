require 'faraday'
require 'uri'

module Lexile
  BASE_URL = URI("https://atlas-fab.lexile.com")
  REQUEST_HEADERS = {
    "Accept" => "application/json;version=1.0",
    "Authentication" => ""
  }

  def Lexile.search(isbn)
    options = {}

    @conn ||= Faraday.new(
      url: BASE_URL,
      headers: REQUEST_HEADERS,
    ) do |f|
      f.response :json, **options
    end

    response = @conn.get("/free/books/#{isbn}")

    if response.body["success"]
      response.body["data"]
    else
      puts "failed"
      puts response
      nil
    end
  end
end
