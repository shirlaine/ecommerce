class RemoveColumnFromLine < ActiveRecord::Migration[5.1]
  def change
    remove_column :lines, :quantity
  end
end
