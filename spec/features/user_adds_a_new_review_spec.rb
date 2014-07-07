require 'rails_helper'

feature 'user adds a new review', %Q(
  As a user
  I want to add a new review
  So that I can share my opinions with other users
) do

# Acceptance Criteria:
# * I must specify a rating and body.
# * I must see a success message if submission is successful.
# * I must see an error message if submission is unsuccessful.

  # before :each do
  #   @book = FactoryGirl.create(:book)
  #   visit book_path(@book)
  # end

  context 'user completes required fields' do

    scenario 'user successfully adds a new review' do
      @book = FactoryGirl.create(:book)
      visit book_path(@book)

      @review = FactoryGirl.create(:review)
      fill_in 'Body', with: @review.body

      fill_in 'Rating', with: @review.rating
      click_on 'Create Review'

      expect(page).to have_content 'Success'
      expect(page).to have_content @review.rating
      expect(page).to have_content @review.body
    end

    scenario 'user enters invalid rating' do
      @book = FactoryGirl.create(:book)
      visit book_path(@book)

      @review = FactoryGirl.create(:review)
      fill_in 'Body', with: @review.body

      fill_in 'Rating', with: 7
      click_on 'Create Review'

      expect(page).to_not have_content 'Success'
      expect(page).to have_content "is not included"
    end
  end

  scenario 'user enters incomplete review information' do
    @book = FactoryGirl.create(:book)
    visit book_path(@book)

    click_on 'Create Review'

    expect(page).to_not have_content 'Success'
    expect(page).to have_content "can't be blank"
  end
end
