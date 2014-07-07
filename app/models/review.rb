class Review < ActiveRecord::Base
  validates :rating, presence: true, inclusion: { within: 1..5 }
  validates :body, presence: true
  validates :book, presence: true

  belongs_to :book
end
