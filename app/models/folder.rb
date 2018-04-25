class Folder < ApplicationRecord
  scope :for_user, ->(user_id) { where(user_id: user_id) }

  validates :name, :user_id, presence: true
  validates :name, uniqueness: { scope: :user_id }
end
