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

class Order < ActiveRecord::Base
  belongs_to :corporation
  has_many :order_details, dependent: :destroy
  has_many :products, through: :order_details

  accepts_nested_attributes_for :order_details, allow_destroy: true
end
