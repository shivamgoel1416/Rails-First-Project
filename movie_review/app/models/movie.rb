class Movie < ApplicationRecord
  belongs_to :user
  mount_uploader :image, ImageUploader
  # has_attached_file :image, styles: { medium: "400x600#>"}
  # validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
  has_many :reviews, dependent: :destroy
end
