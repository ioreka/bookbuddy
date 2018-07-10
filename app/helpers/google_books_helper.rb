require 'open-uri'
require 'json'

module GoogleBooksHelper

  def search_for_books(search)
    url = "https://www.googleapis.com/books/v1/volumes?q=#{search}&maxResults=8"
    read_url_into_books(url)
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
    Book.find_or_create_by(
      title: item["volumeInfo"]["title"],
      subtitle: item["volumeInfo"]["subtitle"],
      description: item["volumeInfo"]["description"],
      author: item["volumeInfo"]["authors"].join(", "),
      publisher: item["volumeInfo"]["publisher"],
      publishedDate: item["volumeInfo"]["publishedDate"],
      pageCount: item["volumeInfo"]["pageCount"],
      imageLinks: item["volumeInfo"]["imageLinks"]["smallThumbnail"],
      previewLink: item["volumeInfo"]["previewLink"]
    )
  end
end
