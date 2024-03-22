class CreateProducts < ActiveRecord::Migration[7.1]
  def change
    create_table :products do |t|
      t.string :name
      t.string :category
      t.decimal :price
      t.string :description
      t.string :image

      t.timestamps
    end
  end
end
