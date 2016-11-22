class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :entry

  default_scope -> { order(created_at: :desc) }

  self.per_page = 10

  # Validates
  validates :user_id, presence: true
  validates :entry_id, presence: true
  validates :content, presence: true
end
