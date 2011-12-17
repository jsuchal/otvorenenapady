$ ->
  $("[data-toggle-id]")
    .click ->
      $("##{$(this).data('toggle-id')}").toggle();