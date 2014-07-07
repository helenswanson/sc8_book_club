FactoryGirl.define do
  factory :book do
    sequence(:title) { |n| "Generic Book Title #{n}" }
    author 'Generic Author'
    year 2014
    description 'This is a book.'
    category 'Generic'
  end
end
