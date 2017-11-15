class ChangeColumnInProducts < ActiveRecord::Migration[5.1]
  def change
    change_column :products, :image, :string, null: true
  end
end
