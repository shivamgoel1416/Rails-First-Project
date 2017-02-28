class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :visitor
  has_many :notifications, as: :notifiable, dependent: :destroy

  validates :message, presence: true
  scope :approved, -> { where status: true}

  after_save :notify

  def notify
    notifications.build.save
  end
end
