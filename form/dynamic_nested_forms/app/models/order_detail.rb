# == Schema Information
#
# Table name: order_details # 注文明細
#
#  id         :integer          not null, primary key
#  order_id   :integer          not null              # 注文ID
#  product_id :integer          not null              # 商品ID
#  unit_price :integer          not null              # 単価
#  quantity   :integer          not null              # 数量
#  price      :integer          not null              # 小計
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class OrderDetail < ActiveRecord::Base
  belongs_to :order
  belongs_to :product
end
