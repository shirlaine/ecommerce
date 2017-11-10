class CreateLines < ActiveRecord::Migration[5.1]
  def change
    create_table :lines do |t|
      t.decimal :price, null: false
      t.integer :quantity, null: false
      t.integer :size, default: 0
      t.references :product, index: true
      t.timestamps
    end
  end
end
