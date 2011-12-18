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

  $(".event")
    .mouseover ->
      id = $(this).attr("id").split("-")[1]
      $(".point[data-event=#{id}]").addClass("active")
      $(".line[data-event=#{id}]").addClass("active")
    .mouseout ->
      id = $(this).attr("id").split("-")[1]
      $(".point[data-event=#{id}]").removeClass("active")
      $(".line[data-event=#{id}]").removeClass("active")

    $(".line")
      .click ->
        $("#event-#{$(this).data('event')}")[0].scrollIntoView(true)



  #$("#timeline").keepInView(stopAt: $("#events").height() + $("#events").offset().top)
