# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$ ->
  $(".point[data-event]")
    .mouseover ->
      $.each $(this).data('event').toString().split(','), (idx, id )-> 
        $("#event-#{id}").addClass("active")
        $(".line[data-event=#{id}]").addClass("active")
    .mouseout ->
      $.each $(this).data('event').toString().split(','), (idx, id )->
        $("#event-#{id}").removeClass("active")
        $(".line[data-event=#{id}]").removeClass("active")
    .click ->
      first_id = $(this).data('event').toString().split(',')[0]
      $("#event-#{first_id}")[0].scrollIntoView(true)
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
        $("#event-#{$(this).data('event')}")[0].scrollIntoView(true)
      .popover(html: true, animate: false)
      .mouseover ->
        return unless $(this).data('event')
        rel_event_id = $(this).data('event').toString()
        updatePointClass(rel_event_id, "add")
      .mouseout ->
        return unless $(this).data('event')
        rel_event_id = $(this).data('event').toString()
        updatePointClass(rel_event_id, "remove")

  updatePointClass = (event_id, action) ->
    $(".point[data-event]").each (element) ->
      $element = $(this)
      if $element.data('event').toString().split(',').indexOf(event_id) != -1
        if action == "add"
          $element.addClass("active")
        else
          $element.removeClass("active")

        return
