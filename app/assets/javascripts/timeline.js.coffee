# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$ ->
  $(".point[data-event]")
    .mouseover ->
      $.each $(this).data('event').toString().split(','), (idx, id )-> 
        highlightEvent(id, "highlight")
        $(".line[data-event=#{id}]").addClass("active")
    .mouseout ->
      $.each $(this).data('event').toString().split(','), (idx, id )->
        highlightEvent(id, "unhighlight")
        $(".line[data-event=#{id}]").removeClass("active")
    .click ->
      first_id = $(this).data('event').toString().split(',')[0]
      scrollEventIntoView($("#event-#{first_id}"))
      return false
    .popover(html: true, animate: false)

  $(".event")
    .mouseover ->
      id = $(this).attr("id").split("-")[1]
      $(".point[data-event=#{id}]").addClass("active")
      $(".line[data-event=#{id}]").addClass("active")
      updatePointClass(id, "add")
    .mouseout ->
      id = $(this).attr("id").split("-")[1]
      $(".point[data-event=#{id}]").removeClass("active")
      $(".line[data-event=#{id}]").removeClass("active")
      updatePointClass(id, "remove")

    $(".line")
      .click ->
        scrollEventIntoView($("#event-#{$(this).data('event')}"))
        return false
      .popover(html: true, animate: false, placement: 'mouse')
      .mouseover ->
        return unless $(this).data('event')
        rel_event_id = $(this).data('event').toString()
        updatePointClass(rel_event_id, "add")
        highlightEvent(rel_event_id, "highlight")
      .mouseout ->
        return unless $(this).data('event')
        rel_event_id = $(this).data('event').toString()
        updatePointClass(rel_event_id, "remove")
        highlightEvent(rel_event_id, "unhighlight")

  updatePointClass = (event_id, action) ->
    $(".point[data-event]").each (element) ->
      $element = $(this)
      if $element.data('event').toString().split(',').indexOf(event_id) != -1
        if action == "add"
          $element.addClass("active")
        else
          $element.removeClass("active")
        return

  highlightEvent = (event_id, action) ->
    if action == "highlight"
      $('.event').addClass('inactive')
      $("#event-#{event_id}").removeClass("inactive").addClass("active")
    else
      $('.event').removeClass('inactive')
      $("#event-#{event_id}").removeClass("active")

  scrollEventIntoView = ($element) ->
    $(document).scrollTop($element.offset().top - 50)

