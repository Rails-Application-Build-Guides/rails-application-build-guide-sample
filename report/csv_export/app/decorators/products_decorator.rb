class ProductsDecorator < Draper::CollectionDecorator
  delegate :to_csv
end
