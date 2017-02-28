class Visitor < ApplicationRecord
  has_many :notifications, as: :notifiable, dependent: :destroy
  has_many :messages,dependent: :destroy
  has_many :comments,dependent: :destroy

  validates :fullname, presence: true
  validates :email, format: { with: /@/, message: 'is not valid' }

  def is_active?
    if (Message.exists?(visitor_id: self.id) || Comment.exists?(visitor_id: self.id))
      'Active'
    else
      'In Active'
    end
  end
  
  accepts_nested_attributes_for :comments
  accepts_nested_attributes_for :messages

  after_save :notify

  def notify
    notifications.build.save
  end
end
