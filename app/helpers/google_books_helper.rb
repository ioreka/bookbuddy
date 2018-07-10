require 'open-uri'
require 'json'

module GoogleBooksHelper

  def search_for_books(search)
    url = "https://www.googleapis.com/books/v1/volumes?q=#{search}&maxResults=8"
    read_url_into_books(url).reject { |e| e.to_s.empty? }
  end

  private
  def read_url_into_books(url)
    response = open(url).read
    book_response = JSON.parse(response)
    book_response['items'].map do |item|
      parse_book_and_return_instance(item)
    end
  end

  def parse_book_and_return_instance(item)
    begin
    item = item["volumeInfo"]
      Book.find_or_create_by(
        title: item["title"],
        subtitle: item["subtitle"],
        description: item["description"],
        author: item["authors"].join(", "),
        publisher: item["publisher"],
        publishedDate: item["publishedDate"],
        pageCount: item["pageCount"],
        imageLinks: item["imageLinks"]["smallThumbnail"],
        previewLink: item["previewLink"]
      )
    rescue
      puts "This book cannot be created"
    end
  end
end
