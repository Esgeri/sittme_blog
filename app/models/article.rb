class Article < ApplicationRecord
  validates :title, presence: true, length: { minimum: 3, maximum: 50 }
  validates :description, presence: true, length: { minimum: 10 }

  belongs_to :user

  scope :on_created_at, -> { order(created_at: :desc) }
end
