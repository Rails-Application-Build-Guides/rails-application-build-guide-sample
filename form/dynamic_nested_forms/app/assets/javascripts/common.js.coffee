$ ->
  $(@).on 'change', '.unit-price, .quantity', ->
    unit_price = $(@)
      .parents('.nested-fields')
      .find('.unit-price')
      .first()
      .val()
    quantity = $(@)
      .parents('.nested-fields')
      .find('.quantity')
      .first()
      .val()
    total = parseInt(unit_price) * parseInt(quantity)
    if total
      $(@)
        .parents('.nested-fields')
        .find('.subtotal')
        .val("#{total}")
        .change()

  $(@).on 'change', '.subtotal', ->
    total = 0
    subtotals = $(@)
      .parents()
      .find('.subtotal')
      .each(-> total += parseInt($(@).val()))
    $('.total').val("#{total}円")
