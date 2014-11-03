# == Schema Information
#
# Table name: products # 商品
#
#  id            :integer          not null, primary key
#  code          :string(10)       not null              # 商品コード
#  name          :string(50)       not null              # 商品名
#  name_kana     :string(50)       default(""), not null # 商品名カナ
#  price         :integer          not null              # 商品価格
#  purchase_cost :integer          not null              # 仕入原価
#  availability  :boolean          not null              # 販売可能フラグ
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Form::Product < Product
  include HabtmReservedUpdatable

  REGISTRABLE_ATTRIBUTES = %i(
    code name name_kana price purchase_cost availability
  )
  REGISTRABLE_RELATIONS = [category_ids: []]

  has_and_belongs_to_many_reserved_update :categories, through: :product_categories

  def selectable_categories
    Category.all
  end
end
