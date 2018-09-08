class Article < ApplicationRecord
  CATEGORIES = %w[Tech Sport Lifestyle Politics].freeze

  belongs_to :user
  validates :title, presence: true
  validates :category, presence: true
  validates :content, presence: true
end
