module TimelineHelper
  def gravatar_for(email, size = 80)
    image_tag("http://www.gravatar.com/avatar/#{Digest::MD5::hexdigest(email)}?s=#{size}", alt: '', size: "#{size}x#{size}")
  end

  def timelineize(events)
    actions = []
    events.each do |event|
      if event.interval?
        actions << [event.valid_from, :start, event]
        actions << [event.valid_to, :end, event]
      end
      actions << [event.published_at, :point, event]
    end

    actions = actions.sort_by { |action| action[0] }

    free_slots = Hash.new(true)

    depths = {}
    actions.each do |action|
      _, type, event = action
      case type
        when :start
          (1..10).to_a.each do |i|
            if free_slots[i]
              free_slots[i] = false
              depths[event] = i
              break
            end
          end
        when :end
          free_slots[depths[event]] = true
      end
    end

    min_date = actions.first[0]
    max_date = actions.last[0]

    total_days = (max_date - min_date).to_i

    size = 2000

    lines = []
    events.each do |event|
      if event.interval?
        length = (event.valid_to - event.valid_from).to_i / total_days.to_f * size
        start = (max_date - event.valid_to).to_i / total_days.to_f * size
        lines << [event, depths[event], start.to_i, length.to_i]
      end
    end

    points = []
    last_start = 2000
    events.sort_by(&:published_at).each do |event|
      start = (max_date - event.published_at).to_i / total_days.to_f * size
      if ((start - last_start).abs < 12) && points.last
        points.last[2] += 1
      else
        points << [event, start.to_i, 1]
        last_start = start
      end
    end

    [lines, points]
  end
end
