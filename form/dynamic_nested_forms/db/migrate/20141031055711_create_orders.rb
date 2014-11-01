class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.comment '注文'
      t.string  :name,           limit: 100, null: false, comment: '注文名称'
      t.integer :corporation_id,             null: false, comment: '取引先'
      t.decimal :price,                      null: false, comment: '合計金額'

      t.timestamps null: false

      t.foreign_key :corporations
    end
  end
end
