class Entry < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy

  default_scope -> { order(created_at: :desc) }

  # Validates
  validates :user_id, presence: true
  validates :title, presence: true, length: { maximum: 255 }
  validates :content, presence: true

  # paginate
  self.per_page = 10
end
