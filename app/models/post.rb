class Post < ApplicationRecord
  validates :body, presence: true
  validates :user_id, presence: true
  belongs_to :user
  has_rich_text :body
end
