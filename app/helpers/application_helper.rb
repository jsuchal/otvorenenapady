module ApplicationHelper
  def slovak_pluralize(count, one, two_to_four, five_or_more)
    case count
      when 1  then
        "1 #{one}"
      when 2..4 then
        "#{count} #{two_to_four}"
      else
        "#{count} #{five_or_more}"
    end
  end
end
