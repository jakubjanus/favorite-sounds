class CreateFavorites < ActiveRecord::Migration[5.1]
  def change
    create_table :favorites do |t|
      t.integer :sound_id, null: false
      t.integer :user_id, null: false
      t.integer :folder_id
    end
  end
end
