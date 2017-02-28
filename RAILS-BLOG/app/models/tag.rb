class Tag < ApplicationRecord
  has_many :posts,  through: :post_tags

  validates :name, presence: true
  def in_use?
    if PostTag.exists?(tag_id: self.id)
      "In Use"
    else
      "Not In Use"
    end
  end
end
