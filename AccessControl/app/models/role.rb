class Role < ApplicationRecord
  belongs_to :user
  has_many :page
end
