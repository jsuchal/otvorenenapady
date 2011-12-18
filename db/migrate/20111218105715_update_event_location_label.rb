class UpdateEventLocationLabel < ActiveRecord::Migration
  def up
    execute "UPDATE events SET location_label = regexp_replace(location_label, '\n', ', ')"
    execute "UPDATE events SET location_label = location_label||', '||'Bratislava'  WHERE location_label not like '%Bratislava%'"
  end

  def down
  end
end
