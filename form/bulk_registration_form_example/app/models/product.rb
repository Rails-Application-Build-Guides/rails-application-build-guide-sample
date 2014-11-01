# == Schema Information
#
# Table name: products
#
#  id            :integer          not null, primary key
#  code          :string(10)       not null                 # 商品コード
#  name          :string(50)       not null                 # 商品名
#  name_kana     :string(50)       default(""), not null    # 商品名カナ
#  price         :integer          not null                 # 商品価格
#  purchase_cost :integer          not null                 # 仕入原価
#  availability  :boolean          default(FALSE), not null # 販売可能フラグ
#  created_at    :datetime
#  updated_at    :datetime
#

class Product < ActiveRecord::Base
  validates :code, presence: true, length: { maximum: 10 }
  validates :name, presence: true, length: { maximum: 50 }
  validates :name_kana, kana: true, length: { maximum: 50 }
  validates :price, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :purchase_cost, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :availability, inclusion: { in: [true, false] }
end
