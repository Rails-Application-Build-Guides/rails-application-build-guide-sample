# == Schema Information
#
# Table name: orders # 注文
#
#  id             :integer          not null, primary key
#  name           :string(100)      not null              # 注文名称
#  corporation_id :integer          not null              # 取引先
#  price          :integer          not null              # 合計金額
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class Form::Order < Order
  REGISTRABLE_ATTRIBUTES = %i(name corporation_id price)
  has_many :order_details, class_name: 'Form::OrderDetail'

  after_initialize { order_details.build unless self.persisted? || order_details.present? }
  before_validation :calculate_order_price

  def selectable_corporations
    Corporation.all
  end

  private

  def calculate_order_price
    order_details.each(&:calculate_order_detail_price)
    self.price = order_details.map(&:price).sum
  end
end
