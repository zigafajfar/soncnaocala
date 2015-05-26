class CreateModels < ActiveRecord::Migration
  def change
    create_table :models do |t|
      t.string :name
      t.integer :brand_id
      t.float :price
      t.text :description

      t.timestamps null: false
    end
  end
end
