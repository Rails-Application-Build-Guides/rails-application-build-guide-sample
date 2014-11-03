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

class Form::ProductCategory < ProductCategory
  REGISTRABLE_ATTRIBUTES = %i(id product_id category_id _destroy)

  def selectable_categories
    Category.all
  end
end
