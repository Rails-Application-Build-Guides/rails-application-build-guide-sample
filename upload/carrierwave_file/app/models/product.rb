# == Schema Information
#
# Table name: products
#
#  id         :integer          not null, primary key
#  name       :string(255)      not null
#  image      :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Product < ActiveRecord::Base
  mount_uploader :image, ImageUploader

  # Validations
  validates :name, presence: true, length: { maximum: 255 }
  validates :image, presence: true
end
