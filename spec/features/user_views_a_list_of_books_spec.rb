require 'rails_helper'

feature 'user views a list of books', %Q(
  As a user
  I want to view a list of books
  So that I can see the all books added
) do

# Acceptance Criteria:
# * I must see all the books added.
# * Each book must link to the show page for that book.
# * TODO book list pagination

  scenario 'user views a list of book names' do
    books = FactoryGirl.create_list(:book, 3)
    visit books_path

    books.each do |book|
      expect(page).to have_content(book.title)
    end
  end
end
