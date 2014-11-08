# == Schema Information
#
# Table name: products # 商品
#
#  id           :integer          not null, primary key
#  name         :string(50)       not null              # 商品名
#  arrival_date :date             not null              # 入荷予定日
#  published_at :datetime         not null              # 公開予定日時
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Product < ActiveRecord::Base
  validates :name, presence: true, length: { maximum: 50 }
  validates :arrival_date, presence: true
  validates :published_at , presence: true
end
