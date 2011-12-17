module TimelineHelper
  def gravatar_for(email, size = 80)
    image_tag("http://www.gravatar.com/avatar/#{Digest::MD5::hexdigest(email)}?s=#{size}", alt: '', size: "#{size}x#{size}")
  end

  def timelineize(events)
    actions = []
    events.each do |event|
      actions << [event.valid_from, :start, event]
      actions << [event.valid_to, :end, event]
      actions << [event.published_at, :point, event]
    end

    actions = actions.sort_by { |action| action[0] }

    depths = {}
    depth = 0
    actions.each do |action|
      _, type, event = action
      case type
        when :start
          depth += 1
          depths[event] = depth
        when :end
          depth -= 1
      end

    end

    min_date = actions.first[0]
    max_date = actions.last[0]

    total_days = (max_date - min_date).to_i

    size = 800

    lines = []
    points = []
    events.each do |event|
      if event.interval?
        length = (event.valid_to - event.valid_from).to_i / total_days.to_f * size
        start = (max_date - event.valid_to).to_i / total_days.to_f * size
        lines << [event, depths[event], start.to_i, length.to_i]
      else
        start = (max_date - event.published_at).to_i / total_days.to_f * size
        points << [event, start.to_i]
      end
    end
    [lines, points]
  end
end
