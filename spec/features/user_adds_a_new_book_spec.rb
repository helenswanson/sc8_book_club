require 'rails_helper'

feature 'user adds a new book', %Q(
  As a user
  I want to add a new book
  So that I can expand the list of books
) do

# Acceptance Criteria:
# * I must specify the book's title, author, and year published.
# * I need to the option to specify the book's description and category.
# * I must see a success message if submission is successful.
# * I must see an error message if submission is unsuccessful.

  before :each do
    visit new_book_path
  end

  scenario 'user successfully adds a new book' do
    book = FactoryGirl.create(:book)

    fill_in 'Title',        with: book.title
    fill_in 'Author',       with: book.author
    fill_in 'Year',         with: book.year
    fill_in 'Description',  with: book.description
    fill_in 'Category',     with: book.category
    click_on 'Create Book'

    expect(page).to have_content 'Success'
    expect(page).to have_content book.title
    expect(page).to have_content book.author
    expect(page).to have_content book.year
    expect(page).to have_content book.description
    expect(page).to have_content book.category
  end

  scenario 'user submits incomplete book information' do
    click_on 'Create Book'

    expect(page).to_not have_content 'Success'
    # you might want to test that you have can't be blank errors for each required attribute.
    # e.g.:
    within '.book_title' do
      expect(page).to have_content "can't be blank"
    end

    within '.book_author' do
      expect(page).to have_content "can't be blank"
    end

    within '.book_year' do
      expect(page).to have_content "can't be blank"
    end
  end
end
