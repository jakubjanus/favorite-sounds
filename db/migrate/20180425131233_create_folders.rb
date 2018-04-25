class CreateFolders < ActiveRecord::Migration[5.1]
  def change
    create_table :folders do |t|
      t.string :name, null: false
      t.integer :user_id
    end
  end
end
