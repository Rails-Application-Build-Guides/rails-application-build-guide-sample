class KanaValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    unless value =~ /\A([ァ-ヴーA-Za-z0-9\s]+)\z/
      record.errors[attribute] << (options[:message] || "はカタカナで入力してください")
    end
  end
end
