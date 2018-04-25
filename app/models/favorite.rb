class Favorite < ApplicationRecord
  scope :for_root_folder, -> { where(folder_id: nil) }
end
