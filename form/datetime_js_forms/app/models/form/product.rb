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
  include DatetimeIntegratable

  REGISTRABLE_ATTRIBUTES = %i(
    name
    arrival_date
    published_at_date published_at_hour published_at_minute
  )

  integrate_datetime_fields :published_at

  validates :published_at_date, presence: true
  validates :published_at_hour, presence: true
  validates :published_at_minute, presence: true
end
