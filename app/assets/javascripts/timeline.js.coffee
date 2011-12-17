# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$ ->
  $(".point[data-event]")
    .mouseover ->
      $("#event-#{$(this).data('event')}").addClass("active")
    .mouseout ->
      $("#event-#{$(this).data('event')}").removeClass("active")
    .click ->
      $("#event-#{$(this).data('event')}")[0].scrollIntoView(true);

  $(".event")
    .mouseover ->
      id = $(this).attr("id").split("-")[1]
      $(".point[data-event=#{id}]").addClass("active")
    .mouseout ->
      id = $(this).attr("id").split("-")[1]
      $(".point[data-event=#{id}]").removeClass("active")
