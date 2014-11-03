class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.comment 'カテゴリ'
      t.string :name, limit: 50, null: false, comment: 'カテゴリ名'

      t.timestamps null: false
    end
  end
end
