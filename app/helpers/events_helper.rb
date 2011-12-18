#encoding: utf-8
module EventsHelper
  def event_category_label(event)
    case event.category
    when 'Media' then
      title = "Médiá"
    when 'Review' then
      title = "Recenzie"
    when 'Grant' then
      title = "Granty"
    when 'Discount' then
      title = "Zľava"
    end
    "<span class='label category#{event.category}'>#{title}</span>"
  end
end
