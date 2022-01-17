class Post < ApplicationRecord
  validates :body, presence: true
  validates :user_id, presence: true
  belongs_to :user
  mount_uploader :image, ImageUploader
  has_rich_text :body
end
