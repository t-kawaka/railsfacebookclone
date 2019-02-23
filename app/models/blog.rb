class Blog < ApplicationRecord
  default_scope -> { order(created_at: :desc) }
  belongs_to :user
  mount_uploader :image, ImageUploader
  validates :content, presence: true
  validates :image, presence: true
end
