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

class Form::Product < Product
  REGISTRABLE_ATTRIBUTES = %i(
    name
    arrival_date(1i) arrival_date(2i) arrival_date(3i)
    published_at(1i) published_at(2i) published_at(3i) published_at(4i) published_at(5i)
  )
end
