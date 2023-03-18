class AddIndexToFoods < ActiveRecord::Migration[7.0]
  def change
    add_index :foods, :user_id
  end
end
