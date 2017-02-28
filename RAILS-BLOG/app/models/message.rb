class Message < ApplicationRecord
  belongs_to :visitor
  
  validates :content, presence: true

  def mark_read
    update(status: true) if status == false
  end
end
