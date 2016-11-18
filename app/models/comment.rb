class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :entry

  # Validates
  validates :user_id, presence: true
  validates :entry_id, presence: true
  validates :content, presence: true
end
