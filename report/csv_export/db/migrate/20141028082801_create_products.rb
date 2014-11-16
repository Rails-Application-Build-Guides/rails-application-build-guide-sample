class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string  :code,          limit: 10, null: false,              comment: '商品コード'
      t.string  :name,          limit: 50, null: false,              comment: '商品名'
      t.string  :name_kana,     limit: 50, null: false, default: '', comment: '商品名カナ'
      t.integer :price,                    null: false,              comment: '商品価格'
      t.integer :purchase_cost,            null: false,              comment: '仕入原価'
      t.boolean :availability,             null: false,              comment: '販売可能フラグ'

      t.timestamps
    end
  end
end
