require 'rails_helper'

feature 'user views a specific book', %Q(
  As a user
  I want to view a specific book
  So that I can see that book's details and reviews
) do

# Acceptance Criteria:
# * I must see the book's title, author, year.
# * I must see the book's description and category, if available.
# * I must see the book's reviews
# * TODO review pagination

  scenario 'user views a book show page' do
    book = FactoryGirl.create(:book)
    reviews = FactoryGirl.create_list(:review, 3, book: book)
    visit book_path(book)

    expect(page).to have_content book.title
    expect(page).to have_content book.author
    expect(page).to have_content book.year
    expect(page).to have_content book.description
    expect(page).to have_content book.category

    reviews.each do |review|
      expect(page).to have_content review.rating
      expect(page).to have_content review.body
    end
  end
end
