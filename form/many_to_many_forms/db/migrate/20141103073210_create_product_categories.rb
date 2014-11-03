class CreateProductCategories < ActiveRecord::Migration
  def change
    create_table :product_categories do |t|
      t.comment '商品カテゴリ'
      t.integer :product_id,  null: false, comment: '商品ID'
      t.integer :category_id, null: false, comment: 'カテゴリID'

      t.timestamps null: false

      t.foreign_key :products
      t.foreign_key :categories
    end
  end
end
