module GifHelper
  def fetch_data(search_word)
    Faraday.get("http://api.giphy.com/v1/gifs/search?q=#{search_word}&api_key=dc6zaTOxFJmzC")
  end

  def parse_data(search_word)
    JSON.parse(fetch_data(search_word).body, object_class: OpenStruct)
  end

  def image_url(search_word)
    parse_data(search_word).data.url
  end
end
