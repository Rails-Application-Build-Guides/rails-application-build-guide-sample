class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.comment '商品'
      t.string  :name,          limit: 50, null: false, comment: '商品名'
      t.date :arrival_date, null: false, comment: '入荷予定日'
      t.datetime :published_at, null: false, comment: '公開予定日時'

      t.timestamps null: false
    end
  end
end
