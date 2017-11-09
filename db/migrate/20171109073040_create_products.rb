class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.string :name, null:false
      t.string :description, null:false
      t.string :image, null:false

      t.timestamps
    end
  end
end
