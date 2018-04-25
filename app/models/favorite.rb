class Favorite < ApplicationRecord
  scope :for_root_folder, -> { where(folder_id: nil) }

  validates :sound_id, :user_id, presence: true
  validates :sound_id, uniqueness: { scope: :user_id }
end
