# == Schema Information
#
# Table name: categories # カテゴリ
#
#  id         :integer          not null, primary key
#  name       :string(50)       not null              # カテゴリ名
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Category < ActiveRecord::Base
  has_many :product_categories
  has_many :products, through: :product_categories
end
