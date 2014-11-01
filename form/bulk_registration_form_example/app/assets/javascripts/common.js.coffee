$ ->
  $('.bulk-registration-form .form-control').change ->
    $(@)
      .parents('.item')
      .find('.registration-checkbox')
      .prop('checked', true)
