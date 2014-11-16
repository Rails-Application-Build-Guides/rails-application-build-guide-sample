# == Schema Information
#
# Table name: contacts
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  content    :text
#  created_at :datetime
#  updated_at :datetime
#

class Contact < ActiveRecord::Base
end
