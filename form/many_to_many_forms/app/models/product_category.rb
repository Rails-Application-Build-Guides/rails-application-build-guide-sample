# == Schema Information
#
# Table name: product_categories # 商品カテゴリ
#
#  id          :integer          not null, primary key
#  product_id  :integer          not null              # 商品ID
#  category_id :integer          not null              # カテゴリID
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class ProductCategory < ActiveRecord::Base
  belongs_to :product
  belongs_to :category
end
