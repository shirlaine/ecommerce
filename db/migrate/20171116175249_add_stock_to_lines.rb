class AddStockToLines < ActiveRecord::Migration[5.1]
  def change
    add_column :lines, :stock, :integer
    add_column :lines, :sku, :string
  end
end
