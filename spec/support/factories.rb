FactoryGirl.define do
  factory :book do
    sequence(:title) { |n| "Generic Book Title #{n}" }
    author 'Generic Author'
    year 2014
    description 'This is a book.'
    category 'Generic'
  end

  factory :review do
    rating 5
    body 'This is a review.'

    book_id 1
  end
end
