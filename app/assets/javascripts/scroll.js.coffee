$.fn.keepInView = (options) ->
  $(this).each ->
    $element = $(this)
    $window = $(window);

    $window.scroll ->
      element_bottom = $element.height() + $element.offset().top
      window_bottom  = $window.height() + $window.scrollTop()

      console.log "element_bottom: #{element_bottom}, window_bottom: #{window_bottom}"

      if window_bottom > options.stopAt
        console.log "backed off at #{options.stopAt}"
        return

      if window_bottom > element_bottom
        new_margin = parseInt($element.css("margin-top"), 10) + (window_bottom - element_bottom)
        console.log "Adjusting margin from bottom to #{new_margin}"
        $element.css("margin-top", "#{new_margin}px")

      element_top = $element.offset().top
      window_top = $window.scrollTop()

      console.log "element_top: #{element_top}, window_top: #{window_top}"

      if window_top < element_top
        new_margin = window_top + 10
        console.log "Adjusting margin from top to #{new_margin}"
        $element.css("margin-top", "#{new_margin}px")
