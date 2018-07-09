# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'open-uri'
require 'json'

def read_url_print_books(url)
  response = open(url).read
  books = JSON.parse(response)
  item = books['items'].each do |item|
    parse_book(item)
  end
end

def parse_book(item)
  book = Book.new
  book.title = item["volumeInfo"]["title"]
  book.subtitle = item["volumeInfo"]["subtitle"]
  book.description = item["volumeInfo"]["description"]
  book.author = item["volumeInfo"]["authors"].join(", ")
  book.publisher = item["volumeInfo"]["publisher"]
  book.publishedDate = item["volumeInfo"]["publishedDate"]
  book.pageCount = item["volumeInfo"]["pageCount"]
  book.imageLinks = item["volumeInfo"]["imageLinks"]
  book.previewLink = item["volumeInfo"]["previewLink"]
  book.save
end

subjects = ['speculative fiction', 'murder mystery', 'german philosophy', 'delia smith', 'roman history']

subjects.each do |s|
  url = "https://www.googleapis.com/books/v1/volumes?q=#{s}&maxResults=8"
  read_url_print_books(url)
end
