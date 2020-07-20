class Post < ApplicationRecord
  has_many :comments, dependent: :destroy

  validates :title, presence: true, length: { minimum: 5, maximum: 150 }
  validates :content, presence: true, length: { minimum: 5 }
end
