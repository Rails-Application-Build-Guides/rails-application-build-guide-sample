module HabtmReservedUpdatable
  extend ActiveSupport::Concern

  included do
  end

  module ClassMethods
    def has_and_belongs_to_many_reserved_update(relation, through: :through_relation_name)
      alias_method "old_#{through}", through
      alias_method "old_#{relation}", relation
      define_method("#{relation.to_s.singularize}_ids=") do |ids|
        valid_ids = ids.reject(&:blank?).map(&:to_s)
        old_through_relations = self.send("old_#{through}")
        id_name = "#{relation.to_s.singularize}_id"
        old_through_relations.each do |m|
          m.mark_for_destruction unless valid_ids.include? m.send(id_name).to_s
        end
        (valid_ids - self.send(relation).map(&:id).map(&:to_s)).each do |id|
          old_through_relations.new(id_name => id)
        end
      end
      define_method(through) do
        self.send("old_#{through}").reject(&:_destroy)
      end
      define_method(relation) do
        self.send(through).map { |o| o.send("#{relation.to_s.singularize}") }
      end
      define_method("#{relation.to_s.singularize}_ids") do
        self.send(relation).map(&:id)
      end
    end
  end
end
