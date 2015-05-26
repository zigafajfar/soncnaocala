class CreateOrderItems < ActiveRecord::Migration
  def change
    create_table :order_items do |t|
      t.integer :model_id
      t.integer :cart_id

      t.timestamps null: false
    end
  end
end
