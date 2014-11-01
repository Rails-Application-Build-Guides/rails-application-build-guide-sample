# == Schema Information
#
# Table name: corporations # 法人
#
#  id         :integer          not null, primary key
#  name       :string(100)      not null              # 名称
#  name_kana  :string(100)      not null              # 名称カナ
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Corporation < ActiveRecord::Base
end
