class ProductDecorator < Draper::Decorator
  delegate_all

  def sales_condition
    if availability
      h.content_tag :span, class: 'label label-success' do
        "販売中"
      end
    else
      h.content_tag :span, class: 'label label-default' do
        "販売不可"
      end
    end
  end

  def display_price
    h.number_to_currency price
  end

  def display_purchase_cost
    h.number_to_currency purchase_cost
  end
end
