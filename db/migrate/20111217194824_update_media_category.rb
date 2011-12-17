# encoding: utf-8
class UpdateMediaCategory < ActiveRecord::Migration
  def up
    execute "UPDATE events SET category = 'Media' WHERE category = 'Správy'"
  end

  def down
  end
end
