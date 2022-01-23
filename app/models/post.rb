class Post < ApplicationRecord
  validates :body, presence: true
  belongs_to :admin, optional: true
  has_rich_text :body
end
