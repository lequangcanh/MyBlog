class Entry < ApplicationRecord
  belongs_to :user

  default_scope -> { order(created_at: :desc) }

  # Validates
  validates :user_id, presence: true
  validates :title, presence: true, length: { maximum: 255 }
  validates :content, presence: true
end
