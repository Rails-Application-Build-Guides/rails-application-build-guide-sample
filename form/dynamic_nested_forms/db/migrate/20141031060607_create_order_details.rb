class CreateOrderDetails < ActiveRecord::Migration
  def change
    create_table :order_details do |t|
      t.comment '注文明細'
      t.integer :order_id,                 null: false, comment: '注文ID'
      t.integer :product_id,               null: false, comment: '商品ID'
      t.decimal :unit_price,               null: false, comment: '単価'
      t.integer :quantity,                 null: false, comment: '数量'
      t.decimal :price,                    null: false, comment: '小計'

      t.timestamps null: false

      t.foreign_key :orders
      t.foreign_key :products
    end
  end
end
