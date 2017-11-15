class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.references :user, foreign_key: true, index: true
      t.references :line, foreign_key: true, index: true
      t.timestamps
    end
  end
end
