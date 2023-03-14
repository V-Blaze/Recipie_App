class CreateTableFood < ActiveRecord::Migration[7.0]
  def change
    create_table :foods do |t|
      t.string :name, null: false
      t.string :measurement_unit, null: false
      t.decimal :price, null: false, default: 0.00
      t.integer :quantity, null: false, default: 0
      t.integer :user_id, null: false
      t.timestamps
    end
    add_foreign_key :foods, :users, column: :user_id
  end
end
